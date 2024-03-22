/**
  The other existing functions do not seem to appropriately create both terms and mappings, or handle the situation
  where either the term or the mapping could already exist.  This aims to support those use cases.  MS, March 2024
  This creates a term, if needed, and then creates the mapping.  It returns the concept_reference_map_id of the mapping.
 */
CREATE PROCEDURE add_concept_same_as_mapping(IN _concept_id int, IN _source_name varchar(255), IN _term varchar(255))
BEGIN

    -- Create a term if needed, and ensure if the term already exists then it is not retired.
    set @term_id = null;
    select concept_source_id into @source_id from concept_reference_source where name = _source_name;
    select concept_reference_term_id into @term_id from concept_reference_term where concept_source_id = @source_id and code = _term;
    if (@term_id is null) then
        select uuid() into @term_uuid;
        insert into concept_reference_term (concept_source_id, code, creator, date_created, uuid) values (@source_id, _term, 1, now(), @term_uuid);
        select concept_reference_term_id into @term_id from concept_reference_term where uuid = @term_uuid;
    end if;
    update concept_reference_term set retired = 0, retired_by = null, retire_reason = null, date_retired = null where concept_reference_term_id = @term_id;

    -- Create a mapping if needed
    set @map_id = null;
    select concept_map_type_id into @same_as from concept_map_type where name = 'SAME-AS';
    select concept_map_id into @map_id from concept_reference_map where concept_reference_term_id = @term_id and concept_id = _concept_id and concept_map_type_id = @same_as;
    if (@map_id is null) then
        select uuid() into @map_uuid;
        insert into concept_reference_map (concept_reference_term_id, concept_map_type_id, concept_id, creator, date_created, uuid) values (@term_id, @same_as, _concept_id, 1, now(), @map_uuid);
        select concept_map_id into @map_id from concept_reference_map where uuid = @map_uuid;
    end if;

END;
