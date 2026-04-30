-- select sysdate from dual
-- select current_date from dual
-- select sysdate,add_months(sysdate,-5) from dual
-- select months_between(sysdate,hire_date)/12 from hr.employees
-- select floor((sysdate-hire_date)/365) experience from hr.employees
-- select next_day(sysdate,'wednesday') from dual
-- select hire_date,last_day(hire_date) from hr.employees
-- select sysdate,extract(year from sysdate) from dual
-- select sysdate,extract(month from sysdate) from dual
-- select sysdate,extract(day from sysdate) from dual
-- select sysdate,extract(day from hire_date) from hr.employees
-- SELECT EXTRACT(HOUR FROM CAST(SYSDATE AS TIMESTAMP)) AS hour_value FROM dual;
-- SELECT SYSDATE,SYSDATE+NUMTODSINTERVAL(2,'DAY') FROM DUAL
-- SELECT SESSIONTIMEZONE FROM dual;
-- SELECT DBTIMEZONE FROM dual;
-- SELECT 
--     CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) AS UTC_DATE
-- FROM dual;
-- SELECT 
--     FROM_TZ(TIMESTAMP '2026-04-24 10:00:00','UTC') AS UTC_TIMESTAMP
-- FROM dual;
SELECT 
    FROM_TZ(TIMESTAMP '2026-04-24 10:00:00','Asia/Kolkata') AS IST
FROM dual;