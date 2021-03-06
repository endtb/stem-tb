CREATE PROCEDURE Basic_register(startDate date, endDate date )

BEGIN

	CREATE TEMPORARY TABLE tempRegister
	SELECT
		patient_program.patient_program_id,
		MAX(IF(pat.name='Registration Number', ppa.value_reference, NULL )) AS `Registration Number`,
        pi.identifier AS `EMR ID`,
        person_name.family_name AS `Patient Last name`,
        person_name.given_name AS `Patient First name`,
        p.gender as `Gender`,
        p.birthdate AS `DOB`,
        MAX(IF(obs.concept_full_name = 'TI, Has the endTB Observational Study Consent Form been explained and signed', obs.value, NULL)) AS `Consent EndTB Study`,
        CONCAT(DATE_FORMAT(tStartDate.value_datetime, '%Y'), QUARTER(tStartDate.value_datetime)) AS `Ttr Cohort` ,
        MAX(IF(obs.concept_full_name = 'Baseline, WHO registration group', obs.value, NULL)) AS `WHO registration group`,
        MAX(IF(obs.concept_full_name = 'Baseline, MDR-TB diagnosis method', obs.value, NULL)) AS `MTB confirmed`,
        MAX(IF(obs.concept_full_name = 'Baseline, Drug resistance', obs.value, NULL)) AS `DR Resistance profile`,
        MAX(IF(obs.concept_full_name = 'Baseline, Subclassification for confimed drug resistant cases', obs.value, NULL)) AS `Subclassification for confirmed`,
        DATE_FORMAT(tStartDate.value_datetime, '%d/%b/%Y') AS `start ttr date`,
        MAX(IF(dd.name = 'Delamanid (Dlm)',DATE_FORMAT(dd.start_date, '%d/%b/%Y'),NULL )) AS `Dlm Start Date`,
        TRUNCATE(MAX(IF(dd.name = 'Delamanid (Dlm)',dd.duration,NULL )),1) AS `Dlm Duration`,
        MAX(IF(dd.name = 'Bedaquiline (Bdq)',DATE_FORMAT(dd.start_date, '%d/%b/%Y'),NULL )) AS `Bdq Start Date`,
        TRUNCATE(MAX(IF(dd.name = 'Bedaquiline (Bdq)',dd.duration,NULL )),1) AS `Bdq Duration`,
        MAX(IF(obs.concept_full_name = 'EOT, Outcome', obs.value, NULL)) AS `outcome`,
        DATE_FORMAT(end_of_treatment_obs.end_of_treatment_date, '%d/%b/%Y') AS `End of treatment date`,
	TRUNCATE((TIMESTAMPDIFF(DAY, tStartDate.value_datetime, COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()))/30), 1) AS `treatment duration`
