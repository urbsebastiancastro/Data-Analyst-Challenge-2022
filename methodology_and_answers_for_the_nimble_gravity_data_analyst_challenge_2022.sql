-- FOR NIMBLE GRAVITY DATA ANALYST CHALLENGE 2022 BY MAURO LOPEZ
-- METHODOLOGY AND ANSWERS BY SEBASTIAN CASTRO

-- Creating the structure of the table 'ce_data_90a_government_employment'
CREATE TABLE api.ce_data_90a_government_employment (
    series_id varchar(255) NULL,
    year_ int4 NULL,
    period_ varchar(255) NULL,
    month_ varchar(20) NULL,
    value numeric NULL,
    footnote_codes varchar(255) NULL,
    superserie_code varchar(2) NULL,
    industry_code varchar(2) NULL
);

-- Exporting the 'ce_data_90a_government_employment.csv' table using DBEAVER tools.

-- Calling the 'process_table' function with 'ce_data_0_allcesseries' as the argument.
CALL process_table('ce_data_90a_government_employment');

-- THE FOLLOWING IS COMMENTED OUT BECAUSE IT PERFORMS THE SAME OPERATIONS AS THE PREVIOUS STORED PROCEDURE
/*
-- Rename the column 'series_id year period value footnote_codes' to 'series_id_year_period_value_footnote_codes'
alter table api.ce_data_90a_government_employment 
rename column "series_id        	year	period	       value	footnote_codes"	to  series_id_year_period_value_footnote_codes;

-- Extract the 'series_id' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_90a_government_employment
SET series_id = SUBSTRING(series_id_year_period_value_footnote_codes FROM 1 FOR 13);

-- Extract the 'year_' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_90a_government_employment
SET year_ = SUBSTRING(series_id_year_period_value_footnote_codes FROM 19 FOR 4);

-- Extract the 'period_' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_90a_government_employment 
SET period_ = SUBSTRING(series_id_year_period_value_footnote_codes FROM 24 FOR 3);

-- Extract the 'value' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_90a_government_employment 
SET value = SUBSTRING(series_id_year_period_value_footnote_codes FROM 28 FOR 14);

-- Remove spaces from the 'value' column
UPDATE api.ce_data_90a_government_employment
SET value = REPLACE(value, ' ', '');

-- Remove tabs from the 'value' column
UPDATE api.ce_data_90a_government_employment
SET value = REPLACE(value, '	', '');

-- Set 'footnote_codes' to 'P' where 'value' contains 'P'
update api.ce_data_90a_government_employment
set footnote_codes = 'P'
where value like '%P%';

-- Remove 'P' from the 'value' column
UPDATE api.ce_data_90a_government_employment
SET value = REPLACE(value, 'P', '');

-- Convert the 'period_' codes to month names in the 'month_' column
UPDATE api.ce_data_90a_government_employment
SET month_ = 
CASE 
    WHEN period_ = 'M01' THEN 'January'
    WHEN period_ = 'M02' THEN 'February'
    WHEN period_ = 'M03' THEN 'March'
    WHEN period_ = 'M04' THEN 'April'
    WHEN period_ = 'M05' THEN 'May'
    WHEN period_ = 'M06' THEN 'June'
    WHEN period_ = 'M07' THEN 'July'
    WHEN period_ = 'M08' THEN 'August'
    WHEN period_ = 'M09' THEN 'September'
    WHEN period_ = 'M10' THEN 'October'
    WHEN period_ = 'M11' THEN 'November'
    WHEN period_ = 'M12' THEN 'December'
    WHEN period_ = 'M13' THEN 'Annual_averages'
    ELSE period_
END;

-- Drop the 'series_id_year_period_value_footnote_codes' column as it's no longer needed
alter table api.ce_data_90a_government_employment drop column series_id_year_period_value_footnote_codes;
*/

-- Creating the view that shows the information from the 'api.women_in_government' table as requested in the challenge
CREATE OR REPLACE VIEW api.women_in_government AS 
SELECT month_ || ' ' || year_ AS date, value AS valueInThousands 
FROM api.ce_data_90a_government_employment 
WHERE series_id = 'CES9000000010' 
ORDER BY year_, period_;

-- Granting select permissions on the 'api.women_in_government' view to the 'web_anon' user.
GRANT SELECT ON api.women_in_government TO web_anon;

-- Selecting the view women_in_government and obtaining the first objective of the Data Analyst Challenge 2022
-- How was the evolution of women in goverment during time?
SELECT * FROM api.women_in_government;

---------------------------------

