SELECT 
    pi.identifier AS 'EMR ID',
    DATE(ttr.obs_datetime) AS 'Treatment start date',
    DATE(bdq.BDQDATE) AS 'BDQ start date',
    DATE(dlm.DLMDATE) AS 'DLM start date',
    DATEDIFF(scd.obs_datetime, ttr.obs_datetime) AS 'Days',
    TRUNCATE(DATEDIFF(scd.obs_datetime, ttr.obs_datetime) / 30,
        1) AS 'Month',
    DATE(ttr_end.obs_datetime) AS 'Treatment end date',
    DATE(scd.obs_datetime) AS 'Sample collection date',
    sid.value_text AS 'Sample ID',
    (SELECT 
            name
        FROM
            concept_name
        WHERE
            c.value_coded = concept_id
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'SHORT') AS 'Culture result',
    (SELECT 
            name
        FROM
            concept_name
        WHERE
            cons.value_coded = concept_id
                AND voided = 0
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'SHORT') AS 'Consent obtained for isolate freezing/storing (Y/N)',
    (SELECT 
            name
        FROM
            concept_name
        WHERE
            frozen.value_coded = concept_id
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'SHORT') AS 'Isolate frozen (Y/N)?',
    (SELECT 
            name
        FROM
            concept_name
        WHERE
            shipment_details.specimen_shipped = concept_id
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'SHORT') AS 'Specimen shipped?',
    shipment_details.date_specimen_shipped AS 'Date of shipment',
    shipment_details.shipment_id AS 'Shipment ID',
    shipment_details.shipment_lab AS 'Laboratory specimen shipped to?',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_bdq.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Bdq',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_dlm.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Dlm',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_cfz.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Cfz',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_lzd.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Lzd',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_h_0_2.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'H Low',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_h_1.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'H High',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_r.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'R',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_e.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'E',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_s.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'S',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_z.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Z',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_ofx.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Ofx',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_lfx.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Lfx',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_mfx_0_5.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Mfx Low',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_mfx_2.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Mfx High',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_am.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Am',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_km.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Km',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_cm.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Cm',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_eto.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Eto',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_cs.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'Cs',
    IF(dst_q.value_coded = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'True' AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'FULLY_SPECIFIED'),
        (SELECT 
                LEFT(name, 3)
            FROM
                concept_name
            WHERE
                concept_id = dst_pas.value_coded
                    AND locale = 'en'
                    AND voided = 0
                    AND concept_name_type = 'SHORT'),
        NULL) AS 'PAS'
