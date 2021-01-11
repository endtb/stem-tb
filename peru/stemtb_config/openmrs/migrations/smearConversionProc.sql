CREATE
	PROCEDURE smear_conversion() 
BEGIN 
		
		CREATE TEMPORARY TABLE tempsmear
		
		SELECT
			COALESCE(
				MAX( CASE WHEN cn.name = 'Three plus' THEN 'S+++' END ),
				MAX( CASE WHEN cn.name = 'Two plus' THEN 'S++' END ),
				MAX( CASE WHEN cn.name = 'One plus' THEN 'S+' END ),
				MAX( CASE WHEN cn.name = 'Scanty 4-9' THEN 'Scanty+' END ),
				MAX( CASE WHEN cn.name = 'Scanty 1-3' THEN 'Scanty' END ),
				MAX( CASE WHEN cn.name = 'Negative' THEN 'S-' END ),
				MAX( CASE WHEN cn.name = 'Not read' THEN 'Not read' END ),
				NULL
			) AS SmearResults,
			COALESCE(
				MAX( CASE WHEN cn.name = 'Three plus' THEN obs.obs_datetime END ),
				MAX( CASE WHEN cn.name = 'Two plus' THEN obs.obs_datetime END ),
				MAX( CASE WHEN cn.name = 'One plus' THEN obs.obs_datetime END ),
				MAX( CASE WHEN cn.name = 'Scanty 4-9' THEN obs.obs_datetime END ),
				MAX( CASE WHEN cn.name = 'Scanty 1-3' THEN obs.obs_datetime END ),
				MAX( CASE WHEN cn.name = 'Negative' THEN obs.obs_datetime END ),
				MAX( CASE WHEN cn.name = 'Not read' THEN obs.obs_datetime END ),
				NULL
			) AS SmearDateOfCollection,
			epp.patient_program_id,
			getTreatmentMonth(
				Datediff(
					obs.obs_datetime,
					ttro.value_datetime
				)
			) TreatmentMonth
	FROM
		obs
	JOIN concept_view cv ON
		obs.concept_id = cv.concept_id
		AND cv.concept_full_name IN('Bacteriology, Smear result')
	JOIN concept_name cn ON
		cn.concept_id = obs.value_coded
		AND obs.voided = 0
		AND cn.voided = 0
		AND cn.concept_name_type = 'FULLY_SPECIFIED'
	JOIN episode_encounter ee ON
		obs.encounter_id = ee.encounter_id
	JOIN episode_patient_program epp ON
		ee.episode_id = epp.episode_id
	JOIN episode_encounter ttree ON
		ttree.episode_id = epp.episode_id
	JOIN obs ttro ON
		ttro.encounter_id = ttree.encounter_id
	INNER JOIN concept_name ttrcn ON
		ttro.concept_id = ttrcn.concept_id
		AND ttro.voided = 0
		AND ttrcn.voided = 0
		AND ttrcn.concept_name_type = 'FULLY_SPECIFIED'
		AND ttrcn.name = 'TUBERCULOSIS DRUG TREATMENT START DATE'
	JOIN patient_program pp ON
		epp.patient_program_id = pp.patient_program_id
		and pp.voided = 0
	GROUP BY
		epp.patient_program_id,
		TreatmentMonth;
END
