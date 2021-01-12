Bahmni.ConceptSet.FormConditions.rules = {  
'Baseline, Employment within the past year': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Employment within the past year'];
        if (conditionConcept == "Other") {
            conditions.enable.push("Baseline, Other employment")
        } else {
            conditions.disable.push("Baseline, Other employment")
        }
        return conditions;
    },
    'Baseline, Prison': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Prison'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, Is prison past or present")
        } else {
            conditions.disable.push("Baseline, Is prison past or present")
        }
        return conditions;
    },
    'Baseline, Is alcoholic': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Is alcoholic'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, How many alcoholic drinks per week")
        } else {
            conditions.disable.push("Baseline, How many alcoholic drinks per week")
        }
        return conditions;
    },
    'Baseline, HIV serostatus result': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, HIV serostatus result'];
        if (conditionConcept == "Positive") {
            conditions.enable.push("Date of HIV diagnosis", "Baseline, CD4 count details", "CD4 date", "Baseline, HIV Viral Load Details", "Baseline, Viral Load Date", "Antiretroviral treatment start date", "Baseline, On ARV treatment", "Baseline, Drugs used in ARV treatment")
        } else {
            conditions.disable.push("Date of HIV diagnosis", "Baseline, CD4 count details", "CD4 date", "Baseline, HIV Viral Load Details", "Baseline, Viral Load Date", "Antiretroviral treatment start date", "Baseline, On ARV treatment", "Baseline, Drugs used in ARV treatment")
        }
        return conditions;
    },
    'Baseline, Reason for next assessment': function (formName, formFieldValues) {
        var otherReasonLine = "Baseline, Other assessment reason";
        var conditionConcept = formFieldValues['Baseline, Reason for next assessment'];
        if (conditionConcept == 'Other assessment') {
            return {enable: [otherReasonLine]}
        } else {
            return {disable: [otherReasonLine]}
        }
    },
    'Diabetes Mellitus': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Diabetes Mellitus'];
        if (conditionConcept == "True") {
            conditions.enable.push("glycosylated hemoglobin A measurement")
        } else {
            conditions.disable.push("glycosylated hemoglobin A measurement")
        }
        return conditions;
    },
    'Baseline, Has cancer': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Has cancer'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, Cancer type")
        } else {
            conditions.disable.push("Baseline, Cancer type")
        }
        return conditions;
    },
    'Baseline, Heart or atherosclerotic disease': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, Heart or atherosclerotic disease'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, Type of heart disease")
        } else {
            conditions.disable.push("Baseline, Type of heart disease")
        }
        return conditions;
    },
    'Baseline, Has other psychiatric illness': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Has other psychiatric illness'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, Psychiatric illness type")
        } else {
            conditions.disable.push("Baseline, Psychiatric illness type")
        }
        return conditions;
    },
    'Baseline, Pre-existing neuropathy': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, Pre-existing neuropathy'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, Neuropathy grade")
        } else {
            conditions.disable.push("Baseline, Neuropathy grade")
        }
        return conditions;
    },
    'StemTB Baseline, WHO registration group': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Baseline, WHO registration group'];
        if ( conditionConcept == "StemTB Baseline Transfer in (from another MDR-TB)" || conditionConcept == "Relapse" || conditionConcept == "Treatment after loss to followup" || conditionConcept == "Treatment After Failure to Drugs" || conditionConcept == "Other previously treated patients") {
            conditions.enable.push("Category IV tuberculosis classification")
        } else {
            conditions.disable.push("Category IV tuberculosis classification")
        }
        return conditions;
    },
    'Baseline, Disease site': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var enExtraPul = "Baseline, Exact extrapulmonary site";
        var conditionConcept = formFieldValues['Baseline, Disease site'];
        if (conditionConcept && conditionConcept.indexOf("Extrapulmonary") > -1) {
            conditions.enable.push(enExtraPul);
        } else {
            conditions.disable.push(enExtraPul);
        }
        return conditions;
    },
    'Baseline, MDR-TB diagnosis method': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, MDR-TB diagnosis method'];
        if (conditionConcept == "Bacteriologically Confirmed") {
            conditions.enable.push("Baseline, Method of MDR-TB confirmation");
        } else {
            conditions.disable.push("Baseline, Method of MDR-TB confirmation", "Baseline, Other method of MDR-TB confirmation")
        }
        return conditions;
    },
    'Baseline, Method of MDR-TB confirmation': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, Method of MDR-TB confirmation'];
        if (conditionConcept != null) {
            if (conditionConcept.indexOf("Other") > -1) {
                conditions.enable.push("Baseline, Other method of MDR-TB confirmation")
            }
            else {
                conditions.disable.push("Baseline, Other method of MDR-TB confirmation")
            }
        }
        else {
            conditions.disable.push("Baseline, Other method of MDR-TB confirmation")
        }
        return conditions;
    },
    'Baseline, Drug resistance': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Drug resistance'];
        if (conditionConcept == "Confirmed drug resistant TB") {
            conditions.enable.push("Baseline, Subclassification for confimed drug resistant cases")
        } else {
            conditions.disable.push("Baseline, Subclassification for confimed drug resistant cases")
        }
        return conditions;
    },
    'Baseline, Drug Allergies': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, Drug Allergies'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, Which Drug Allergies")
        } else {
            conditions.disable.push("Baseline, Which Drug Allergies")
        }
        return conditions;
    },
    'Baseline, Has the patient ever been treated for TB in the past?': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var conditionConcept = formFieldValues['Baseline, Has the patient ever been treated for TB in the past?'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, If Yes, What was the year of the patients start of first TB treatment Details", "Baseline, Treatment for drug-susceptible TB", "Baseline, Treatment for drug-resistant TB");
        } else {
            conditions.disable.push("Baseline, If Yes, What was the year of the patients start of first TB treatment Details", "Baseline, Treatment for drug-susceptible TB", "Baseline, Treatment for drug-resistant TB");
        }
        return conditions;
    },
    'Baseline, Treatment for drug-susceptible TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Treatment for drug-susceptible TB'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, How many drug-susceptible TB treatments", "Baseline, What is the outcome of the last DSTB treatment", "Baseline, Last DSTB Registration ID Details", "Baseline, Last DSTB treatment registration facility")
        } else {
            conditions.disable.push("Baseline, How many drug-susceptible TB treatments", "Baseline, What is the outcome of the last DSTB treatment", "Baseline, Last DSTB Registration ID Details", "Baseline, Last DSTB treatment registration facility")
        }
        return conditions;
    },
    'Baseline, Treatment for drug-resistant TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Treatment for drug-resistant TB'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, How many drug-resistant TB treatments", "Baseline, What is the outcome of the last DRTB treatment", "Baseline, Last DRTB Registration ID Details", "Baseline, Last DRTB treatment registration facility")
        } else {
            conditions.disable.push("Baseline, How many drug-resistant TB treatments", "Baseline, What is the outcome of the last DRTB treatment", "Baseline, Last DRTB Registration ID Details", "Baseline, Last DRTB treatment registration facility")
        }
        return conditions;
    },
    'TI, Did the patient start treatment': function (formName, formFieldValues) {
        var enStartDate = "TUBERCULOSIS DRUG TREATMENT START DATE";
        var enReason = "TI, Reason for not starting treatment";
        var txFacility = "TI, Treatment facility at start";
        var txRegimen = "TI, Type of treatment regimen";
        var firstLine = "TI, First line drug regimen type";
        var secondLine = "TI, Second line regimen drug type";
        var dateOfDeath = "TI, Date of death before treatment start";
        var conditionConcept = formFieldValues['TI, Did the patient start treatment'];
        if (conditionConcept == false) {
            return {enable: [enReason], disable: [enStartDate, txFacility, txRegimen, firstLine, secondLine]}
        } else if (conditionConcept == true) {
            return {enable: [enStartDate, txFacility, txRegimen], disable: [enReason, dateOfDeath]}
        }
        else {
            return {disable: [enStartDate, txFacility, txRegimen, firstLine, secondLine, enReason, dateOfDeath]}
        }
    },
    'TI, Type of treatment regimen': function (formName, formFieldValues) {
        var txRegimen = "TI, Type of treatment regimen";
        var firstLine = "TI, First line drug regimen type";
        var secondLine = "TI, Second line regimen drug type";
        var conditionConcept = formFieldValues['TI, Type of treatment regimen'];
        if (conditionConcept == 'Only 1st line drugs') {
            return {enable: [firstLine], disable: [secondLine]}
        } else if (conditionConcept == 'Regimen including 2nd line drugs') {
            return {enable: [secondLine], disable: [firstLine]}
        } else {
            return {disable: [firstLine, secondLine]}
        }
    },
    'TI, Currently pregnant': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TI, Currently pregnant'];
        if (conditionConcept == "True") {
            conditions.enable.push("Estimated date of confinement")
        } else {
            conditions.disable.push("Estimated date of confinement")
        }
        return conditions;
    },
    'TI, Eligible for new drugs': function (formName, formFieldValues) {
        var conditions = {
            enable: [],
            disable: []
        };
        var enDate = "TI, Date of eligibility for new drugs";
        var en4Drugs = "ti_patients_const_four_drug_regimen_not_possible";
        var enUnfavourable = "ti_oth_patient_high_risk_unfavourable";
        var result = formFieldValues['TI, Eligible for new drugs'];
        if (result == "True") {
            conditions.enable.push(enDate, en4Drugs, enUnfavourable);
        } else {
            conditions.disable.push(enDate, en4Drugs, enUnfavourable);
        }
        return conditions;
    },
    'TI, Reason for not starting treatment': function (formName, formFieldValues) {
        var conditionConcept = formFieldValues['TI, Reason for not starting treatment'];
        var deathDT = "TI, Date of death before treatment start";

        if (conditionConcept == "Died") {
            return {enable: [deathDT]}
        } else {
            return {disable: [deathDT]}
        }
    },
    'TI, Reason for next assessment': function (formName, formFieldValues) {
        var otherReasonLine = "TI, Other assessment reason";
        var conditionConcept = formFieldValues['TI, Reason for next assessment'];
        if (conditionConcept == 'Other assessment') {
            return {enable: [otherReasonLine]}
        } else {
            return {disable: [otherReasonLine]}
        }
    },
    'Followup, Currently Pregnant': function (formName, formFieldValues) {
        var conceptToEnable = "Followup, Pregnancy form case ID number";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Followup, Currently Pregnant'];
        if (conditionConcept == "True") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Followup, Is alcoholic': function (formName, formFieldValues) {
        var conceptToEnable = "Followup, How many alcoholic drinks per week";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Followup, Is alcoholic'];
        if (conditionConcept == "True") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Followup, New AE reported': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Followup, New AE reported'];
        var conceptToEnable = "Followup, New AE reference number";
        var conceptEnSAE = "Followup, New serious AE reported";
        var conceptSAERefNum = "Followup, New serious AE reference number";
        if (conditionConcept != null) {
            if (conditionConcept == true) {
                conditions.enable.push(conceptToEnable, conceptEnSAE, conceptSAERefNum)
            } else {
                conditions.disable.push(conceptToEnable, conceptEnSAE, conceptSAERefNum)
            }
        } else {
            conditions.disable.push(conceptToEnable, conceptEnSAE, conceptSAERefNum)
        }
        return conditions;
    },
    'Followup, New serious AE reported': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Followup, New serious AE reported'];
        var conceptToEnable = "Followup, New serious AE reference number";
        if (conditionConcept) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Followup, Admitted into a hospital for any reason': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Followup, Admitted into a hospital for any reason'];
        var conceptToEnable = "Followup, Date of hospital admission since last visit";
        if (conditionConcept) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Followup, Reason for next visit': function (formName, formFieldValues) {
        var otherReasonLine = "Followup, Other assessment reason";
        var conditionConcept = formFieldValues['Followup, Reason for next visit'];
        if (conditionConcept == 'Other assessment') {
            return {enable: [otherReasonLine]}
        } else {
            return {disable: [otherReasonLine]}
        }
    },
    'EOT, Outcome': function (formName, formFieldValues) {
        var enDOD = "DATE OF DEATH";
        var enCOD = "EOT, Suspected primary cause of death";
        var conditions = {enable: [], disable: []};
        var outcome = formFieldValues['EOT, Outcome'];
        var enSurgery = "EOT, Type of surgery related to death";
        var enNonTB = "EOT, Non TB cause of death";
        var enReason = "EOT, Reasons for failure definition";
        var enOther = "EOT, Other reasons for failure definition";
        var withdrawal = "All Oral STR, Withdrawal";
        if (outcome == "Died") {
            conditions.enable.push(enDOD, enCOD);
        } else {
            conditions.disable.push(enDOD, enCOD, enSurgery, enNonTB);
        }
        if (outcome == "Failed") {
            conditions.enable.push(enReason);
        } else {
            conditions.disable.push(enReason, enOther);
        }
        var enInterruption = "EOT, Reasons for treatment interrruption";
        var enAdditional = "EOT, Additional information on treatment interruption";
        var enOtherReasons = "EOT, Other reasons for treatment interruption";
        if (outcome == "LTFU") {
            conditions.enable.push(enInterruption, enAdditional);
        } else {
            conditions.disable.push(enInterruption, enAdditional, enOtherReasons);
        }
        var enTransferOut = "EOT, Did the patient transfer out";
        var enTransferred = "EOT, Transferred to where";
        var enOtherReason = "EOT, Other reasons for no evaluation of outcome";
        if (outcome == "Not Evaluated") {
            conditions.enable.push(enTransferOut);
        } else {
            conditions.disable.push(enTransferOut, enTransferred, enOtherReason);
        }
        if (outcome == "All Oral STR, Withdrawn") {
                    conditions.enable.push(withdrawal);
                } else {
                    conditions.disable.push(withdrawal);
                }
        return conditions;
    },
    'EOT, Suspected primary cause of death': function (formName, formFieldValues) {
        var enSurgery = "EOT, Type of surgery related to death";
        var enNonTB = "EOT, Non TB cause of death";
        var conditions = {enable: [], disable: []};
        var suspectCause = formFieldValues['EOT, Suspected primary cause of death'];
        if (suspectCause == "Surgery related death") {
            conditions.enable.push(enSurgery)
        } else {
            conditions.disable.push(enSurgery);
        }
        if (suspectCause == "Cause other than TB") {
            conditions.enable.push(enNonTB);
        } else {
            conditions.disable.push(enNonTB);
        }
        return conditions;
    },
    'EOT, Reasons for failure definition': function (formName, formFieldValues) {
        var enOther = "EOT, Other reasons for failure definition";
        var conditions = {enable: [], disable: []};
        var suspectCause = formFieldValues['EOT, Reasons for failure definition'];
        if (suspectCause != null) {
            if (suspectCause.indexOf("Other") > -1) {
                conditions.enable.push(enOther)
            } else {
                conditions.disable.push(enOther);
            }
        } else {
            conditions.disable.push(enOther);
        }
        return conditions;
    },
    'EOT, Reasons for treatment interrruption': function (formName, formFieldValues) {
        var enOther = "EOT, Other reasons for treatment interruption";
        var conditions = {enable: [], disable: []};
        var suspectCause = formFieldValues['EOT, Reasons for treatment interrruption'];
        if (suspectCause != null) {
            if (suspectCause.indexOf("Other") > -1) {
                conditions.enable.push(enOther)
            } else {
                conditions.disable.push(enOther);
            }
        } else {
            conditions.disable.push(enOther);
        }
        return conditions;
    },
    'EOT, Did the patient transfer out': function (formName, formFieldValues) {
        var enTransferred = "EOT, Transferred to where"
        var enOtherReason = "EOT, Other reasons for no evaluation of outcome";
        var conditions = {enable: [], disable: []};
        var transferResponse = formFieldValues['EOT, Did the patient transfer out'];
        if (transferResponse == true) {
            conditions.enable.push(enTransferred);
            conditions.disable.push(enOtherReason);
        } else if (transferResponse == false) {
            conditions.disable.push(enTransferred);
            conditions.enable.push(enOtherReason);
        } else {
            conditions.disable.push(enTransferred, enOtherReason);
        }
        return conditions;
    },
    '6m PTO, 6 month post treatment outcome': function (formName, formFieldValues) {
        var conceptToEnable_dateOfDeath = "6m PTO, Date of death post treatment";
        var conceptToEnable_causeOfDeath = "6m PTO, Suspected primary cause of death";
        var conceptToEnable_reason = "6m PTO, Reasons for no post treatment followup";
        var conceptToEnable_commentsOnNoFup = "6m PTO, Comments on no post treatment followup";
        var conceptToEnable_transfer = "6m PTO, Transfer out post treatment";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['6m PTO, 6 month post treatment outcome'];
        var conceptToEnable_surgeryType = "6m PTO, Type of surgery related to post treatment death";
        var conceptToEnable_nonTBCauseOfDeath = "6m PTO, Non TB cause of post treatment death";
        if (conditionConcept == "Died post treatment") {
            conditions.enable.push(conceptToEnable_dateOfDeath, conceptToEnable_causeOfDeath);
        } else {
            conditions.disable.push(conceptToEnable_dateOfDeath, conceptToEnable_causeOfDeath, conceptToEnable_surgeryType, conceptToEnable_nonTBCauseOfDeath);
        }
        var conceptToEnable_otherReason = "6m PTO, Other reasons for no post treatment followup";
        if (conditionConcept == "LTFU post treatment") {
            conditions.enable.push(conceptToEnable_reason, conceptToEnable_commentsOnNoFup);
        } else {
            conditions.disable.push(conceptToEnable_reason, conceptToEnable_commentsOnNoFup, conceptToEnable_otherReason)
        }
        var conceptToEnable_onYes = "6m PTO, Transferred to where post treatment";
        var conceptToEnable_onNo = "6m PTO, Other reasons for no post treatment outcome";
        if (conditionConcept == "Not Evaluated") {
            conditions.enable.push(conceptToEnable_transfer);
        } else {
            conditions.disable.push(conceptToEnable_transfer, conceptToEnable_onYes, conceptToEnable_onNo)
        }
        return conditions;
    },
    '6m PTO, Suspected primary cause of death': function (formName, formFieldValues) {
        var conceptToEnable_surgeryType = "6m PTO, Type of surgery related to post treatment death";
        var conceptToEnable_nonTBCauseOfDeath = "6m PTO, Non TB cause of post treatment death";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['6m PTO, Suspected primary cause of death'];
        if (conditionConcept == "Surgery related death") {
            conditions.enable.push(conceptToEnable_surgeryType)
        } else {
            conditions.disable.push(conceptToEnable_surgeryType)
        }
        if (conditionConcept == "Cause other than TB") {
            conditions.enable.push(conceptToEnable_nonTBCauseOfDeath)
        } else {
            conditions.disable.push(conceptToEnable_nonTBCauseOfDeath)
        }
        return conditions;
    },
    '6m PTO, Reasons for no post treatment followup': function (formName, formFieldValues) {
        var conceptToEnable = "6m PTO, Other reasons for no post treatment followup";
        var conditions = {enable: [], disable: []};
        var SAETerm = formFieldValues['6m PTO, Reasons for no post treatment followup'];
        if (SAETerm != null) {
            if (SAETerm.indexOf("Other") != -1) {
                conditions.enable.push(conceptToEnable)
            } else {
                conditions.disable.push(conceptToEnable)
            }
        }
        return conditions;
    },
    '6m PTO, Transfer out post treatment': function (formName, formFieldValues) {
        var conceptToEnable_onYes = "6m PTO, Transferred to where post treatment";
        var conceptToEnable_onNo = "6m PTO, Other reasons for no post treatment outcome";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['6m PTO, Transfer out post treatment'];
        if (conditionConcept == true) {
            conditions.enable.push(conceptToEnable_onYes)
        } else {
            conditions.disable.push(conceptToEnable_onYes)
        }
        if (conditionConcept == false) {
            conditions.enable.push(conceptToEnable_onNo)
        } else {
            conditions.disable.push(conceptToEnable_onNo)
        }
        return conditions;
    },
    'AE Form, AE term comprehensive list': function (formName, formFieldValues) {
        var conceptToEnable = "AE Form, Other AE term";
        var conditions = {enable: [], disable: []};
        var AETerm = formFieldValues['AE Form, AE term comprehensive list'];
        if (AETerm && (AETerm == "Other" || AETerm.value == "Other")) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'AE Form, AE related test': function (formName, formFieldValues) {
        var conceptToEnable = "AE form, other related test";
        var conditions = {enable: [], disable: []};
        var AETerm = formFieldValues['AE Form, AE related test'];
        if (AETerm && (AETerm == "Other" || AETerm.value == "Other")) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'AE Form, Is AE an SAE': function (formName, formFieldValues) {
        var enSAENumber = "AE Form, SAE Case Number";
        var enDateOutcome = "AE Form, Date of AE Outcome";
        var enAEOutcome = "StemTB, AE outcome";
        var enMaxSeverity = "StemTB, Maximum severity of AE";
        var enRelatedTBDrugs = "StemTB, AE related to TB drugs";
        var enTBDrugTx = "AE Form, TB drug treatment";
        var enOtherCausalFact = "AE Form, Other causal factors";
        var enOtherCausalFactorsRelatedToAE = "AE Form, Other causal factors related to AE";

        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AE Form, Is AE an SAE'];
        if (conditionConcept == true) {
            conditions.enable.push(enSAENumber);
            conditions.disable.push(enDateOutcome, enAEOutcome, enMaxSeverity, enRelatedTBDrugs, enTBDrugTx, enOtherCausalFact, enOtherCausalFactorsRelatedToAE)
        } else {
            conditions.disable.push(enSAENumber);
            conditions.enable.push(enDateOutcome, enAEOutcome, enMaxSeverity, enRelatedTBDrugs,enTBDrugTx, enOtherCausalFact, enOtherCausalFactorsRelatedToAE)
        }
        return conditions;
    },
    'AE Form, Other causal factors related to AE': function (formName, formFieldValues) {
        var enNonTBDrug = "AE Form, Non TB drug of other causal factor";
        var enComorbidity = "AE Form, Comorbidity of other causal factor";
        var enOtherCausalFactors = "AE Form, Other causal factor";
        var conditions = {enable: [], disable: []};
        var anyFactor = formFieldValues['AE Form, Other causal factors related to AE'];
        if (anyFactor != null) {
            if (anyFactor.indexOf("Non TB drugs") > -1) {
                conditions.enable.push(enNonTBDrug)
            } else {
                conditions.disable.push(enNonTBDrug)
            }
            if (anyFactor.indexOf("Co-morbidity") > -1) {
                conditions.enable.push(enComorbidity)
            } else {
                conditions.disable.push(enComorbidity)
            }
            if (anyFactor.indexOf("Other") > -1) {
                conditions.enable.push(enOtherCausalFactors)
            } else {
                conditions.disable.push(enOtherCausalFactors)
            }
        } else {
            conditions.disable.push(enNonTBDrug, enComorbidity, enOtherCausalFactors)
        }
        return conditions;
    },
    'SAE Form, Previously reported as AE': function (formName, formFieldValues) {
        var previousAE = "SAE Form, AE ID if previously reported as AE";
        var conditions = {enable: [], disable: []};
        var PreviouslyReportedAE = formFieldValues['SAE Form, Previously reported as AE'];
        if (PreviouslyReportedAE == true) {
            conditions.enable.push(previousAE)
        } else {
            conditions.disable.push(previousAE)
        }
        return conditions;
    },
    'SAE Form, SAE term comprehensive AE list': function (formName, formFieldValues) {
        var conceptToEnable = "SAE Form, Other SAE term";
        var conditions = {enable: [], disable: []};
        var SAETerm = formFieldValues['SAE Form, SAE term comprehensive AE list'];
        if (SAETerm && (SAETerm == "Other" || SAETerm.value == "Other")) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'SAE Form, Related test': function (formName, formFieldValues) {
        var conceptToEnable = "SAE form, other related test";
        var conditions = {enable: [], disable: []};
	var concept1 = "SAE Form, Related test lab ID";
	var concept2 = "SAE Form, Related test date";
	var concept3 = "SAE Form, Related test value";
	var concept4 = "StemTB, Reference range";
        var SAETerm = formFieldValues['SAE Form, Related test'];
if (SAETerm && (SAETerm == "Other" || SAETerm.value == "Other")) {
            conditions.enable.push(conceptToEnable, concept1, concept2, concept3, concept4)
        } else {
            conditions.disable.push(conceptToEnable)
        }
	 if (SAETerm == "Related Test, Hemoglobin" || SAETerm == "Related Test, Hematocrit" || SAETerm == "Related Test, Platelet count" || SAETerm == "Related Test, RBC count" || SAETerm == "Related Test, WBC count" || SAETerm == "Related Test, Absolute neutrophil count" || SAETerm == "Related Test, % neutrophils" || SAETerm == "Related Test, Potassium" || SAETerm == "Related Test, Magnesium" || SAETerm == "Related Test, Ionised Calcium" || SAETerm == "Related Test, Urea" || SAETerm == "Related Test, Creatinine" || SAETerm == "Related Test, Glucose" || SAETerm == "Related Test, Glucose (Fasting)" || SAETerm == "Related Test, HbA1c" || SAETerm == "Related Test, TSH" || SAETerm == "Related Test, Lipase" || SAETerm == "Related Test, AST (SGOT)" || SAETerm == "Related Test, ALT (SGPT)" || SAETerm == "Related Test, Total bilirubin" || SAETerm == "Related Test, Pregnancy test" || SAETerm == "Related Test, CD4 count" || SAETerm == "Related Test, Serum albumin" || SAETerm == "Related Test, Audiometry" || SAETerm == "Related Test, QtcF" || SAETerm == "Related Test, Other ECG" || SAETerm == "Related Test, Blood pressure" || SAETerm == "Related Test, Visual acuity" || SAETerm == "Related Test, Ishihara test" || SAETerm == "Related Test, BPNS" || SAETerm == "Related Test, EMG") {
            conditions.enable.push(concept1, concept2, concept3, concept4)
        } else {
            conditions.disable.push(concept1, concept2, concept3, concept4)
        }
        return conditions;
    },
    'SAE Form, Other causal factors related to SAE': function (formName, formFieldValues) {
        var enNonTBDrug = "SAE Form, Non TB drug of other causal factors";
        var enComorbidity = "SAE Form, Comorbidity of other causal factors";
        var enOtherCausalFactors = "SAE Form, Other causal factor";
        var conditions = {enable: [], disable: []};
        var anyFactor = formFieldValues['SAE Form, Other causal factors related to SAE'];
        if (anyFactor != null) {
            if (anyFactor.indexOf("Non TB drugs") > -1) {
                conditions.enable.push(enNonTBDrug)
            } else {
                conditions.disable.push(enNonTBDrug)
            }
            if (anyFactor.indexOf("Co-morbidity") > -1) {
                conditions.enable.push(enComorbidity)
            } else {
                conditions.disable.push(enComorbidity)
            }
            if (anyFactor.indexOf("Other") > -1) {
                conditions.enable.push(enOtherCausalFactors)
            } else {
                conditions.disable.push(enOtherCausalFactors)
            }
        } else {
            conditions.disable.push(enNonTBDrug, enComorbidity, enOtherCausalFactors)
        }
        return conditions;
    },
    'PRF, Pregnancy in TB patient or partner': function (formName, formFieldValues) {
        var conceptToEnable_dob = "PRF, Date of birth of partner";
        var conceptToEnable_partner = "PRF, Partners initials";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Pregnancy in TB patient or partner'];
        if (conditionConcept == "Partner") {
            conditions.enable.push(conceptToEnable_partner, conceptToEnable_dob)
        } else {
            conditions.disable.push(conceptToEnable_partner, conceptToEnable_dob)
        }
        return conditions;
    },
    'PRF, Complication during pregnancy': function (formName, formFieldValues) {
        var conceptToEnable = "PRF, Explain pregnancy complications";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Complication during pregnancy'];
        if (conditionConcept == true) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'PRF, Gave birth to a live child': function (formName, formFieldValues) {
        var conceptToEnable_true = "PRF, Date of delivery";
        var conceptToEnable_false = "PRF, Reason for not giving birth to a live child";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Gave birth to a live child'];
        if (conditionConcept == true) {
            conditions.enable.push(conceptToEnable_true)
        } else {
            conditions.disable.push(conceptToEnable_true)
        }
        if (conditionConcept == false) {
            conditions.enable.push(conceptToEnable_false)
        } else {
            conditions.disable.push(conceptToEnable_false)
        }
        return conditions;
    },
    'PRF, Infant normal at birth': function (formName, formFieldValues) {
        var conceptToEnable = "PRF, Reason for infant abnormal at birth";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PRF, Infant normal at birth'];
        if (conditionConcept == false) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Treatment Facility Name': function (formName, formFieldValues) {
        var conceptToEnable = "Other treatment facility name";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Treatment Facility Name'];
        if (conditionConcept == "Other") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'HDS, Reason for hospitalization': function causeOfDeathLogics(formName, formFieldValues) {
        var conceptEnOther = "HDS, Other reason for hospitalization";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Reason for hospitalization'];
        if (conditionConcept == "Other") {
            conditions.enable.push(conceptEnOther)
        } else {
            conditions.disable.push(conceptEnOther)
        }
        return conditions;
    },
    'HDS, New AE Reported': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, New AE Reported'];
        var conceptToEnable = "HDS, New AE ID number";
        var conceptEnSAE = "HDS, New SAE reported";
        var conceptSAERefNum = "HDS, New SAE Case number";
        if (conditionConcept != null) {
            if (conditionConcept == true) {
                conditions.enable.push(conceptToEnable, conceptEnSAE, conceptSAERefNum)
            } else {
                conditions.disable.push(conceptToEnable, conceptEnSAE, conceptSAERefNum)
            }
        } else {
            conditions.disable.push(conceptToEnable, conceptEnSAE, conceptSAERefNum)
        }
        return conditions;
    },
    'HDS, New SAE reported': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, New SAE reported'];
        var conceptToEnable = "HDS, New SAE Case number";
        if (conditionConcept == true) {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'HDS, Hospital name': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Hospital name'];
        var conceptToEnable = "HDS, Other hospital name";
        if (conditionConcept == "Other") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'HDS, TB related surgery while hospitalization': function causeOfDeathLogics(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, TB related surgery while hospitalization'];
        if (conditionConcept == true) {
            conditions.enable.push("HDS, TB related surgery date", "HDS, Type of TB related surgery", "HDS, Side of TB related surgery", "HDS, Indication of TB related surgery");
        } else {
            conditions.disable.push("HDS, TB related surgery date", "HDS, Type of TB related surgery", "HDS, Side of TB related surgery", "HDS, Indication of TB related surgery")
        }
        return conditions;
    },
    'HDS, Type of TB related surgery': function causeOfDeathLogics(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Type of TB related surgery'];
        if (conditionConcept != null) {
            if (conditionConcept.indexOf("Other") > -1) {
                conditions.enable.push("HDS, Other type of TB related surgery");
            } else {
                conditions.disable.push("HDS, Other type of TB related surgery");
            }
        } else {
            conditions.disable.push("HDS, Other type of TB related surgery");
        }
        return conditions;
    },
    'HDS, Indication of TB related surgery': function causeOfDeathLogics(formName, formFieldValues) {
        var conceptToEnable = "HDS, Other indication of TB related surgery";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, Indication of TB related surgery'];
        if (conditionConcept == "Other") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    
    'Audiometry, Type of visit': function (formName, formFieldValues) {
        var conceptToEnable = "Audiometry, Month of scheduled visit";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Audiometry, Type of visit'];
        if (conditionConcept == "Scheduled monthly visit") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Audiometry, Reporting audiometry related AE': function (formName, formFieldValues) {
        var conceptToEnable = "Audiometry, AE ID number";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Audiometry, Reporting audiometry related AE'];
        if (conditionConcept == "True") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'EKG, Type of visit': function (formName, formFieldValues) {
        var conceptToEnable = "EKG, Month of scheduled visit";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['EKG, Type of visit'];
        if (conditionConcept == "Scheduled monthly visit") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'EKG, Rhythm': function causeOfDeathLogics(formName, formFieldValues) {
        var conceptToEnable = "EKG, Other Rhythm";
        var conditions = {enable: [], disable: []};
        var SAETerm = formFieldValues['EKG, Rhythm'];
        if (SAETerm == "Other") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'EKG, Reporting ECG Related AE': function causeOfDeathLogics(formName, formFieldValues) {
        var conceptToEnable = "EKG, AE ID Number";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['EKG, Reporting ECG Related AE'];
        if (conditionConcept == "True") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'MTC, Treatment delivery method': function (formName, formFieldValues) {
        var conceptToEnable = "MTC, Other treatment delivery method";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['MTC, Treatment delivery method'];
        if (conditionConcept == "Other") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'MTC, Principal reason for treatment incomplete': function (formName, formFieldValues) {
        var programRelated = "MTC, Detailed program related reason";
        var medicalRelated = "MTC, Detailed medical related reason";
        var patientRelated = "MTC, Detailed patient related reason";
        var otherRelated = "MTC, Other reason for treatment incomplete";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['MTC, Principal reason for treatment incomplete'];
        if (conditionConcept == "Program related") {
            conditions.enable.push(programRelated)
            conditions.disable.push(medicalRelated, patientRelated, otherRelated)
        } else if (conditionConcept == "Medical or treatment related") {
            conditions.enable.push(medicalRelated)
            conditions.disable.push(programRelated, patientRelated, otherRelated)
        } else if (conditionConcept == "Patient related") {
            conditions.enable.push(patientRelated)
            conditions.disable.push(programRelated, medicalRelated, otherRelated)
        } else if (conditionConcept == "Other") {
            conditions.enable.push(otherRelated)
            conditions.disable.push(programRelated, medicalRelated, patientRelated)
        } else {
            conditions.disable.push(programRelated, medicalRelated, patientRelated, otherRelated)
        }
        return conditions;
    },
    'MTC, Additional contributing reasons for less than 100% completeness': function (formName, formFieldValues) {
        var programRelated = "MTC, Additional contributing program related reasons";
        var medicalRelated = "MTC, Additional contributing medical or treatment related reasons";
        var patientRelated = "MTC, Additional contributing patient related reasons";
        var otherRelated = "MTC, Other contributing reason for treatment incomplete";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['MTC, Additional contributing reasons for less than 100% completeness'];
        if (conditionConcept && conditionConcept.indexOf("Program related") > -1) {
            conditions.enable.push(programRelated)
        } else {
            conditions.disable.push(programRelated)
        }
        if (conditionConcept && conditionConcept.indexOf("Medical or treatment related") > -1) {
            conditions.enable.push(medicalRelated)
        } else {
            conditions.disable.push(medicalRelated)
        }
        if (conditionConcept && conditionConcept.indexOf("Patient related") > -1) {
            conditions.enable.push(patientRelated)
        } else {
            conditions.disable.push(patientRelated)
        }
        if (conditionConcept && conditionConcept.indexOf("Other") > -1) {
            conditions.enable.push(otherRelated)
        } else {
            conditions.disable.push(otherRelated)
        }
        return conditions;
    },
    'Performance Status, Type of visit': function causeOfDeathLogics(formName, formFieldValues) {
        var conceptToEnable = "Performance Status, Month of scheduled visit";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Performance Status, Type of visit'];
        if (conditionConcept == "Scheduled monthly visit") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Bacteriology, Xpert MTB result': function (formName, formFieldValues) {
        var burdenconceptToEnable = "Bacteriology, MTB Burden";
        var rifconceptToEnable = "Bacteriology, RIF resistance result type"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Xpert MTB result'];
        if (conditionConcept == "Detected") {
            conditions.enable.push(burdenconceptToEnable)
            conditions.enable.push(rifconceptToEnable)
        } else {
            conditions.disable.push(burdenconceptToEnable)
            conditions.disable.push(rifconceptToEnable)
        }
        return conditions;
    },
    'Bacteriology, HAIN MTBDRsl test result': function (formName, formFieldValues) {
        var fluoroquinoloneconceptToEnable = "Bacteriology, Fluoroquinolone";
        var aminoglycosideconceptToEnable = "Bacteriology, MTBDRsl injectable";
        var ethambutolcosideconceptToEnable = "Bacteriology, MTBDRsl Ethambutol";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRsl test result'];
        if (conditionConcept == "Detected") {
            conditions.enable.push(fluoroquinoloneconceptToEnable)
            conditions.enable.push(aminoglycosideconceptToEnable)
	    conditions.enable.push(ethambutolcosideconceptToEnable)
        } else {
            conditions.disable.push(fluoroquinoloneconceptToEnable)
            conditions.disable.push(aminoglycosideconceptToEnable)
            conditions.disable.push(ethambutolcosideconceptToEnable)
        }
        return conditions;
    },
    'Bacteriology, Type of culture medium': function (formName, formFieldValues) {
        var otherCultureconceptToEnable = "Bacteriology, Other culture medium"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Type of culture medium'];
        if (conditionConcept == "Other") {
            conditions.enable.push(otherCultureconceptToEnable)
        } else {
            conditions.disable.push(otherCultureconceptToEnable)
        }
        return conditions;
    },
    'Bacteriology, Culture results': function (formName, formFieldValues) {
        var cultureColonyconceptToEnable = "Bacteriology, Culture Colonies"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Culture results'];
        if (conditionConcept == "Positive for M. tuberculosis") {
            conditions.enable.push(cultureColonyconceptToEnable)
        } else {
            conditions.disable.push(cultureColonyconceptToEnable)
        }
        return conditions;
    },
    'Bacteriology, Type of media for DST': function (formName, formFieldValues) {
        var cultureColonyconceptToEnable = "Bacteriology, Other type of media for DST"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Type of media for DST'];
        if (conditionConcept == "Other") {
            conditions.enable.push(cultureColonyconceptToEnable)
        } else {
            conditions.disable.push(cultureColonyconceptToEnable)
        }
        return conditions;
    },
    'Baseline, Marital Status': function (formName, formFieldValues) {
        var conceptToEnable = "Baseline, Other Marital Status"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Marital Status'];
        if (conditionConcept == "Other") {
            conditions.enable.push(conceptToEnable)
        } else {
            conditions.disable.push(conceptToEnable)
        }
        return conditions;
    },
    'Bacteriology, HAIN MTBDRplus test result': function (formName, formFieldValues) {
        var conceptToEnable_isoniazid = "Bacteriology, Isoniazid"
        var conceptToEnable_rifampicin = "Bacteriology, Rifampicin"
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRplus test result'];
        if (conditionConcept == "Detected") {
            conditions.enable.push(conceptToEnable_isoniazid)
            conditions.enable.push(conceptToEnable_rifampicin)
        } else {
            conditions.disable.push(conceptToEnable_isoniazid)
            conditions.disable.push(conceptToEnable_rifampicin)
        }
        return conditions;
    },
    'Baseline, Start date of past TB treatment': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, Past TB treatment drug regimen", "StemTB Baseline, Past TB treatment outcome"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Start date of past TB treatment'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    "Medication Stop Reason": function (drugOrder, conceptName) {
        if (conceptName == "Adverse event" || conceptName == "Other") {
            drugOrder.orderReasonNotesEnabled = true;
            return true;
        }
        else
            return false;
    },
    'HTO, DAA treatment outcome': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var outcome = formFieldValues['HTO, DAA treatment outcome'];
        var Transferedout = "HTO, If Not evaluated, did the patient transfer out?";
        var enDOD = "HTO, If death, date of death";

        if (outcome == "HTO, Death") {
            conditions.enable.push(enDOD);
        } else {
            conditions.disable.push(enDOD, Transferedout);
        }
        if (outcome == "HTO, Not Evaluated") {
            conditions.enable.push(Transferedout);
        } else {
            conditions.disable.push(Transferedout, enDOD);
        }
        return conditions;
    },
    'HTO, If Not evaluated, did the patient transfer out?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var transfered = formFieldValues['HTO, If Not evaluated, did the patient transfer out?'];
        var where = "HTO, If transferred out, patient transferred out to where?";
        var why = "HTO, If did not transfer out, why does the patient have this outcome?";

        if (transfered == "True") {
            conditions.enable.push(where);
        } else {
            conditions.disable.push(where, why);
        }
        if (transfered == "False") {
            conditions.enable.push(why);
        } else {
            conditions.disable.push(why, where);
        }
        return conditions;
    },

    'HTI, Reason that DAA was not given during the study period': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcepts = formFieldValues['HTI, Reason that DAA was not given during the study period'];
        if (conditionConcepts.includes("Other")) {
            conditions.enable.push("HTI, Other reason not to start DAA during study period")
        } else {
            conditions.disable.push("HTI, Other reason not to start DAA during study period")
        }
        return conditions;
    },
    'HTI, Reason to start DAA at this time (chose all those that apply)': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcepts = formFieldValues['HTI, Reason to start DAA at this time (chose all those that apply)'];
        if (conditionConcepts.includes("Other")) {
            conditions.enable.push("HTI, Other reasons to start DAA")
        } else {
            conditions.disable.push("HTI, Other reasons to start DAA")
        }
        return conditions;
    },

	'StemTB Baseline, Does the patient drink alcohol?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Baseline, Does the patient drink alcohol?'];
        if (conditionConcept == "True") {
            conditions.enable.push("StemTB Baseline, Number of standard alcoholic drinks per week")
        } else {
            conditions.disable.push("StemTB Baseline, Number of standard alcoholic drinks per week")
        }
        return conditions;
        },
	
	'StemTB Baseline, Confirmed HIV serostatus': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var diagnosisDate = "Date of HIV diagnosis";
        var lastCD = "StemTB Baseline, Last CD4 Count";
        var cdDate = "CD4 date";
        var rna = "StemTB Baseline, Last RNA Viral Load";
	var undetectable = "If viral load results are undetectable, write the result here (for example, '< 20')";
        var vload = "Baseline, Viral Load Date";
        var arvTreatment = "StemTB Baseline, Currently on ARV treatment?";
        var arvInitiation = "StemTB Baseline, Date of ARV initiation";
        var arv = "Baseline, Drugs used in ARV treatment";
        var diabetes = "StemTB Baseline, Diabetes (type 1 or 2)";
        var hbA1c = "StemTB Baseline, If yes last HbA1c";
        var hepB = "StemTB Baseline, Confirmed Hepatitis B";
        var hepC = "StemTB Baseline, Confirmed Hepatitis C";
        var exisitingNeuropathy = "Baseline, Pre-existing neuropathy";
        var neuropathyGrade = "Baseline, Neuropathy grade";
	var cptDate = "StemTB Baseline, CPT Date";
	var cpt = "StemTB Baseline, Started on CPT?";
        var conditionConcept = formFieldValues['StemTB Baseline, Confirmed HIV serostatus'];
        if (conditionConcept == "Positive") {
            conditions.enable.push(diagnosisDate, lastCD, cdDate, rna, undetectable, vload, arvTreatment, arvInitiation, arv, cpt, cptDate)
        } else {
            conditions.disable.push(diagnosisDate, lastCD, cdDate, rna, undetectable, vload, arvTreatment, arvInitiation, arv, cpt, cptDate)
        }
        return conditions;
        },

	"StemTB Baseline, Currently on ARV treatment?" :function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var arvDate = "StemTB Baseline, Date of ARV initiation";
        var arvDrugs = "Baseline, Drugs used in ARV treatment";
        var conditionConcept = formFieldValues['StemTB Baseline, Currently on ARV treatment?'];
        if (conditionConcept == "True") {
            conditions.enable.push(arvDate, arvDrugs)
        } else {
            conditions.disable.push(arvDate, arvDrugs)
        }
        return conditions;
        },

	"StemTB Baseline, Diabetes (type 1 or 2)" :function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var ifYes = "StemTB Baseline, If yes last HbA1c";
        var conditionConcept = formFieldValues['StemTB Baseline, Diabetes (type 1 or 2)'];
        if (conditionConcept == "True") {
            conditions.enable.push(ifYes)
        } else {
            conditions.disable.push(ifYes)
        }
        return conditions;
        },

	'StemTB PTO, Final Post-Treatment Outcome': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB PTO, Final Post-Treatment Outcome'];
        var deathDate = "6m PTO, Date of death post treatment";
        var suspectedDeathCause = "StemTB PTO, If Died: Suspected Primary cause of death";
        var nonTBDeathCause = "StemTB PTO, Non TB cause of post treatment death";
        var postSurgeryDeath = "6m PTO, Type of surgery related to post treatment death";
        var noRecurrence = "StemTB PTO, If no recurrence";
	var recurrence = "StemTB PTO, If recurrence";
	var LTFU = "StemTB PTO, Lost To Follow Up";
	var notEval = "StemTB PTO, Not evaluated";
        if (conditionConcept == "Died post treatment") {
              conditions.enable.push(deathDate, suspectedDeathCause, nonTBDeathCause, postSurgeryDeath);
            } else {
                conditions.disable.push(deathDate, suspectedDeathCause, nonTBDeathCause, postSurgeryDeath);
            }
        if (conditionConcept == "StemTB PTO, Recurrence") {
              conditions.enable.push(recurrence);
            } else {
                conditions.disable.push(recurrence);
            }
	if (conditionConcept == "StemTB PTO, No Recurrence") {
              conditions.enable.push(noRecurrence);
            } else {
                conditions.disable.push(noRecurrence);
            }
	if (conditionConcept == "StemTB PTO, Lost to follow-up, post-treatment") {
              conditions.enable.push(LTFU);
            } else {
                conditions.disable.push(LTFU);
            }
	if (conditionConcept == "Not Evaluated") {
              conditions.enable.push(notEval);
            } else {
                conditions.disable.push(notEval);
            }

        return conditions;
        },

	"StemTB PTO, Reasons for no post treatment followup": function (formName, formFieldValues) {
	var other = "StemTB PTO, Other reasons for no post treatment followup";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB PTO, Reasons for no post treatment followup'];
        if (conditionConcept && conditionConcept.indexOf("Other") > -1) {
            conditions.enable.push(other);
        } else {
            conditions.disable.push(other);
        }
        return conditions;
        },

	"StemTB PTO, Did the patient transfer out": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
	var yes = "6m PTO, Transferred to where post treatment";
	var no = "StemTB PTO, If no, why does the patient have this outcome";
	var conditionConcept = formFieldValues['StemTB PTO, Did the patient transfer out'];
        if (conditionConcept == "True") {
            conditions.enable.push(yes);
        } else {
            conditions.disable.push(yes);
        }
	if (conditionConcept == "False") {
            conditions.enable.push(no);
        } else {
            conditions.disable.push(no);
        }
        return conditions;
        },


        "StemTB PTO, If Died: Suspected Primary cause of death": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var surgeryDeath = "6m PTO, Type of surgery related to post treatment death";
        var nonTBDeathCause = "StemTB PTO, Non TB cause of post treatment death";
        var noRecurrence = "StemTB PTO, If no recurrence";
        var conditionConcept = formFieldValues['StemTB PTO, If Died: Suspected Primary cause of death'];
        if (conditionConcept == "Surgery related death") {
              conditions.enable.push(surgeryDeath);
            } else {
                conditions.disable.push(surgeryDeath);
            }
        if (conditionConcept == "Cause other than TB") {
	 conditions.enable.push(nonTBDeathCause);
            } else {
                conditions.disable.push(nonTBDeathCause);
            }
        return conditions;
        },

	'StemTB Baseline, Has the Consent form for all oral shorter regimen been explained and signed': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
           var signConceptDate = "StemTB Baseline, Baseline Date Consent Signed";
           var consentNotPossibleOther = "StemTB Baseline, If Other specify";
           var conditionConcept = formFieldValues['StemTB Baseline, Has the Consent form for all oral shorter regimen been explained and signed'];
           if (conditionConcept == "StemTB Baseline, Accepted") {
                       conditions.enable.push(signConceptDate)
                   } else {
                       conditions.disable.push(signConceptDate)
                   }
	if (conditionConcept == "Other") {
                       conditions.enable.push(consentNotPossibleOther)
                   } else {
                       conditions.disable.push(consentNotPossibleOther)
                   }
                return conditions;
             },

	'TUBERCULOSIS DRUG TREATMENT START DATE': function (formName, formFieldValues) {
        var conceptToEnable = ["StemTB Baseline, Treatment facility at start" ,"StemTB Baseline, Other treatment facility", "Facility patient ID"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TUBERCULOSIS DRUG TREATMENT START DATE'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },

	"StemTB Baseline, Treatment facility at start" : function (formName, formFieldValues) {
	var conditions = {enable: [], disable: []};
        var otherFac = "StemTB Baseline, Other treatment facility";
        var conditionConcept = formFieldValues['StemTB Baseline, Treatment facility at start'];
	if (conditionConcept == "Other") {
                       conditions.enable.push(otherFac)
                   } else {
                       conditions.disable.push(otherFac)
                   }
                return conditions;
	},

        "StemTB Baseline, Used second-line drugs previously? (mark one)" : function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var ifYes = "StemTB Baseline, If Yes to second-line drugs, specify";
        var conditionConcept = formFieldValues['StemTB Baseline, Used second-line drugs previously? (mark one)'];
        if (conditionConcept == "True") {
                       conditions.enable.push(ifYes)
                   } else {
                       conditions.disable.push(ifYes)
                   }
                return conditions;
        },
        
	"AE, Is the date of AE onset estimated?" : function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var dateEst = "StemTB, If date of AE onset estimated";
        var conditionConcept = formFieldValues['AE, Is the date of AE onset estimated?'];
	if (conditionConcept == true) {
                       conditions.enable.push(dateEst)
                   } else {
                       conditions.disable.push(dateEst)
                   }
                return conditions;
        },

	"AE Form, Date of AE Outcome" : function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conceptToEnable = ["AE, Is the date of AE outcome estimated?", "StemTB, If date of AE outcome estimated"];
        var conditionConcept = formFieldValues['AE Form, Date of AE Outcome'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        },

	"AE, Is the date of AE outcome estimated?" : function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var dateEst = "StemTB, If date of AE outcome estimated";
        var conditionConcept = formFieldValues['AE, Is the date of AE outcome estimated?'];
        if (conditionConcept == true) {
                       conditions.enable.push(dateEst)
                   } else {
                       conditions.disable.push(dateEst)
                   }
                return conditions;
        },

	'StemTB EOT, Outcome': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB EOT, Outcome'];
        var died = "StemTB, Died";
        var failed = "StemTB, Failed";
        var ltfu = "StemTB, LTFU";
        var notEval = "StemTB, Not evaluated";
        var withDrawal = "StemTB EOT, Withdrawal";
        if (conditionConcept == "Died") {
              conditions.enable.push(died);
            } else {
                conditions.disable.push(died);
            }
	if (conditionConcept == "Failed") {
              conditions.enable.push(failed);
            } else {
                conditions.disable.push(failed);
            }
	if (conditionConcept == "StemTB EOT, LFTU") {
              conditions.enable.push(ltfu);
            } else {
                conditions.disable.push(ltfu);
            }
	if (conditionConcept == "Not Evaluated") {
              conditions.enable.push(notEval);
            } else {
                conditions.disable.push(notEval);
        	}
	if (conditionConcept == "StemTB EOT, Withdrawn") {
              conditions.enable.push(withDrawal);
            } else {
                conditions.disable.push(withDrawal);
        } 
    
         return conditions;
        },

	'StemTB, Suspected primary cause of death': function (formName, formFieldValues) {
        var enSurgery = "EOT, Type of surgery related to death";
        var tbDeath = "StemTB, Suspected cause related to TB treatment";
        var enNonTB = "StemTB, Non TB cause of death";
        var conditions = {enable: [], disable: []};
        var suspectCause = formFieldValues['StemTB, Suspected primary cause of death'];
        if (suspectCause == "Surgery related death") {
            conditions.enable.push(enSurgery);
        } else {
            conditions.disable.push(enSurgery);
        }
	if (suspectCause == "Cause other than TB") {
            conditions.enable.push(enNonTB);
        } else {
            conditions.disable.push(enNonTB);
        }
        if (suspectCause == "Cause related to TB treatment") {
            conditions.enable.push(tbDeath);
        } else {
            conditions.disable.push(tbDeath);
        }
        return conditions;
	},

	"StemTB, Reasons for failure definition": function (formName, formFieldValues) {
        var other = "StemTB, Other reasons for failure definition";
	var conditions = {enable: [], disable: []};
        var Failed = formFieldValues['StemTB, Reasons for failure definition'];
        if (Failed && Failed.indexOf("Other") > -1) {
            conditions.enable.push(other);
        } else {
            conditions.disable.push(other);
        }
	return conditions;
        },

 	"StemTB, Reasons for treatment interrruption": function (formName, formFieldValues) {
        var other = "StemTB, Other reasons for treatment interruption";
        var conditions = {enable: [], disable: []};
        var LTFU = formFieldValues['StemTB, Reasons for treatment interrruption'];
        if (LTFU && LTFU.indexOf("Other") > -1) {
            conditions.enable.push(other);
        } else {
            conditions.disable.push(other);
        }
        return conditions;
        },

	"StemTB, Did the patient transfer out": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var transferNo = "StemTB, Other reasons for no evaluation of outcome";
	var transferYes = "EOT, Transferred to where";
	var transfer = formFieldValues['StemTB, Did the patient transfer out'];
        if (transfer == "True") {
            conditions.enable.push(transferYes);
        } else {
            conditions.disable.push(transferYes);
        }
	if (transfer == "False") {
            conditions.enable.push(transferNo);
        } else {
            conditions.disable.push(transferNo);
        }

        return conditions;
        },

	"StemTB EOT, If withdrawal reason for withdrawal": function (formName, formFieldValues) {
	var conditions = {enable: [], disable: []};
        var other = "StemTB EOT, If withdrawal other";
        var withdrawal = formFieldValues['StemTB EOT, If withdrawal reason for withdrawal'];
	if (withdrawal == "Other") {
            conditions.enable.push(other);
        } else {
            conditions.disable.push(other);
        }
        return conditions;
        },

	"StemTB Quarterly PTO, Any current medications being taken": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
	var currentMed = "StemTB Quarterly PTO, If yes please list";
	var conditionConcept = formFieldValues['StemTB Quarterly PTO, Any current medications being taken'];
        if (conditionConcept == "True") {
            conditions.enable.push(currentMed);
        } else {
            conditions.disable.push(currentMed);
        }
	return conditions;
        },

	"StemTB Quarterly PTO, Any contact with a medical practitioner since completing TB treatment": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var contact = "StemTB Quarterly PTO, If yes what was the purpose of visit";
        var conditionConcept = formFieldValues['StemTB Quarterly PTO, Any contact with a medical practitioner since completing TB treatment'];
        if (conditionConcept == "True") {
            conditions.enable.push(contact);
        } else {
            conditions.disable.push(contact);
        }
        return conditions;
        },

	"StemTB, AE term comprehensive list": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var other = "AE Form, Other AE term";
        var ae = formFieldValues['StemTB, AE term comprehensive list'];
        if (ae == "Other") {
            conditions.enable.push(other);
        } else {
            conditions.disable.push(other);
        }
        return conditions;
        },

	"SAE Form, Date of SAE report" : function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conceptToEnable = ["SAE, Is the date of SAE report estimated?","SAE, Is the day of SAE report date estimated", "SAE, Is the month of SAE report date estimated","SAE, Is the year of SAE report date estimated", "SAE, Is the date of SAE onset estimated?", "SAE, Is the date of SAE onset day estimated", "SAE, Is the month of SAE onset date estimated", "SAE, Is the year of SAE onset date estimated", "SAE, Is the date when the adverse event became serious estimated?", "SAE, Is the day when the event became serious estimated", "SAE, Is the month when the event became serious estimated", "SAE, Is the year when the event became serious estimated", "SAE, Is the date of SAE outcome estimated?", "SAE, Is the day of the SAE outcome date estimated","SAE, Is the month of the SAE outcome date estimated", "SAE, Is the year of the SAE outcome date estimated"];
  var conditionConcept = formFieldValues['SAE Form, Date of SAE report'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
        },

 	"StemTB Baseline, Used second-line drugs previously" : function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var yesO = "StemTB Baseline, If Yes to second-line drugs, specify";
        var conditionConcept = formFieldValues['StemTB Baseline, Used second-line drugs previously'];
        if (conditionConcept == "True") {
            conditions.enable.push(yesO);
        } else {
            conditions.disable.push(yesO);
        }
        return conditions;
        },

	'Bacteriology, Is the date of sample collection estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day for the date of sample collection estimated", "Bacteriology, Is the month of the date of sample collection estimated", "Bacteriology, Is the year for the date of sample collection estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of sample collection estimated?'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },

    'Bacteriology, Date of AFB smear': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date Of AFB smear estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Date of AFB smear'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date Of AFB smear estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day for the AFB smear date estimated", "Bacteriology, Is the month for the AFB smear date estimated", "Bacteriology, Is the year for the AFB smear date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date Of AFB smear estimated?'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