-- Create the structure of the table 'api.ce_data_0_allcesseries'.
CREATE TABLE api.ce_data_0_allcesseries ( 
    series_id varchar(255) NULL, 
    year_ int4 NULL, 
    period_ varchar(255) NULL, 
    "month" varchar(20) null, 
    value numeric NULL, 
    superserie_code varchar (2), 
    industry_code varchar (2), 
    footnote_codes varchar(255) NULL 
);

-- Exporting the 'ce_data_0_allcesseries.csv' table using DBEAVER tools.

-- Calling the 'process_table' function with 'ce_data_0_allcesseries' as the argument.
CALL process_table('ce_data_0_allcesseries');

-- THE FOLLOWING IS COMMENTED OUT BECAUSE IT PERFORMS THE SAME OPERATIONS AS THE PREVIOUS STORED PROCEDURE
/*
-- Rename the column 'series_id year period value footnote_codes' to 'series_id_year_period_value_footnote_codes'
alter table api.ce_data_0_allcesseries 
rename column "series_id        	year	period	       value	footnote_codes"	to  series_id_year_period_value_footnote_codes;

-- Extract the 'series_id' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_0_allcesseries
SET series_id = SUBSTRING(series_id_year_period_value_footnote_codes FROM 1 FOR 13);

-- Extract the 'year_' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_0_allcesseries
SET year_ = SUBSTRING(series_id_year_period_value_footnote_codes FROM 19 FOR 4);

-- Extract the 'period_' from the 'series_id_year_period_value_footnote_codes' column
UPDATE api.ce_data_0_allcesseries
SET period_ = SUBSTRING(series_id_year_period_value_footnote_codes FROM 24 FOR 3);

-- Extract the 'value' from the 'series_id_year_period_value_footnote_codes' column
UPDATEapi.ce_data_0_allcesseries
SET value = SUBSTRING(series_id_year_period_value_footnote_codes FROM 28 FOR 14);

-- Remove spaces from the 'value' column
UPDATE api.ce_data_0_allcesseries
SET value = REPLACE(value, ' ', '');

-- Remove tabs from the 'value' column
UPDATE api.ce_data_0_allcesseries
SET value = REPLACE(value, '	', '');

-- Set 'footnote_codes' to 'P' where 'value' contains 'P'
update api.ce_data_0_allcesseries
set footnote_codes = 'P'
where value like '%P%';

-- Remove 'P' from the 'value' column
UPDATE api.ce_data_0_allcesseries
SET value = REPLACE(value, 'P', '');

-- Convert the 'period_' codes to month names in the 'month_' column
UPDATE api.ce_data_0_allcesseries
SET month_ = 
CASE 
    WHEN period_ = 'M01' THEN 'January'
    WHEN period_ = 'M02' THEN 'February'
    WHEN period_ = 'M03' THEN 'March'
    WHEN period_ = 'M04' THEN 'April'
    WHEN period_ = 'M05' THEN 'May'
    WHEN period_ = 'M06' THEN 'June'
    WHEN period_ = 'M07' THEN 'July'
    WHEN period_ = 'M08' THEN 'August'
    WHEN period_ = 'M09' THEN 'September'
    WHEN period_ = 'M10' THEN 'October'
    WHEN period_ = 'M11' THEN 'November'
    WHEN period_ = 'M12' THEN 'December'
    WHEN period_ = 'M13' THEN 'Annual_averages'
    ELSE period_
END;

-- Drop the 'series_id_year_period_value_footnote_codes' column as it's no longer needed
alter table api.ce_data_0_allcesseries drop column series_id_year_period_value_footnote_codes;
*/


-- Create the structure of the table  'api.ce_data_06_production_and_nonsupervisory_employees'
CREATE TABLE api.ce_data_06_production_and_nonsupervisory_employees ( 
    series_id varchar(255) NULL, 
    year_ int4 NULL, 
    period_ varchar(255) NULL, 
    month_ varchar(20) NULL, 
    value numeric NULL, 
    footnote_codes varchar(255) NULL, 
    superserie_code varchar(2) NULL, 
    industry_code varchar(2) NULL 
);

-- Inserting the data corresponding to the number of production_and_nonsupervisory_employees based on the supersectors codes.
INSERT INTO api.ce_data_06_production_and_nonsupervisory_employees 
SELECT * 
FROM api.ce_data_0_allcesseries cda 
WHERE SUBSTRING(series_id, 4, 2) IN ( '05','06','07','08','10','20','30','31','32','40','41','42','43','44','50','55','60','65','70','80','90') 
and substring(series_id, 1, 3) = 'CES'
AND SUBSTRING(series_id, 6, 6) = '000000' 
AND industry_code = '06';

