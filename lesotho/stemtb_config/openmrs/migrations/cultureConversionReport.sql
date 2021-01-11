CREATE PROCEDURE cultureConversionReport(startDate date, endDate date )
BEGIN

	DROP TABLE if EXISTS tempculture;
	DROP TABLE if EXISTS tempRegister;
	DROP TABLE if EXISTS tempsmear;
	
	call culture_conversion();
	call smear_conversion();
	call Basic_register(startDate, endDate);

select
	tr.*,
	MAX( IF( ts.TreatmentMonth = 'baseline', ts.SmearResults, NULL )) as 'Smear baseline',
        MAX( IF( tc.TreatmentMonth = 'baseline', tc.CultureDateofCollection, NULL )) as 'Date baseline',
	MAX( IF( tc.TreatmentMonth = 'baseline', tc.CultureResults, NULL )) as 'Cult baseline',	
	MAX( IF( ts.TreatmentMonth = 'M1', ts.SmearResults, NULL )) as 'Smear M1',
	MAX( IF( tc.TreatmentMonth = 'M1', tc.CultureDateofCollection, NULL )) as 'Date M1',
	MAX( IF( tc.TreatmentMonth = 'M1', tc.CultureResults, NULL )) as 'Cult M1',
	MAX( IF( ts.TreatmentMonth = 'M2', ts.SmearResults, NULL )) as 'Smear M2',
	MAX( IF( tc.TreatmentMonth = 'M2', tc.CultureDateofCollection, NULL )) as 'Date M2',
	MAX( IF( tc.TreatmentMonth = 'M2', tc.CultureResults, NULL )) as 'Cult M2',
	MAX( IF( ts.TreatmentMonth = 'M3', ts.SmearResults, NULL )) as 'Smear M3',
	MAX( IF( tc.TreatmentMonth = 'M3', tc.CultureDateofCollection, NULL )) as 'Date M3',
	MAX( IF( tc.TreatmentMonth = 'M3', tc.CultureResults, NULL )) as 'Cult M3',
	MAX( IF( ts.TreatmentMonth = 'M4', ts.SmearResults, NULL )) as 'Smear M4',
	MAX( IF( tc.TreatmentMonth = 'M4', tc.CultureDateofCollection, NULL )) as 'Date M4',
	MAX( IF( tc.TreatmentMonth = 'M4', tc.CultureResults, NULL )) as 'Cult M4',
	MAX( IF( ts.TreatmentMonth = 'M5', ts.SmearResults, NULL )) as 'Smear M5',
	MAX( IF( tc.TreatmentMonth = 'M5', tc.CultureDateofCollection, NULL )) as 'Date M5',
	MAX( IF( tc.TreatmentMonth = 'M5', tc.CultureResults, NULL )) as 'Cult M5',
	MAX( IF( ts.TreatmentMonth = 'M6', ts.SmearResults, NULL )) as 'Smear M6',
	MAX( IF( tc.TreatmentMonth = 'M6', tc.CultureDateofCollection, NULL )) as 'Date M6',
	MAX( IF( tc.TreatmentMonth = 'M6', tc.CultureResults, NULL )) as 'Cult M6',
	MAX( IF( ts.TreatmentMonth = 'M7', ts.SmearResults, NULL )) as 'Smear M7',
	MAX( IF( tc.TreatmentMonth = 'M7', tc.CultureDateofCollection, NULL )) as 'Date M7',
	MAX( IF( tc.TreatmentMonth = 'M7', tc.CultureResults, NULL )) as 'Cult M7',
	MAX( IF( ts.TreatmentMonth = 'M8', ts.SmearResults, NULL )) as 'Smear M8',
	MAX( IF( tc.TreatmentMonth = 'M8', tc.CultureDateofCollection, NULL )) as 'Date M8',
	MAX( IF( tc.TreatmentMonth = 'M8', tc.CultureResults, NULL )) as 'Cult M8',
	MAX( IF( ts.TreatmentMonth = 'M9', ts.SmearResults, NULL )) as 'Smear M9',
	MAX( IF( tc.TreatmentMonth = 'M9', tc.CultureDateofCollection, NULL )) as 'Date M9',
	MAX( IF( tc.TreatmentMonth = 'M9', tc.CultureResults, NULL )) as 'Cult M9',
	MAX( IF( ts.TreatmentMonth = 'M10', ts.SmearResults, NULL )) as 'Smear M10',
	MAX( IF( tc.TreatmentMonth = 'M10', tc.CultureDateofCollection, NULL )) as 'Date M10',
	MAX( IF( tc.TreatmentMonth = 'M10', tc.CultureResults, NULL )) as 'Cult M10',
	MAX( IF( ts.TreatmentMonth = 'M11', ts.SmearResults, NULL )) as 'Smear M11',
	MAX( IF( tc.TreatmentMonth = 'M11', tc.CultureDateofCollection, NULL )) as 'Date M11',
	MAX( IF( tc.TreatmentMonth = 'M11', tc.CultureResults, NULL )) as 'Cult M11',
	MAX( IF( ts.TreatmentMonth = 'M12', ts.SmearResults, NULL )) as 'Smear M12',
	MAX( IF( tc.TreatmentMonth = 'M12', tc.CultureDateofCollection, NULL )) as 'Date M12',
	MAX( IF( tc.TreatmentMonth = 'M12', tc.CultureResults, NULL )) as 'Cult M12',
	MAX( IF( ts.TreatmentMonth = 'M13', ts.SmearResults, NULL )) as 'Smear M13',
	MAX( IF( tc.TreatmentMonth = 'M13', tc.CultureDateofCollection, NULL )) as 'Date M13',
	MAX( IF( tc.TreatmentMonth = 'M13', tc.CultureResults, NULL )) as 'Cult M13',
	MAX( IF( ts.TreatmentMonth = 'M14', ts.SmearResults, NULL )) as 'Smear M14',
	MAX( IF( tc.TreatmentMonth = 'M14', tc.CultureDateofCollection, NULL )) as 'Date M14',
	MAX( IF( tc.TreatmentMonth = 'M14', tc.CultureResults, NULL )) as 'Cult M14',
	MAX( IF( ts.TreatmentMonth = 'M15', ts.SmearResults, NULL )) as 'Smear M15',
	MAX( IF( tc.TreatmentMonth = 'M15', tc.CultureDateofCollection, NULL )) as 'Date M15',
	MAX( IF( tc.TreatmentMonth = 'M15', tc.CultureResults, NULL )) as 'Cult M15',
	MAX( IF( ts.TreatmentMonth = 'M16', ts.SmearResults, NULL )) as 'Smear M16',
	MAX( IF( tc.TreatmentMonth = 'M16', tc.CultureDateofCollection, NULL )) as 'Date M16',
	MAX( IF( tc.TreatmentMonth = 'M16', tc.CultureResults, NULL )) as 'Cult M16',
	MAX( IF( ts.TreatmentMonth = 'M17', ts.SmearResults, NULL )) as 'Smear M17',
	MAX( IF( tc.TreatmentMonth = 'M17', tc.CultureDateofCollection, NULL )) as 'Date M17',
	MAX( IF( tc.TreatmentMonth = 'M17', tc.CultureResults, NULL )) as 'Cult M17',
	MAX( IF( ts.TreatmentMonth = 'M18', ts.SmearResults, NULL )) as 'Smear M18',
	MAX( IF( tc.TreatmentMonth = 'M18', tc.CultureDateofCollection, NULL )) as 'Date M18',
	MAX( IF( tc.TreatmentMonth = 'M18', tc.CultureResults, NULL )) as 'Cult M18',
	MAX( IF( ts.TreatmentMonth = 'M19', ts.SmearResults, NULL )) as 'Smear M19',
	MAX( IF( tc.TreatmentMonth = 'M19', tc.CultureDateofCollection, NULL )) as 'Date M19',
	MAX( IF( tc.TreatmentMonth = 'M19', tc.CultureResults, NULL )) as 'Cult M19',
	MAX( IF( ts.TreatmentMonth = 'M20', ts.SmearResults, NULL )) as 'Smear M20',
	MAX( IF( tc.TreatmentMonth = 'M20', tc.CultureDateofCollection, NULL )) as 'Date M20',
	MAX( IF( tc.TreatmentMonth = 'M10', tc.CultureResults, NULL )) as 'Cult M20',
	MAX( IF( ts.TreatmentMonth = 'M21', ts.SmearResults, NULL )) as 'Smear M21',
	MAX( IF( tc.TreatmentMonth = 'M21', tc.CultureDateofCollection, NULL )) as 'Date M21',
	MAX( IF( tc.TreatmentMonth = 'M21', tc.CultureResults, NULL )) as 'Cult M21',
	MAX( IF( ts.TreatmentMonth = 'M22', ts.SmearResults, NULL )) as 'Smear M22',
	MAX( IF( tc.TreatmentMonth = 'M22', tc.CultureDateofCollection, NULL )) as 'Date M22',
	MAX( IF( tc.TreatmentMonth = 'M22', tc.CultureResults, NULL )) as 'Cult M22',
	MAX( IF( ts.TreatmentMonth = 'M23', ts.SmearResults, NULL )) as 'Smear M23',
	MAX( IF( tc.TreatmentMonth = 'M23', tc.CultureDateofCollection, NULL )) as 'Date M23',
	MAX( IF( tc.TreatmentMonth = 'M23', tc.CultureResults, NULL )) as 'Cult M23',
	MAX( IF( ts.TreatmentMonth = 'M24', ts.SmearResults, NULL )) as 'Smear M24',
	MAX( IF( tc.TreatmentMonth = 'M24', tc.CultureDateofCollection, NULL )) as 'Date M24',
	MAX( IF( tc.TreatmentMonth = 'M24', tc.CultureResults, NULL )) as 'Cult M24',
	MAX( IF( ts.TreatmentMonth = 'M25', ts.SmearResults, NULL )) as 'Smear M25',
	MAX( IF( tc.TreatmentMonth = 'M25', tc.CultureDateofCollection, NULL )) as 'Date M25',
	MAX( IF( tc.TreatmentMonth = 'M25', tc.CultureResults, NULL )) as 'Cult M25',
	MAX( IF( ts.TreatmentMonth = 'M26', ts.SmearResults, NULL )) as 'Smear M26',
	MAX( IF( tc.TreatmentMonth = 'M26', tc.CultureDateofCollection, NULL )) as 'Date M26',
	MAX( IF( tc.TreatmentMonth = 'M26', tc.CultureResults, NULL )) as 'Cult M26',
	MAX( IF( ts.TreatmentMonth = 'M27', ts.SmearResults, NULL )) as 'Smear M27',
	MAX( IF( tc.TreatmentMonth = 'M27', tc.CultureDateofCollection, NULL )) as 'Date M27',
	MAX( IF( tc.TreatmentMonth = 'M27', tc.CultureResults, NULL )) as 'Cult M27',
	MAX( IF( ts.TreatmentMonth = 'M28', ts.SmearResults, NULL )) as 'Smear M28',
	MAX( IF( tc.TreatmentMonth = 'M28', tc.CultureDateofCollection, NULL )) as 'Date M28',
	MAX( IF( tc.TreatmentMonth = 'M28', tc.CultureResults, NULL )) as 'Cult M28',
	MAX( IF( ts.TreatmentMonth = 'M29', ts.SmearResults, NULL )) as 'Smear M29',
	MAX( IF( tc.TreatmentMonth = 'M29', tc.CultureDateofCollection, NULL )) as 'Date M29',
	MAX( IF( tc.TreatmentMonth = 'M29', tc.CultureResults, NULL )) as 'Cult M29',
	MAX( IF( ts.TreatmentMonth = 'M30', ts.SmearResults, NULL )) as 'Smear M30',
	MAX( IF( tc.TreatmentMonth = 'M30', tc.CultureDateofCollection, NULL )) as 'Date M30',
	MAX( IF( tc.TreatmentMonth = 'M30', tc.CultureResults, NULL )) as 'Cult M30',
	MAX( IF( ts.TreatmentMonth = 'M31', ts.SmearResults, NULL )) as 'Smear M31',
	MAX( IF( tc.TreatmentMonth = 'M31', tc.CultureDateofCollection, NULL )) as 'Date M31',
	MAX( IF( tc.TreatmentMonth = 'M31', tc.CultureResults, NULL )) as 'Cult M31',
	MAX( IF( ts.TreatmentMonth = 'M32', ts.SmearResults, NULL )) as 'Smear M32',
	MAX( IF( tc.TreatmentMonth = 'M32', tc.CultureDateofCollection, NULL )) as 'Date M32',
	MAX( IF( tc.TreatmentMonth = 'M32', tc.CultureResults, NULL )) as 'Cult M32',
	MAX( IF( ts.TreatmentMonth = 'M33', ts.SmearResults, NULL )) as 'Smear M33',
	MAX( IF( tc.TreatmentMonth = 'M33', tc.CultureDateofCollection, NULL )) as 'Date M33',
	MAX( IF( tc.TreatmentMonth = 'M33', tc.CultureResults, NULL )) as 'Cult M33',
	MAX( IF( ts.TreatmentMonth = 'M34', ts.SmearResults, NULL )) as 'Smear M34',
	MAX( IF( tc.TreatmentMonth = 'M34', tc.CultureDateofCollection, NULL )) as 'Date M34',
	MAX( IF( tc.TreatmentMonth = 'M34', tc.CultureResults, NULL )) as 'Cult M34',
	MAX( IF( ts.TreatmentMonth = 'M35', ts.SmearResults, NULL )) as 'Smear M35',
	MAX( IF( tc.TreatmentMonth = 'M35', tc.CultureDateofCollection, NULL )) as 'Date M35',
	MAX( IF( tc.TreatmentMonth = 'M35', tc.CultureResults, NULL )) as 'Cult M35',
	MAX( IF( ts.TreatmentMonth = 'M36', ts.SmearResults, NULL )) as 'Smear M36',
	MAX( IF( tc.TreatmentMonth = 'M36', tc.CultureDateofCollection, NULL )) as 'Date M36',
	MAX( IF( tc.TreatmentMonth = 'M36', tc.CultureResults, NULL )) as 'Cult M36'
from
	tempRegister as tr
LEFT OUTER JOIN tempculture as tc on
	tr.patient_program_id = tc.patient_program_id
LEFT OUTER JOIN tempsmear as ts on
	tr.patient_program_id = ts.patient_program_id
group by
	tr.patient_program_id;

END