'Bacteriology, Date of Xpert test': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of Xpert test estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Date of Xpert test'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of Xpert test estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day for the xpert test date estimated", "Bacteriology, Is the month for the xpert test date estimated", "Bacteriology, Is the year for the xpert test date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of Xpert test estimated?'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, HAIN MTBDRplus test date': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of HAIN MTBDRplus test estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRplus test date'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },

    'Bacteriology, Is the date of HAIN MTBDRplus test estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day of the hain MTBDRplus test date estimated", "Bacteriology, Is the month of the hain MTBDRplus test date estimated", "Bacteriology, Is the year of the hain MTBDRplus test date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of HAIN MTBDRplus test estimated?'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, HAIN MTBDRsl test date': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the date of HAIN MTBDRsl test estimated?"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, HAIN MTBDRsl test date'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'Bacteriology, Is the date of HAIN MTBDRsl test estimated?': function (formName, formFieldValues) {
        var conceptToEnable = ["Bacteriology, Is the day of hain MTBDRsl test date estimated", "Bacteriology, Is the month of hain MTBDRsl test date estimated", "Bacteriology, Is the year of hain MTBDRsl test date estimated"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Bacteriology, Is the date of HAIN MTBDRsl test estimated?'];
        if (conditionConcept) {
            conditions.disable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
	},

    	"StemTB Baseline, Started on CPT?": function (formName, formFieldValues) {
	var cptDate = "StemTB Baseline, CPT Date";
	var conditions = {enable: [], disable: []};
	var conditionConcept = formFieldValues['StemTB Baseline, Started on CPT?'];
        if (conditionConcept == "True") {
            conditions.enable.push(cptDate);
        } else {
            conditions.disable.push(cptDate);
        }
        return conditions;
    },

	"StemTB Quarterly PTO, Have you had cough for > 2 weeks": function (formName, formFieldValues) {
        var productive = "StemTB Quarterly PTO, If yes Is your cough productive";
        var blood = "StemTB Quarterly PTO, If yes Is there blood in your sputum";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Quarterly PTO, Have you had cough for > 2 weeks'];
        if (conditionConcept == "True") {
            conditions.enable.push(productive, blood);
	}else if (conditionConcept == "False" )  {
            conditions.disable.push(productive, blood)
        } else {
	conditions.disable.push(productive, blood);
	}
        return conditions;
    },

	"StemTB Quarterly PTO, If yes Is your cough productive": function (formName, formFieldValues) {
	var blood = "StemTB Quarterly PTO, If yes Is there blood in your sputum";
	var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Quarterly PTO, If yes Is your cough productive'];
	if (conditionConcept == "True")  {
            conditions.enable.push(blood)
        } else {
        conditions.disable.push(blood);
	}
 	return conditions;
    },

	"StemTB Quarterly PTO, Do you have fever": function (formName, formFieldValues) {
        var days = "StemTB Quarterly PTO, If yes fever or how long (in days)";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Quarterly PTO, Do you have fever'];
         if (conditionConcept == "True")  {
            conditions.enable.push(days);
        } else {
        conditions.disable.push(days);
        }
        return conditions;
    },

	"StemTB Quarterly PTO, Indirect information if patient not seen in person": function (formName, formFieldValues) {
        var days = "DATE OF DEATH";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Quarterly PTO, Indirect information if patient not seen in person'];
         if (conditionConcept == "StemTB Quarterly PTO, patient died") {
            conditions.enable.push(days);
        } else {
        conditions.disable.push(days);
        }
        return conditions;
    },

	"StemTB Quarterly PTO, Person from whom the information is provided/assessment made": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['StemTB Quarterly PTO, Person from whom the information is provided/assessment made'];
         if (conditionConcept == "StemTB Quarterly PTO, Patient himself (see question 10)") {
            conditions.enable.push("StemTB Quarterly PTO, Have you had cough for > 2 weeks", "StemTB Quarterly PTO, If yes Is your cough productive", "StemTB Quarterly PTO, If yes Is there blood in your sputum", "StemTB Quarterly PTO, Do you have fever", "StemTB Quarterly PTO, If yes fever or how long (in days)", "StemTB Quarterly PTO, Do you have night sweats", "StemTB Quarterly PTO, Have you had unexplained weight loss", "StemTB Quarterly PTO, Post treatment BPNS", "StemTB Quarterly PTO, Any current medications being taken", "StemTB Quarterly PTO, If yes please list", "StemTB Quarterly PTO, Any contact with a medical practitioner since completing TB treatment", "StemTB Quarterly PTO, If yes what was the purpose of visit", "StemTB Quarterly PTO, What was the outcome of the visit");
        } else {
        conditions.disable.push("StemTB Quarterly PTO, Indirect information if patient not seen in person", "StemTB Quarterly PTO, Have you had cough for > 2 weeks", "StemTB Quarterly PTO, If yes Is your cough productive", "StemTB Quarterly PTO, If yes Is there blood in your sputum", "StemTB Quarterly PTO, Do you have fever", "StemTB Quarterly PTO, If yes fever or how long (in days)", "StemTB Quarterly PTO, Do you have night sweats", "StemTB Quarterly PTO, Have you had unexplained weight loss", "StemTB Quarterly PTO, Post treatment BPNS", "StemTB Quarterly PTO, Any current medications being taken", "StemTB Quarterly PTO, If yes please list", "StemTB Quarterly PTO, Any contact with a medical practitioner since completing TB treatment", "StemTB Quarterly PTO, If yes what was the purpose of visit", "StemTB Quarterly PTO, What was the outcome of the visit");
        }
if(conditionConcept == "StemTB Quarterly PTO, Patient family member" || conditionConcept == "StemTB Quarterly PTO, Patient friend or acquaintance" || conditionConcept == "StemTB Quarterly PTO, NTP personal" || conditionConcept == "StemTB Quarterly PTO, Other health professional" || conditionConcept == "StemTB Quarterly PTO, Other") {
	conditions.enable.push("StemTB Quarterly PTO, Indirect information if patient not seen in person");
	} else {
	conditions.disable.push("StemTB Quarterly PTO, Indirect information if patient not seen in person");
	}
        return conditions;
    },

	"Xray, Extent of disease": function (formName, formFieldValues) {
        var conceptEnCavity = "StemTB, Cavity size (aggregate)";
        var conceptEnFibrosis = "StemTB, Presence of Fibrosis";
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues["Xray, Extent of disease"];
        if (conditionConcept == "Normal" || !conditionConcept) {
            conditions.disable.push(conceptEnCavity, conceptEnFibrosis)
        } else {
            conditions.enable.push(conceptEnCavity, conceptEnFibrosis)
        }
        return conditions;
	},

	"StemTB Baseline, Confirmed Hepatitis B": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
	var conditionConcept = formFieldValues["StemTB Baseline, Confirmed Hepatitis B"];
  	if (conditionConcept == "True"){
	conditions.enable.push("StemTB Baseline, Hep B Antigen Date");
	} else {
	conditions.disable.push("StemTB Baseline, Hep B Antigen Date");
	}
	return conditions;
	},

	"StemTB Baseline, Confirmed Hepatitis C": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues["StemTB Baseline, Confirmed Hepatitis C"];
        if (conditionConcept == "True"){
        conditions.enable.push("StemTB Baseline, Hep C Antibody Date");
        } else {
        conditions.disable.push("StemTB Baseline, Hep C Antibody Date");
        }
        return conditions;
        },

	"SAE Form, Seriousness criteria": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
	var conditionConcept = formFieldValues["SAE Form, Seriousness criteria"];
	if (conditionConcept == "Death"){
        conditions.enable.push("StemTB SAE, In case of death");
        } else {
        conditions.disable.push("StemTB SAE, In case of death");
        }
	if (conditionConcept == "Hospitalisation required or prolonged"){
        conditions.enable.push("StemTB SAE, Hospitalization required / prolonged");
        } else {
        conditions.disable.push("StemTB SAE, Hospitalization required / prolonged");
        }
        return conditions;
        },
	
	"Bacteriology, Culture Colonies": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues["Bacteriology, Culture Colonies"];
        if (conditionConcept == "Less than 10 colonies"){
        conditions.enable.push("StemTB Bacteriology, Number of MTB colonies");
        } else {
        conditions.disable.push("StemTB Bacteriology, Number of MTB colonies");
        }
	return conditions;
        }

};
