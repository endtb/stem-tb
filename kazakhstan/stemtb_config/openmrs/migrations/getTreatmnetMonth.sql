CREATE FUNCTION `getTreatmentMonth`(days float) RETURNS varchar(12) CHARSET utf8
BEGIN
	DECLARE month VARCHAR(12);
	DECLARE monthDiv int;
	DECLARE monthMod int;

	SET month = "NA";


	SET monthDiv = 0;
	SET monthMod = 0;

	set monthDiv =  days DIV 30.5;
	set monthMod =  MOD(days ,30.5);

	IF (days < -91.5) THEN
		RETURN NULL;
	END IF;
	
	IF (monthMod >= 15.25 ) then
		set monthDiv = monthDiv + 1;
	END IF;
		
	if (monthDiv < 0.5 and monthDiv > -3 and days > -91.5 and days < 15.25 ) then
		set month = "baseline";
	else
		set month = "M";
	end if;	
	
	if (month <> "baseline" ) then 
	set month = concat(month, cast(abs(monthDiv) as CHAR) );
	end if;

RETURN month;
END;

