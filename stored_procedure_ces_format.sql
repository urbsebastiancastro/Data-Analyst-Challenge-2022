-- DROP PROCEDURE api.format_table(text);

CREATE OR REPLACE PROCEDURE api.format_table(IN table_name text)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    -- Rename the column 'series_id year period value footnote_codes' to 'series_id_year_period_value_footnote_codes'
    EXECUTE format('ALTER TABLE api.%I 
					RENAME COLUMN "series_id        	year	period	       value	footnote_codes" 
					TO series_id_year_period_value_footnote_codes', table_name);

    -- Extract the 'series_id' from the 'series_id_year_period_value_footnote_codes' column
    EXECUTE format('UPDATE api.%I 
					SET series_id = SUBSTRING(series_id_year_period_value_footnote_codes FROM 1 FOR 13)', table_name);

    -- Extract the 'year_' from the 'series_id_year_period_value_footnote_codes' column
    EXECUTE format('UPDATE api.%I 
					SET year_ = SUBSTRING(series_id_year_period_value_footnote_codes FROM 19 FOR 4)', table_name);

    -- Extract the 'period_' from the 'series_id_year_period_value_footnote_codes' column
    EXECUTE format('UPDATE api.%I 
					SET period_ = SUBSTRING(series_id_year_period_value_footnote_codes FROM 24 FOR 3)', table_name);

    -- Extract the 'value' from the 'series_id_year_period_value_footnote_codes' column
    EXECUTE format('UPDATE api.%I 
					SET value = SUBSTRING(series_id_year_period_value_footnote_codes FROM 28 FOR 14)', table_name);

    -- Remove spaces from the 'value' column
    EXECUTE format('UPDATE api.%I 
					SET value = REPLACE(value, '' '', '''')', table_name);

    -- Remove tabs from the 'value' column
    EXECUTE format('UPDATE api.%I 
					SET value = REPLACE(value, ''	'', '''')', table_name);

    -- Set 'footnote_codes' to 'P' where 'value' contains 'P'
    EXECUTE format('UPDATE api.%I 
					SET footnote_codes = ''P'' WHERE value LIKE ''%%P%%''', table_name);

    -- Remove 'P' from the 'value' column
    EXECUTE format('UPDATE api.%I 
					SET value = REPLACE(value, ''P'', '''')', table_name);

    -- Convert the 'period_' codes to month names in the 'month' column
    EXECUTE format('UPDATE api.%I SET month_ = 
					CASE 
						WHEN period_ = ''M01'' THEN ''January'' 
						WHEN period_ = ''M02'' THEN ''February'' 
						WHEN period_ = ''M03'' THEN ''March'' 
						WHEN period_ = ''M04'' THEN ''April'' 
						WHEN period_ = ''M05'' THEN ''May'' 
						WHEN period_ = ''M06'' THEN ''June'' 
						WHEN period_ = ''M07'' THEN ''July'' 
						WHEN period_ = ''M08'' THEN ''August'' 
						WHEN period_ = ''M09'' THEN ''September'' 
						WHEN period_ = ''M10'' THEN ''October'' 
						WHEN period_ = ''M11'' THEN ''November'' 
						WHEN period_ = ''M12'' THEN ''December'' 
						WHEN period_ = ''M13'' THEN ''Annual_averages'' 
						ELSE period_ 
					END', table_name);

    -- Drop the 'series_id_year_period_value_footnote_codes' column as it's no longer needed
    EXECUTE format('ALTER TABLE api.%I DROP COLUMN series_id_year_period_value_footnote_codes', table_name);
END;
$procedure$
;