-- Granting select permissions on the 'api.ce_data_06_production_and_nonsupervisory_employees' table to the 'web_anon' user.
GRANT SELECT ON api.ce_data_06_production_and_nonsupervisory_employees TO web_anon;

-- Create the structure of the table 'api.ce_data_06_supervisory_employees'
CREATE TABLE api.ce_data_06_supervisory_employees ( 
    series_id varchar(255) NULL, 
    year_ int4 NULL, 
    period_ varchar(255) NULL, 
    month_ varchar(20) NULL, 
    value numeric NULL, 
    footnote_codes varchar(255) NULL, 
    superserie_code varchar(2) NULL, 
    industry_code varchar(2) NULL 
);
-- Inserting the data from 'api.ce_data_06_production_and_nonsupervisory_employees', except for the 'value' column data, which will be calculated later.
INSERT INTO api.ce_data_06_supervisory_employees (series_id, year_ , period_ ,month_ , footnote_codes ,superserie_code , industry_code) 
SELECT series_id, year_ , period_ ,month_ , footnote_codes ,superserie_code , industry_code 
FROM api.ce_data_06_production_and_nonsupervisory_employees;

-- Updating the 'value' column by calculating the difference between the total number of employees and the total number of production_and_nonsupervisory_employees.
UPDATE api.ce_data_06_supervisory_employees AS m1 
SET value = t1.resta
FROM ( 
    SELECT CONCAT(t3.series_id, t3.year_, t3.period_) AS clave, t2.value - t3.value AS resta 
    FROM api.ce_data_06_production_and_nonsupervisory_employees AS t3, api.ce_data_0_allcesseries AS t2 
    WHERE t2.industry_code = '01' 
    AND SUBSTRING(t3.series_id, 1, 10) = SUBSTRING(t2.series_id, 1, 10) 
    AND t2.year_=t3.year_ 
    AND t2.period_=t3.period_
) t1 
WHERE t1.clave = CONCAT(m1.series_id, m1.year_, m1.period_);

-- Creating a function 'api.get_employee_ratio' that returns a table with the ratio between production_employees and supervisory_employees
CREATE OR REPLACE FUNCTION api.get_employee_ratio()
 RETURNS TABLE(year_ integer, period_ character varying, production_employees numeric, supervisory_employees numeric, employees_ratio numeric)
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN QUERY 
    SELECT 
        t1.year_, 
        t1.period_, 
        SUM(t1.value) AS production_employees, 
        SUM(t2.value) AS supervisory_employees, 
        SUM(t1.value)/ SUM(t2.value) AS employees_ratio
    FROM 
        api.ce_data_06_production_and_nonsupervisory_employees AS t1
    JOIN 
        api.ce_data_06_supervisory_employees AS t2 ON CONCAT(t2.series_id, t2.year_, t2.period_) = CONCAT(t1.series_id, t1.year_, t1.period_)
    GROUP BY 
        t1.year_, 
        t1.period_, 
        t2.year_, 
        t2.period_
    ORDER BY 
        t1.year_, 
        t1.period_;
END; $function$
;
   
-- THE FOLLOWING IS COMMENTED OUT BECAUSE IT PERFORMS THE SAME SELECTION AND GIVES THE SAME RESULTS AS THE PREVIOUS FUNCTION.
/*
select t1.year_, t1.period_, sum(t1.value) as production_employees, sum(t2.value) as supervisory_employees, sum(t1.value)/ sum(t2.value) as employees_ratio
from api.ce_data_06_production_and_nonsupervisory_employees as t1
join api.ce_data_06_supervisory_employees as t2 on concat(t2.series_id, t2.year_, t2.period_) = concat(t1.series_id, t1.year_, t1.period_)
group by t1.year_, t1.period_, t2.year_, t2.period_
order by t1.year_, t1.period_;
*/

-- Granting execute permissions on the 'api.get_employee_ratio' function to the 'web_anon' user.
GRANT EXECUTE ON FUNCTION api.get_employee_ratio() TO web_anon;

-- Selecting all data from the 'api.get_employee_ratio' function.
SELECT * FROM api.get_employee_ratio();

-- Granting select permissions on the 'api.ce_data_06_supervisory_employees' table to the 'web_anon' user.
GRANT SELECT ON api.ce_data_06_supervisory_employees TO web_anon;

-- Calling the function get_employee_ratio() and obtaining the second objective of the Data Analyst Challenge 2022
-- How was the evolution of the ratio "production employees / supervisory employees" during time? 
SELECT * FROM api.get_employee_ratio();

--API DIRECCIONS
http://localhost:3000/rpc/get_employee_ratio
http://localhost:3000/women_in_government