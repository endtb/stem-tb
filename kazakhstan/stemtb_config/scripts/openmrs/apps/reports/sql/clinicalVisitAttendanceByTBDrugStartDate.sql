SELECT
  pi.identifier AS 'EMR ID',
  MAX(IF(pat.name='Registration Number', ppa.value_reference, NULL )) AS 'Registration Number',
  IFNULL(cf.facility, MAX(IF(pat.name='Registration Facility', (SELECT concept_full_name from concept_view WHERE concept_id = ppa.value_reference), NULL ))) AS 'Current Treatment Facility',
  MAX(IF(obs.concept_full_name = 'TUBERCULOSIS DRUG TREATMENT START DATE', DATE_FORMAT(obs.value, '%d/%b/%Y'), NULL))  AS 'Treatment Start Date',
  DATE_FORMAT(episodes_with_drugs.drug_start_date, '%d/%b/%Y') AS 'New Drug Start Date',
  DATE_FORMAT(end_of_treatment_obs.end_of_treatment_date, '%d/%b/%Y') AS 'End Of Treatment Date',

  MAX(IF(obs.concept_full_name = 'Baseline, Date of baseline',
    IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL -30 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 15 DAY), 'X', 'O'),
    'O'
  )) AS 'BL',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 15 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 15 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 46 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M1',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 46 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 46 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 76 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M2',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 76 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 76 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 107 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M3',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 107 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 107 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 137 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M4',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 137 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 137 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 168 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M5',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 168 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 168 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 198 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M6',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 198 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 198 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 229 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M7',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 229 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 229 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 259 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M8',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 259 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 259 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 290 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M9',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 290 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 290 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 320 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M10',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 320 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 320 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 351 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M11',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 351 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 351 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 381 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M12',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 381 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 381 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 412 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M13',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 412 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 412 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 442 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M14',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 442 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 442 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 473 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M15',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 473 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 473 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 503 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M16',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 503 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 503 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 534 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M17',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 534 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 534 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 564 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M18',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 564 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 564 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 595 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M19',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 595 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 595 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 625 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M20',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 625 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 625 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 656 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M21',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 656 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 656 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 686 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M22',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 686 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 686 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 717 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M23',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 717 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 717 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 747 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M24',

  IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 747 DAY) <= COALESCE(end_of_treatment_obs.end_of_treatment_date, NOW()),
    MAX(IF(obs.concept_full_name = 'Followup, Visit Date',
      IF(DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 747 DAY) <= obs.value AND obs.value < DATE_ADD(episodes_with_drugs.drug_start_date,INTERVAL 778 DAY), 'X', 'O'),
      'O')),
    NULL
  ) AS 'M25',

  IF(MAX(IF(obs.concept_full_name = 'EOT, Outcome', obs.value, NULL)) IS NOT NULL , 'X', 'O') AS 'Outcome',
  IF(MAX(IF(obs.concept_full_name = '6m PTO, 6 month post treatment outcome', obs.value, NULL)) IS NOT NULL , 'X', 'O') AS 'P6'

FROM
  patient_program pp,
  patient_identifier pi,
  episode_patient_program epp,
  patient_program_attribute ppa,
  program_attribute_type pat,
  encounter e,
  episode_encounter ee
  LEFT JOIN(
    SELECT ee.episode_id, COALESCE(answer_concept.concept_full_name, o.value_datetime, o.value_numeric, o.value_text) AS facility
    FROM   obs o
      JOIN concept_view cv ON cv.concept_id = o.concept_id AND o.voided=0
           AND cv.concept_full_name IN ( 'TI, Treatment facility at start', 'Treatment Facility Name' )
      JOIN concept_view answer_concept ON answer_concept.concept_id = o.value_coded
      JOIN episode_encounter ee ON o.encounter_id = ee.encounter_id
    WHERE  ( ee.episode_id, o.obs_datetime ) IN (
      SELECT  ee.episode_id, MAX(o.obs_datetime) AS max_date
      FROM   obs o
        JOIN concept_view cv ON   cv.concept_id = o.concept_id AND o.voided=0 AND
                             cv.concept_full_name IN ('TI, Treatment facility at start', 'Treatment Facility Name' )
        JOIN episode_encounter ee  ON  o.encounter_id = ee.encounter_id
      GROUP  BY ee.episode_id)
  ) AS cf ON cf.episode_id = ee.episode_id
  LEFT JOIN (
    SELECT ee.episode_id, cn.name AS drug_name, o.encounter_id, MIN(COALESCE (o.scheduled_date, o.date_activated)) AS drug_start_date
     FROM drug d
       INNER JOIN concept_name cn ON d.concept_id = cn.concept_id
                                     AND cn.name IN ('Bedaquiline','Delamanid')
                                     AND cn.concept_name_type='FULLY_SPECIFIED'
                                     AND d.retired=0
       INNER JOIN drug_order dro ON d.drug_id = dro.drug_inventory_id
       INNER JOIN orders o ON dro.order_id = o.order_id
                              AND o.voided=0
                              AND o.order_action != 'DISCONTINUE'
       INNER JOIN episode_encounter ee ON ee.encounter_id = o.encounter_id
     GROUP BY ee.episode_id
  ) AS episodes_with_drugs ON episodes_with_drugs.episode_id = ee.episode_id
  LEFT JOIN (
    SELECT  (COALESCE(o.value_datetime, o.obs_datetime)) AS end_of_treatment_date, ee.episode_id
     FROM    obs o,
       concept_view cv,
       episode_encounter ee
     WHERE    cv.concept_full_name IN ('Tuberculosis treatment end date')
              AND o.encounter_id = ee.encounter_id
              AND cv.concept_id = o.concept_id
              AND o.voided=0
     GROUP BY ee.episode_id
  ) end_of_treatment_obs ON ee.episode_id = end_of_treatment_obs.episode_id
  LEFT JOIN (
    SELECT cv.concept_full_name,
       ee.episode_id,
       COALESCE(answer_concept.concept_short_name,answer_concept.concept_full_name,o.value_datetime,o.value_numeric,o.value_text) AS value
    FROM obs o
      JOIN concept_view cv ON cv.concept_id = o.concept_id and o.voided=0
      LEFT JOIN concept_view answer_concept ON answer_concept.concept_id = o.value_coded
      JOIN episode_encounter ee ON o.encounter_id = ee.encounter_id
    WHERE cv.concept_full_name IN ('TUBERCULOSIS DRUG TREATMENT START DATE',
                                'Baseline, Date of baseline',
                                'Followup, Visit Date',
                                'EOT, Outcome',
                                '6m PTO, 6 month post treatment outcome')
  ) obs ON (obs.episode_id = ee.episode_id)
WHERE pi.patient_id = pp.patient_id
      AND ppa.patient_program_id = pp.patient_program_id
      AND ppa.attribute_type_id = pat.program_attribute_type_id
      AND (pat.name = 'Registration Number' OR pat.name = 'Registration Facility')
      AND epp.patient_program_id = pp.patient_program_id
      AND pp.voided = 0
      AND ee.episode_id = epp.episode_id
      AND ee.encounter_id = e.encounter_id
      AND episodes_with_drugs.drug_start_date BETWEEN '#startDate#' AND '#endDate#'
GROUP BY epp.episode_id, pp.patient_program_id;

