-- DROP FUNCTION api.get_employee_ratio();

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