FROM
  person_name,
  person p,
  patient_program,
  patient_identifier pi,
  episode_patient_program epp,
  patient_program_attribute ppa,
  program_attribute_type pat,
  encounter e,
  obs tStartDate,
  concept_view tStartDateConcept,
  program,
  concept_name cn,
  episode_encounter ee
  LEFT JOIN
  (
    SELECT ee.episode_id,
      COALESCE(answer_concept.concept_full_name, o.value_datetime, o.value_numeric, o.value_text) AS facility
    FROM   obs o
      JOIN
      concept_view cv
        ON cv.concept_id = o.concept_id AND o.voided=0
           AND cv.concept_full_name IN ( 'TI, Treatment facility at start', 'Treatment Facility Name' )
      JOIN
      concept_view answer_concept ON answer_concept.concept_id = o.value_coded
      JOIN
      episode_encounter ee
        ON o.encounter_id = ee.encounter_id
    WHERE  ( ee.episode_id, o.obs_datetime ) IN (
      SELECT  ee.episode_id,
        MAX(o.obs_datetime) AS max_date
      FROM   obs o
        JOIN
        concept_view cv ON   cv.concept_id = o.concept_id AND o.voided=0 AND
                             cv.concept_full_name IN ('TI, Treatment facility at start', 'Treatment Facility Name' )
        JOIN
        episode_encounter ee  ON  o.encounter_id = ee.encounter_id
      GROUP  BY ee.episode_id)) AS cf ON cf.episode_id = ee.episode_id
  LEFT JOIN
  (
    SELECT cv.concept_full_name,
           ee.episode_id,
           COALESCE(answer_concept.concept_short_name,
                    answer_concept.concept_full_name,
                    o.value_datetime,
                    o.value_numeric,
                    o.value_text) AS value
    FROM obs o
     JOIN concept_view cv ON cv.concept_id = o.concept_id and o.voided=0
     JOIN concept_view answer_concept ON answer_concept.concept_id = o.value_coded
     JOIN episode_encounter ee ON o.encounter_id = ee.encounter_id
    WHERE cv.concept_full_name IN ('Baseline, WHO registration group',
                                  'Baseline, MDR-TB diagnosis method',
                                  'Baseline, Drug resistance',
                                  'Baseline, Subclassification for confimed drug resistant cases',
                                  'Baseline, HIV serostatus result',
                                  'Baseline, Hepatitis B',
                                  'Baseline, Hepatitis C',
                                  'Diabetes Mellitus',
                                  'EOT, Outcome',
                                  'TI, Has the endTB Observational Study Consent Form been explained and signed'
    )
  ) obs ON (obs.episode_id = ee.episode_id)
  LEFT JOIN
  (
    SELECT  COALESCE(answer_concept.concept_short_name,answer_concept.concept_full_name,o.value_datetime,o.value_numeric,o.value_text) AS value, ee.episode_id,cv.concept_full_name
    FROM obs o,
     concept_view cv,
     episode_encounter ee,
     concept_view answer_concept
    WHERE cv.concept_full_name IN ('Lab, HIV test result',
                                  'Lab, Hepatitis B antigen test result',
                                  'Lab, Hepatitis C antibody test result')
         AND o.encounter_id = ee.encounter_id
         AND o.voided=0
         AND cv.concept_id = o.concept_id
         AND answer_concept.concept_id = o.value_coded
         AND o.obs_datetime = (SELECT MAX(obs_datetime)
                               FROM obs ,episode_encounter
                               WHERE obs.concept_id = o.concept_id
                                     AND obs.voided=0
                                     AND episode_encounter.episode_id=ee.episode_id
                                     AND obs.encounter_id = episode_encounter.encounter_id)
  ) add_more_obs ON (add_more_obs.episode_id = ee.episode_id)
  LEFT JOIN (
    SELECT episode_id, dr.regimen_date,
       MAX( IF (cv.code ='E'      ,dr.dose,NULL)) AS E        ,
       MAX( IF (cv.code ='H'      ,dr.dose,NULL)) AS H        ,
       MAX( IF (cv.code ='R'      ,dr.dose,NULL)) AS R        ,
       MAX( IF (cv.code ='Z'      ,dr.dose,NULL)) AS Z        ,
       MAX( IF (cv.code ='Am'     ,dr.dose,NULL)) AS Am       ,
       MAX( IF (cv.code ='Km'     ,dr.dose,NULL)) AS Km       ,
       MAX( IF (cv.code ='Cm'     ,dr.dose,NULL)) AS Cm       ,
       MAX( IF (cv.code ='Lfx'    ,dr.dose,NULL)) AS Lfx      ,
       MAX( IF (cv.code ='Mfx'    ,dr.dose,NULL)) AS Mfx      ,
       MAX( IF (cv.code ='Cs'     ,dr.dose,NULL)) AS Cs       ,
       MAX( IF (cv.code ='PAS'    ,dr.dose,NULL)) AS PAS      ,
       MAX( IF (cv.code ='Pto'    ,dr.dose,NULL)) AS Pto      ,
       MAX( IF (cv.code ='Bdq'    ,dr.dose,NULL)) AS Bdq      ,
       MAX( IF (cv.code ='Dlm'    ,dr.dose,NULL)) AS Dlm      ,
       MAX( IF (cv.code ='Cfz'    ,dr.dose,NULL)) AS Cfz      ,
       MAX( IF (cv.code ='Lzd'    ,dr.dose,NULL)) AS Lzd      ,
       MAX( IF (cv.code ='Imp/Cln' ,dr.dose,NULL)) AS ImpCln   ,
       MAX( IF (cv.code ='Amx/Clv',dr.dose,NULL)) AS `Amx-Clv`
    FROM (
      SELECT drug.concept_id,drug.name ,IF(regimen_ord.date_stopped,NULL,regimen.dose) as dose ,regimen_episode.episode_id,reg.regimen_date
      FROM drug,
      drug_order regimen,
      orders regimen_ord,
      episode_encounter regimen_episode,
      (
        SELECT  episode_encounter.episode_id,MAX(COALESCE(date_stopped,scheduled_date,date_activated)) AS regimen_date
         FROM
           drug_order,
           orders,
           episode_encounter,
           concept_reference_term_map_view
         WHERE
           orders.order_id = drug_order.order_id AND orders.voided = 0 AND orders.order_action='NEW'
           AND episode_encounter.encounter_id = orders.encounter_id
           AND concept_reference_term_map_view.code IN
               ('E', 'H', 'R', 'Z', 'Am', 'Km', 'Cm', 'Lfx', 'Mfx', 'Cs', 'PAS', 'Pto', 'Bdq', 'Dlm', 'Cfz', 'Lzd', 'Imp/Cln', 'Amx/Clv')
           AND orders.concept_id = concept_reference_term_map_view.concept_id
         GROUP BY episode_encounter.episode_id
      ) reg WHERE regimen.order_id = regimen_ord.order_id
                  AND regimen_ord.encounter_id = regimen_episode.encounter_id
                  AND drug.drug_id = regimen.drug_inventory_id
                  AND reg.episode_id = regimen_episode.episode_id
                  AND regimen_ord.voided = 0  and regimen_ord.order_action = 'NEW'
                  AND (regimen_ord.date_stopped IS NULL OR reg.regimen_date <= regimen_ord.date_stopped)
    ) dr
    LEFT JOIN concept_reference_term_map_view cv ON (cv.concept_id = dr.concept_id
                                                     AND cv.concept_map_type_name = 'SAME-AS'
                                                     AND cv.concept_reference_source_name = 'Abbreviation')
    GROUP BY episode_id
  ) regimen  ON (regimen.episode_id = ee.episode_id)
  LEFT JOIN (
    SELECT MIN(o.scheduled_date) AS start_date, ee.episode_id ,d.name  ,
           SUM(TIMESTAMPDIFF(DAY,COALESCE(o.scheduled_date,o.date_activated),COALESCE(o.date_stopped,NOW())))/30 AS duration
    FROM episode_encounter ee,
      orders o,
      drug d,
      drug_order do
    WHERE o.order_id = do.order_id
          AND ee.encounter_id = o.encounter_id
          AND d.drug_id = do.drug_inventory_id
          AND o.voided = 0 AND o.order_action = 'NEW'
          AND o.scheduled_date <= NOW()
          AND d.name IN ('Delamanid (Dlm)', 'Bedaquiline (Bdq)')
    GROUP BY ee.episode_id,d.drug_id
  ) dd ON (dd.episode_id = ee.episode_id)
  LEFT JOIN (
     SELECT obs1.value_datetime AS latest_return_visit, ee.episode_id
     FROM obs obs1
       INNER JOIN concept_name cn ON cn.concept_id=obs1.concept_id AND cn.name='RETURN VISIT DATE' AND cn.concept_name_type='FULLY_SPECIFIED'
       INNER JOIN episode_encounter ee ON ee.encounter_id=obs1.encounter_id AND obs1.voided=0
       LEFT JOIN (
                   SELECT o.obs_datetime, o.obs_id, o.value_datetime, ee.episode_id
                   FROM obs o
                     INNER JOIN concept_name cn ON cn.concept_id=o.concept_id AND cn.name='RETURN VISIT DATE' AND cn.concept_name_type='FULLY_SPECIFIED' AND o.voided=0
                     INNER JOIN episode_encounter ee ON ee.encounter_id=o.encounter_id
       ) obs2 ON obs1.obs_datetime < obs2.obs_datetime AND ee.episode_id=obs2.episode_id
     WHERE obs2.obs_id IS NULL
  ) return_visit_obs ON ee.episode_id = return_visit_obs.episode_id
  LEFT JOIN (
    SELECT (COALESCE(o.value_datetime, o.obs_datetime)) AS end_of_treatment_date, ee.episode_id
    FROM obs o,
     concept_view cv,
     episode_encounter ee
    WHERE    cv.concept_full_name IN ('Tuberculosis treatment end date')
            AND o.encounter_id = ee.encounter_id
            AND cv.concept_id = o.concept_id
            AND o.voided = 0
    GROUP BY ee.episode_id
  ) end_of_treatment_obs ON ee.episode_id = end_of_treatment_obs.episode_id
WHERE person_name.person_id = patient_program.patient_id
      AND pi.patient_id = person_name.person_id
      AND p.person_id = person_name.person_id
      AND epp.patient_program_id = patient_program.patient_program_id
      AND patient_program.voided = 0
      AND ppa.patient_program_id = patient_program.patient_program_id
      AND ppa.attribute_type_id = pat.program_attribute_type_id
      AND (pat.name = 'Registration Number' OR pat.name = 'Registration Facility')
      AND ee.episode_id = epp.episode_id
      AND ee.encounter_id = e.encounter_id
      AND tStartDate.encounter_id = e.encounter_id
      AND tStartDate.concept_id = tStartDateConcept.concept_id
      AND tStartDate.voided = 0
      AND tStartDate.value_datetime BETWEEN startDate AND endDate
      AND tStartDateConcept.concept_full_name = 'TUBERCULOSIS DRUG TREATMENT START DATE'
      AND patient_program.program_id = program.program_id
      AND program.retired = 0
      AND program.concept_id = cn.concept_id
      AND cn.concept_name_type = 'FULLY_SPECIFIED'
      AND cn.voided = 0
GROUP BY epp.episode_id;

END
