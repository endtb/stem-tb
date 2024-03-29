SELECT
  ppa.value_reference                                                                                                                                                                                                                            AS  'Registration Number' ,
  pi.identifier                                                                                                                                                                                                                                  AS 'EMR ID',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'AE Form, Date of AE onset', DATE_FORMAT(first_child_obs.value_datetime, '%d-%M-%Y'), NULL)) SEPARATOR ',')                                                                                    AS 'Date of AE onset',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'StemTB, Date of AE report', DATE_FORMAT(first_child_obs.value_datetime, '%d-%M-%Y'), NULL)) SEPARATOR ',')                                                                                   AS 'Date of AE reporting',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'AE Form, AE ID number', first_child_obs.value_text, NULL)) SEPARATOR ',')                                                                                                                     AS 'AE ID',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'StemTB, Were all anti-TB drugs suspended due to this AE', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = first_child_obs.value_coded), NULL)) SEPARATOR ',') AS 'Were all anti-TB drug suspended due to this AE?',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'StemTB, AE term comprehensive list', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = first_child_obs.value_coded), NULL)) SEPARATOR ',')        AS 'Adverse Event term:',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'AE Form, Other AE term', first_child_obs.value_text, NULL)) SEPARATOR ',')                                                                                                           AS 'Other Adverse event term not in comprehensive list',
  GROUP_CONCAT(DISTINCT (IF(first_child_cn.name = 'StemTB, AE Grade', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = first_child_obs.value_coded), NULL)) SEPARATOR ',')                 AS 'AE Grade (severity):',
  GROUP_CONCAT(DISTINCT (IF(second_child_cn.name = 'AE Form, Is AE an SAE', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = second_child_obs.value_coded), NULL)) SEPARATOR ',')           AS 'Did this AE become an SAE?',
  GROUP_CONCAT(DISTINCT (IF(second_child_cn.name = 'AE Form, SAE Case Number', second_child_obs.value_text, NULL)) SEPARATOR ',')                                                                                                       AS 'If yes, SAE case number',
  GROUP_CONCAT(DISTINCT (IF(second_child_cn.name = 'AE Form, Date of AE Outcome', DATE_FORMAT(second_child_obs.value_datetime, '%d-%M-%Y'), NULL)) SEPARATOR ',')                                                                       AS 'Date of AE Outcome:',
  GROUP_CONCAT(DISTINCT (IF(second_child_cn.name = 'AE Form, AE outcome', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = second_child_obs.value_coded), NULL)) SEPARATOR ',')             AS 'AE outcome:',
  GROUP_CONCAT(DISTINCT (IF(second_child_cn.name = 'AE Form, Maximum severity of AE', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = second_child_obs.value_coded), NULL)) SEPARATOR ',')               AS 'maximum severity of AE',
  GROUP_CONCAT(DISTINCT (IF(second_child_cn.name = 'AE Form, AE related to TB drugs', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = second_child_obs.value_coded), NULL)) SEPARATOR ',')               AS 'Is this adverse event related to any of the TB drugs in the patient''s regimen?',
  GROUP_CONCAT(IF(third_child_cn.name = 'AE Form, TB drug name', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = third_child_obs.value_coded), NULL) SEPARATOR ',')                           AS 'TB drug treatment',
  GROUP_CONCAT(IF(third_child_cn.name = 'AE Form, Is this TB drug possibly related to AE', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = third_child_obs.value_coded), NULL) SEPARATOR ',') AS 'TB Drug : Possibly related to AE?',
  GROUP_CONCAT(IF(third_child_cn.name = 'AE Form, Final action taken related to TB drug', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = third_child_obs.value_coded), NULL) SEPARATOR ',')  AS 'TB drug : Final action taken',
  GROUP_CONCAT(DISTINCT (IF(third_child_cn.name = 'AE Form, Other causal factors related to AE', (SELECT coalesce(concept_short_name, concept_full_name) from concept_view where concept_id = third_child_obs.value_coded), NULL)) SEPARATOR ',')     AS 'Are there any other causal factors, such co-morbidities, procedures, other non-TB drugs, etc?',
  GROUP_CONCAT(DISTINCT (IF(third_child_cn.name = 'AE Form, Non TB drug of other causal factor', third_child_obs.value_text, NULL)) SEPARATOR ',')                                                                                                    AS 'Other causal factors: Non TB drug',
  GROUP_CONCAT(DISTINCT (IF(third_child_cn.name = 'AE Form, Comorbidity of other causal factor', third_child_obs.value_text, NULL)) SEPARATOR ',')                                                                                                    AS 'Other causal factors: co-morbidity',
  GROUP_CONCAT(DISTINCT (IF(third_child_cn.name = 'AE Form, Other causal factor', third_child_obs.value_text, NULL)) SEPARATOR ',')                                                                                                                   AS 'Other causal factors '
FROM obs top_level_obs
  INNER JOIN patient ON patient.patient_id=top_level_obs.person_id AND patient.voided=0
  LEFT JOIN obs first_child_obs ON top_level_obs.obs_id = first_child_obs.obs_group_id AND first_child_obs.voided = 0
  LEFT JOIN obs second_child_obs ON first_child_obs.obs_id = second_child_obs.obs_group_id AND second_child_obs.voided = 0
  LEFT JOIN obs third_child_obs ON second_child_obs.obs_id = third_child_obs.obs_group_id AND third_child_obs.voided = 0
  LEFT JOIN concept_name top_level_cn ON top_level_cn.concept_id = top_level_obs.concept_id AND top_level_cn.concept_name_type = 'FULLY_SPECIFIED'
  LEFT JOIN concept_name first_child_cn ON first_child_cn.concept_id = first_child_obs.concept_id AND first_child_cn.concept_name_type = 'FULLY_SPECIFIED'
  LEFT JOIN concept_name second_child_cn ON second_child_cn.concept_id = second_child_obs.concept_id AND second_child_cn.concept_name_type = 'FULLY_SPECIFIED'
  LEFT JOIN concept_name third_child_cn ON third_child_cn.concept_id = third_child_obs.concept_id AND third_child_cn.concept_name_type = 'FULLY_SPECIFIED'
  INNER JOIN episode_encounter ee ON ee.encounter_id = top_level_obs.encounter_id
  INNER JOIN episode_patient_program epp ON ee.episode_id=epp.episode_id
  INNER JOIN patient_program pp ON pp.patient_program_id = epp.patient_program_id and pp.voided = 0
  INNER JOIN patient_program_attribute ppa ON ppa.patient_program_id=epp.patient_program_id
  INNER JOIN program_attribute_type pat ON pat.program_attribute_type_id=ppa.attribute_type_id AND pat.name='Registration Number'
  INNER JOIN patient_identifier pi ON pi.patient_id = top_level_obs.person_id AND top_level_obs.voided = 0
WHERE top_level_cn.name='StemTB, Adverse Events Template' AND cast(top_level_obs.obs_datetime AS DATE) BETWEEN '#startDate#' AND '#endDate#'
GROUP BY top_level_obs.obs_id;
