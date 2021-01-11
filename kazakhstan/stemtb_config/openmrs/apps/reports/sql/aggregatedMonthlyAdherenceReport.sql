SELECT
	MAX( IF( pat.name = 'Registration Number', ppa.value_reference, NULL )) AS `Registration Number`,
	pi.identifier AS `EMR ID`,
	MAX( IF( other_obs.concept_full_name = 'TUBERCULOSIS DRUG TREATMENT START DATE', other_obs.value, NULL )) AS `ttr_start_date`,
	DATE_FORMAT( MAX( IF( other_obs.concept_full_name = 'TUBERCULOSIS DRUG TREATMENT START DATE', other_obs.value, NULL )), '%Y' ) as `year_ttr_start`,
	obs.obs_month_year AS `MTC_form_month_year`,
  CONVERT(MAX( IF( obs.concept_full_name = 'MTC, Overall DOT Rate', obs.value, NULL )), UNSIGNED INTEGER) AS `DOT Rate`,
  CONVERT(MAX( IF( obs.concept_full_name = 'MTC, Adherence rate', obs.value, NULL )), UNSIGNED INTEGER) AS `Adherence Rate`,
  CONVERT(MAX( IF( obs.concept_full_name = 'MTC, Completeness rate', obs.value, NULL )), UNSIGNED INTEGER) AS `Completeness Rate`,
	MAX( IF( other_obs.concept_full_name = 'Tuberculosis treatment end date', other_obs.value, NULL )) AS `END date`,
	MAX( IF( other_obs.concept_full_name = 'EOT, Outcome', other_obs.value, NULL )) AS `Outcome`,
	MAX( IF( obs.concept_full_name = 'MTC, Principal reason for treatment incomplete', obs.value, NULL )) AS `Principal Reasons`,
	MAX( IF( obs.concept_full_name = 'MTC, Detailed program related reason', obs.value, NULL )) AS  `Program Reasons`,
	MAX( IF( obs.concept_full_name = 'MTC, Detailed medical related reason', obs.value, NULL )) AS  `Medial Reasons`,
    MAX( IF( obs.concept_full_name = 'MTC, Detailed patient related reason', obs.value, NULL )) AS  `Patient Reasons`,
	DATEDIFF(MAX( IF( other_obs.concept_full_name = 'TUBERCULOSIS DRUG TREATMENT START DATE', other_obs.value, NULL )),'1900-01-01') AS `Stamp`
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
LEFT JOIN(
		SELECT
			cv.concept_full_name,
			ee.episode_id,
			COALESCE(
				answer_concept.concept_short_name,
				answer_concept.concept_full_name,
				o.value_datetime,
				o.value_numeric,
				o.value_text
			) AS value,
			DATE_FORMAT( o.obs_datetime, '%Y%b' ) as obs_month_year
		FROM
			obs o
		JOIN concept_view cv ON
			cv.concept_id = o.concept_id
			and o.voided = 0
		JOIN episode_encounter ee ON
			o.encounter_id = ee.encounter_id
		LEFT OUTER JOIN concept_view answer_concept ON
			answer_concept.concept_id = o.value_coded
		WHERE
			cv.concept_full_name IN(
				'MTC, Completeness rate',
				'MTC, Adherence rate',
				'MTC, Overall DOT Rate',
				'MTC, Principal reason for treatment incomplete',
				'MTC, Month and year of treatment period',
				'MTC, Detailed program related reason',
				'MTC, Detailed medical related reason',
				'MTC, Detailed patient related reason'
			)
	) obs ON
	(
		obs.episode_id = ee.episode_id
	)
LEFT OUTER JOIN(
		SELECT
			cv.concept_full_name,
			ee.episode_id,
			COALESCE(
				answer_concept.concept_short_name,
				answer_concept.concept_full_name,
				o.value_datetime,
				o.value_numeric,
				o.value_text
			) AS value
		FROM
			obs o
		JOIN concept_view cv ON
			cv.concept_id = o.concept_id
			AND o.voided = 0
		JOIN episode_encounter ee ON
			o.encounter_id = ee.encounter_id
		LEFT OUTER JOIN concept_view answer_concept ON
			answer_concept.concept_id = o.value_coded
		WHERE
			cv.concept_full_name IN(
				'EOT, Outcome',
				'TUBERCULOSIS DRUG TREATMENT START DATE',
				'Tuberculosis treatment end date'
			)
	) other_obs ON 	( other_obs.episode_id = ee.episode_id )
	LEFT OUTER JOIN (
		SELECT
			ee.episode_id,
			o.value_datetime
		FROM
			obs o
		INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
		AND o.voided IS FALSE
		AND cn.concept_name_type='FULLY_SPECIFIED' AND cn.name = 'Tuberculosis treatment end date'
		INNER JOIN episode_encounter ee ON ee.encounter_id = o.encounter_id
	) treatment_end_date ON ( treatment_end_date.episode_id = ee.episode_id )		
WHERE
	person_name.person_id = patient_program.patient_id
	AND pi.patient_id = person_name.person_id
	AND p.person_id = person_name.person_id
	AND epp.patient_program_id = patient_program.patient_program_id
	AND patient_program.voided = 0
	AND ppa.patient_program_id = patient_program.patient_program_id
	AND ppa.attribute_type_id = pat.program_attribute_type_id
	AND (pat.name = 'Registration Number')
	AND ee.episode_id = epp.episode_id
	AND ee.encounter_id = e.encounter_id
	AND tStartDate.encounter_id = e.encounter_id
	AND tStartDate.concept_id = tStartDateConcept.concept_id
	AND tStartDate.voided = 0
	AND DATE_FORMAT( tStartDate.value_datetime, '%Y' ) <= DATE_FORMAT( '#startDate#', '%Y' )
	AND ( DATE_FORMAT( treatment_end_date.value_datetime, '%Y' ) >= DATE_FORMAT( '#startDate#', '%Y' ) OR treatment_end_date.value_datetime IS NULL )
	AND tStartDateConcept.concept_full_name = 'TUBERCULOSIS DRUG TREATMENT START DATE'
	AND patient_program.program_id = program.program_id
	AND program.retired = 0
	AND program.concept_id = cn.concept_id
	AND cn.concept_name_type = 'FULLY_SPECIFIED'
	AND cn.voided = 0
GROUP BY
	epp.episode_id,
	obs.obs_month_year;

