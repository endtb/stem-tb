import org.joda.time.DateTime
import org.joda.time.Days
import org.openmrs.module.bahmniemrapi.drugogram.contract.BaseTableExtension
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniObservation
import org.openmrs.module.bahmniemrapi.pivottable.contract.PivotRow
import org.openmrs.module.bahmniemrapi.pivottable.contract.PivotTable
import org.openmrs.module.emrapi.encounter.domain.EncounterTransaction
import org.openmrs.Obs;
import org.bahmni.module.bahmnicore.service.impl.BahmniBridge;

import java.text.DateFormat
import java.text.SimpleDateFormat

public class CurrentHospitalizationExtension extends BaseTableExtension<PivotTable> {

    /**
     *  Given a set of Hospitalization Admission Notifications, this pulls out the
     *  most recent admission date and compares it to the most recent discharge date
     *  (from the Hospitalization Discharge summary).  If admission
     *  date after discharge date, will modify the pivot table to contain a single
     *  row with the most recent admission date and calculated current days hospitalized
     *  Otherwise, should return empty pivot table
     **/
    @Override
    public void update(PivotTable pivotTable, String patientUuid, String patientProgramUuid) {

        BahmniBridge bahmniBridge = BahmniBridge
                .create()
                .forPatient(patientUuid)
                .forPatientProgram(patientProgramUuid);

        Date latestDischargeDate = null;
        Date mostRecentAdmissionDateWithoutSuccesiveDischarge = null;
        PivotRow rowToUse = null;

        Obs latestObs = bahmniBridge.latestObs("HDS, Hospital discharge date");
        latestDischargeDate = (latestObs != null ? latestObs.getValueDatetime() : null);

        for (PivotRow pivotRow : pivotTable.getRows()) {
            Date admissionDate = getDateFromColumn(pivotRow, "HAN, Hospital admission date");
            if (admissionDate != null && (mostRecentAdmissionDateWithoutSuccesiveDischarge == null || admissionDate.after(mostRecentAdmissionDateWithoutSuccesiveDischarge))
                    && (latestDischargeDate == null || latestDischargeDate.before(admissionDate))) {
                rowToUse = pivotRow;
                mostRecentAdmissionDateWithoutSuccesiveDischarge = admissionDate;
            }
        }

        if (rowToUse != null) {
            EncounterTransaction.Concept daysHospitalized = new EncounterTransaction.Concept();
            daysHospitalized.setName("Current days hospitalized");
            pivotTable.getHeaders().add(daysHospitalized);
            rowToUse.addColumn("Current days hospitalized", createDaysHospitalized(mostRecentAdmissionDateWithoutSuccesiveDischarge, daysHospitalized));
            pivotTable.setRows(Collections.singletonList(rowToUse));
        }
        else {
            pivotTable.setRows(Collections.emptyList());
        }
    }


    private BahmniObservation createDaysHospitalized(Date hospitalizationDate, EncounterTransaction.Concept daysHospitalized) {
        Days days = Days.daysBetween(new DateTime(hospitalizationDate), new DateTime());
        BahmniObservation bahmniObservation = new BahmniObservation();
        bahmniObservation.setConcept(daysHospitalized);
        bahmniObservation.setValue(days.getDays());

    }

    private static Date getDateFromColumn(PivotRow pivotRow, String column) {
        ArrayList<BahmniObservation> obs = pivotRow.getColumns().get(column);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return df.parse(obs.get(0).getValueAsString());
        } catch (Exception e) {
            return null;
        }
    }
}