FROM
    obs c
        JOIN
    obs o ON c.obs_group_id = o.obs_id
        AND c.voided = 0
        AND c.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Culture results'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND c.value_coded = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Positive for M. tuberculosis'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        JOIN
    obs o1 ON o.obs_group_id = o1.obs_id
        AND o.voided = 0
        AND o.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Culture results details'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND o1.voided = 0
        AND o1.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology Results'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        LEFT JOIN
    obs frozen ON frozen.obs_group_id = c.obs_group_id
        AND frozen.voided = 0
        AND frozen.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Culture frozen for future research?'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        LEFT JOIN
    obs scd ON scd.obs_group_id = o1.obs_group_id
        AND scd.voided = 0
        AND scd.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Specimen Collection Date'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        LEFT JOIN
    obs sid ON sid.obs_group_id = o1.obs_group_id
        AND sid.voided = 0
        AND sid.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Specimen Id' AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        JOIN
    obs ttr ON ttr.voided = 0
        AND ttr.person_id = c.person_id
        AND DATEDIFF(scd.obs_datetime, ttr.obs_datetime) >= - 60
	AND ttr.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
        AND ttr.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'TUBERCULOSIS DRUG TREATMENT START DATE'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        LEFT JOIN
    (SELECT 
        patient_id, DATE(MIN(scheduled_date)) AS 'BDQDATE'
    FROM
        orders o
    WHERE
        o.concept_id = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'Bedaquiline (Bdq)'
                    AND voided = 0
                    AND locale = 'en'
                    AND concept_name_type = 'SHORT')
            AND o.voided = 0
            AND auto_expire_date IS NULL
    GROUP BY patient_id) bdq ON bdq.patient_id = c.person_id
        LEFT JOIN
    (SELECT 
        patient_id, DATE(MIN(scheduled_date)) AS 'DLMDATE'
    FROM
        orders o
    WHERE
        o.concept_id = (SELECT 
                concept_id
            FROM
                concept_name
            WHERE
                name = 'Delamanid (Dlm)' AND voided = 0
                    AND locale = 'en'
                    AND concept_name_type = 'SHORT')
            AND o.voided = 0
            AND auto_expire_date IS NULL
    GROUP BY patient_id) dlm ON dlm.patient_id = c.person_id
        JOIN
    patient_identifier pi ON pi.patient_id = c.person_id
        AND pi.voided = 0
        LEFT JOIN
    obs cons ON cons.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'T.I, Consent for freezing isolates signed'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND cons.voided = 0
        AND cons.person_id = c.person_id
        LEFT JOIN
    obs ttr_end ON ttr_end.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Tuberculosis treatment end date'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND ttr_end.voided = 0
        AND ttr_end.person_id = c.person_id
        LEFT JOIN
    obs dst ON dst.obs_group_id = o.obs_group_id
        AND dst.voided = 0
        AND dst.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, DST result details'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        LEFT JOIN
    obs dst_dlm ON dst_dlm.obs_group_id = dst.obs_id
        AND dst_dlm.voided = 0
        AND dst_dlm.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Delamanid result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_dlm.encounter_id
        LEFT JOIN
    obs dst_cs ON dst_cs.obs_group_id = dst.obs_id
        AND dst_cs.voided = 0
        AND dst_cs.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Cycloserine result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_cs.encounter_id
        LEFT JOIN
    obs dst_pas ON dst_pas.obs_group_id = dst.obs_id
        AND dst_pas.voided = 0
        AND dst_pas.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, PAS result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        LEFT JOIN
    obs dst_bdq ON dst_bdq.obs_group_id = dst.obs_id
        AND dst_bdq.voided = 0
        AND dst_bdq.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Bedaquiline result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_bdq.encounter_id
        LEFT JOIN
    obs dst_lzd ON dst_lzd.obs_group_id = dst.obs_id
        AND dst_lzd.voided = 0
        AND dst_lzd.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Linezolid result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_lzd.encounter_id
        LEFT JOIN
    obs dst_cfz ON dst_cfz.obs_group_id = dst.obs_id
        AND dst_cfz.voided = 0
        AND dst_cfz.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Clofazamine result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_cfz.encounter_id
        LEFT JOIN
    obs dst_h_0_2 ON dst_h_0_2.obs_group_id = dst.obs_id
        AND dst_h_0_2.voided = 0
        AND dst_h_0_2.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Isoniazid 0.2 µg/ml result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_h_0_2.encounter_id
        LEFT JOIN
    obs dst_h_1 ON dst_h_1.obs_group_id = dst.obs_id
        AND dst_h_1.voided = 0
        AND dst_h_1.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Isoniazid 1 µg/ml result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_h_1.encounter_id
        LEFT JOIN
    obs dst_r ON dst_r.obs_group_id = dst.obs_id
        AND dst_r.voided = 0
        AND dst_r.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Rifampicin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_r.encounter_id
        LEFT JOIN
    obs dst_s ON dst_s.obs_group_id = dst.obs_id
        AND dst_s.voided = 0
        AND dst_s.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Streptomycin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_s.encounter_id
        LEFT JOIN
    obs dst_e ON dst_e.obs_group_id = dst.obs_id
        AND dst_e.voided = 0
        AND dst_e.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Ethambutol result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_e.encounter_id
        LEFT JOIN
    obs dst_z ON dst_z.obs_group_id = dst.obs_id
        AND dst_z.voided = 0
        AND dst_z.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Pyrazinamide result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_z.encounter_id
        LEFT JOIN
    obs dst_ofx ON dst_ofx.obs_group_id = dst.obs_id
        AND dst_ofx.voided = 0
        AND dst_ofx.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Ofloxacin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_ofx.encounter_id
        LEFT JOIN
    obs dst_lfx ON dst_lfx.obs_group_id = dst.obs_id
        AND dst_lfx.voided = 0
        AND dst_lfx.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Levofloxacin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_lfx.encounter_id
        LEFT JOIN
    obs dst_mfx_0_5 ON dst_mfx_0_5.obs_group_id = dst.obs_id
        AND dst_mfx_0_5.voided = 0
        AND dst_mfx_0_5.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Moxifloxacin 0.5 µg/ml results'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_mfx_0_5.encounter_id
        LEFT JOIN
    obs dst_mfx_2 ON dst_mfx_2.obs_group_id = dst.obs_id
        AND dst_mfx_2.voided = 0
        AND dst_mfx_2.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Moxifloxacin 2 µg/ml results'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_mfx_2.encounter_id
        LEFT JOIN
    obs dst_am ON dst_am.obs_group_id = dst.obs_id
        AND dst_am.voided = 0
        AND dst_am.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Amikacin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_am.encounter_id
        LEFT JOIN
    obs dst_km ON dst_km.obs_group_id = dst.obs_id
        AND dst_km.voided = 0
        AND dst_km.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Kanamycin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_km.encounter_id
        LEFT JOIN
    obs dst_cm ON dst_cm.obs_group_id = dst.obs_id
        AND dst_cm.voided = 0
        AND dst_cm.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Capreomycin result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_cm.encounter_id
        LEFT JOIN
    obs dst_eto ON dst_eto.obs_group_id = dst.obs_id
        AND dst_eto.voided = 0
        AND dst_eto.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Bacteriology, Ethionamide result'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_eto.encounter_id
        LEFT JOIN
    obs dst_q ON dst_q.obs_group_id = dst.obs_id
        AND dst_q.voided = 0
        AND dst_q.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Are the dst results from the KIT lab(frozen culture dst results)?'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND dst.encounter_id = dst_q.encounter_id
        LEFT JOIN
    (SELECT 
        sh.person_id,
            sh.value_coded AS specimen_shipped,
            DATE(shd.value_datetime) AS date_specimen_shipped,
            shid.value_text AS shipment_id,
            shl.value_text AS shipment_lab,
            pshd.obs_group_id AS shipment_obs_groupid
    FROM
        obs sh
    JOIN obs shd ON sh.obs_group_id = shd.obs_group_id
        AND shd.voided = 0
        AND sh.voided = 0
        AND sh.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Culture, Specimen shipped'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
        AND shd.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Culture, Date of shipment'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
    JOIN obs shid ON shd.obs_group_id = shid.obs_group_id
        AND shid.voided = 0
        AND shid.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Culture, Shipment ID Number'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
    JOIN obs shl ON shl.obs_group_id = shid.obs_group_id
        AND shl.voided = 0
        AND shl.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Culture, Laboratory specimen shipped to'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')
    JOIN obs pshd ON pshd.obs_id = shd.obs_group_id
        AND pshd.voided = 0
        AND pshd.concept_id = (SELECT 
            concept_id
        FROM
            concept_name
        WHERE
            name = 'Culture, Shipment Details'
                AND voided = 0
                AND locale = 'en'
                AND concept_name_type = 'FULLY_SPECIFIED')) shipment_details ON c.obs_group_id = shipment_details.shipment_obs_groupid
ORDER BY pi.identifier , scd.obs_datetime;
