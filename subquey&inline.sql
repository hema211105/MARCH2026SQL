-- select emp_name,salary
-- from EMPLOYEES
-- where salary > (select avg(salary) from employees);

-- select max(salary)
-- from employees 
-- where salary < (select max(salary) from employees);

-- select emp_name
-- from EMPLOYEES
-- where salary <(select max(salary) from employees)

-- select emp_name
-- from EMPLOYEES
-- where dept_id = (select dept_id from departments where dept_name = 'IT')

-- select emp_name
-- from employees
-- where salary > all(select salary from employees where dept_id = 10)

-- SELECT emp_name
-- FROM Employees
-- WHERE emp_id IN (SELECT manager_id FROM Employees);

-- select dept_id
-- from EMPLOYEES
-- group by dept_id
-- having count(*) > 2

-- select emp_name from employees where dept_id not in (select dept_id from departments)

-- select * from employees

-- select dept_id
-- from EMPLOYEES
-- group by dept_id 
-- having avg(salary) > (select avg(salary) from employees);

-- select dept_id, avg_sal
-- from (
--     select dept_id, avg(salary) avg_sal
--     from EMPLOYEES
--     group by dept_id
-- )t;

-- SELECT e.emp_name
-- FROM Employees e
-- JOIN (
--     SELECT dept_id, AVG(salary) avg_sal
--     FROM Employees GROUP BY dept_id
-- ) d
-- ON e.dept_id = d.dept_id
-- WHERE e.salary > d.avg_sal;

-- SELECT *
-- FROM (
--     SELECT emp_name, salary
--     FROM Employees
--     ORDER BY salary DESC
-- ) t
-- FETCH FIRST 5 ROWS ONLY;

-- SELECT *
-- FROM (
--     SELECT emp_name, salary
--     FROM Employees
--     ORDER BY salary DESC nulls last
-- ) t
-- FETCH FIRST 5 ROWS ONLY;

-- select emp_name
-- from employees e1
-- where salary >(
--     select avg(salary)
--     from employees e2
--     where e2.dept_id = e1.DEPT_ID
-- );

-- SELECT emp_name, dept_id
-- FROM Employees e1
-- WHERE salary = (
--     SELECT MAX(salary)
--     FROM Employees e2
--     WHERE e2.dept_id = e1.dept_id
-- );

-- Employees without subordinates
-- SELECT emp_name
-- FROM Employees e1
-- WHERE NOT EXISTS (
--     SELECT 1 FROM Employees e2
--     WHERE e2.manager_id = e1.emp_id
-- );

--Salary = dept minimum
-- SELECT emp_name
-- FROM Employees e1
-- WHERE salary = (
--     SELECT MIN(salary)
--     FROM Employees e2
--     WHERE e2.dept_id = e1.dept_id
-- );

-- WITH dept_total AS (
--     SELECT dept_id, SUM(salary) total
--     FROM Employees GROUP BY dept_id
-- )
-- SELECT * FROM dept_total;

-- WITH cte AS (
--     SELECT emp_name, salary,
--            RANK() OVER (ORDER BY salary DESC) rnk
--     FROM Employees
-- )
-- SELECT * FROM cte;

-- WITH cte AS (
--     SELECT emp_name, dept_id,
--            DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) rnk
--     FROM Employees
-- )
-- SELECT * FROM cte WHERE rnk <= 3;

---- WITH cte AS (
--     SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY emp_id) rn
--     FROM Employees
-- )
-- DELETE FROM cte WHERE rn > 1;

-- WITH cte AS (
--     SELECT emp_name, salary,
--            SUM(salary) OVER (ORDER BY emp_id) running_total
--     FROM Employees
-- )
-- SELECT * FROM cte;

-- WITH dept_avg AS (
--     SELECT dept_id, AVG(salary) avg_sal
--     FROM Employees GROUP BY dept_id
-- ),
-- filtered AS (
--     SELECT e.emp_name, e.salary
--     FROM Employees e
--     JOIN dept_avg d ON e.dept_id = d.dept_id
--     WHERE e.salary > d.avg_sal
-- )
-- SELECT * FROM filtered;

-- WITH ranked AS (
--     SELECT emp_name, salary,
--            DENSE_RANK() OVER (ORDER BY salary DESC) rnk
--     FROM Employees
-- ),
-- top3 AS (
--     SELECT * FROM ranked WHERE rnk <= 3
-- )
-- SELECT * FROM top3;

----WITH sales_cte AS (
--     SELECT region, SUM(amount) total
--     FROM Sales GROUP BY region
-- ),
-- ranked AS (
--     SELECT region, total,
--            RANK() OVER (ORDER BY total DESC) rnk
--     FROM sales_cte
-- )
-- SELECT * FROM ranked;

-- SELECT e1.emp_name
-- FROM Employees e1
-- JOIN Employees e2
-- ON e1.manager_id = e2.emp_id
-- WHERE e1.salary > e2.salary;

----SELECT product_name
-- FROM Products p
-- WHERE NOT EXISTS (
--     SELECT 1 FROM Orders o WHERE o.product_id = p.product_id
-- );

-- SELECT e.emp_name
-- FROM Employees e
-- JOIN (
--     SELECT dept_id, AVG(salary) avg_sal
--     FROM Employees GROUP BY dept_id
-- ) d
-- ON e.dept_id = d.dept_id
-- WHERE e.salary > d.avg_sal;

-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM hr.employees
-- ),
-- dept_avg AS (
--     SELECT department_id, AVG(salary) AS avg_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- high_earners AS (
--     SELECT e.employee_id, e.first_name, e.salary, e.department_id
--     FROM hr.employees e
--     JOIN dept_avg d
--       ON e.department_id = d.department_id
--     WHERE e.salary > d.avg_salary
--       AND d.avg_salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT * FROM high_earners;

-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM employees
-- ),
-- dept_avg AS (
--     SELECT dept_id, AVG(salary) AS avg_salary
--     FROM employees
--     GROUP BY dept_id
-- ),
-- high_earners AS (
--     SELECT e.emp_id, e.emp_name, e.salary, e.dept_id
--     FROM employees e
--     JOIN dept_avg d
--       ON e.dept_id = d.dept_id
--     WHERE e.salary > d.avg_salary
--       AND d.avg_salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT * FROM high_earners;

-- WITH dept_avg AS (
--     SELECT dept_id, AVG(salary) AS avg_salary
--     FROM employees
--     GROUP BY dept_id
-- ),
-- ranked_depts AS (
--     SELECT dept_id,
--            avg_salary,
--            DENSE_RANK() OVER (ORDER BY avg_salary DESC) AS rnk
--     FROM dept_avg
-- ),
-- top_depts AS (
--     SELECT dept_id
--     FROM ranked_depts
--     WHERE rnk <= 3
-- )
-- SELECT e.emp_id, e.emp_name, e.salary, e.dept_id
-- FROM employees e
-- JOIN top_depts t
--   ON e.dept_id = t.dept_id;

-- WITH dept_stats AS (
--     SELECT dept_id,
--            COUNT(*) AS emp_count,
--            AVG(salary) AS avg_salary
--     FROM employees
--     GROUP BY dept_id
-- ),
-- strong_depts AS (
--     SELECT dept_id
--     FROM dept_stats
--     WHERE emp_count >= 3
--       AND avg_salary > 8000
-- ),
-- dept_max AS (
--     SELECT dept_id, MAX(salary) AS max_salary
--     FROM employees
--     GROUP BY dept_id
-- )
-- SELECT e.emp_id, e.emp_name, e.salary, e.dept_id
-- FROM employees e
-- JOIN strong_depts s
--   ON e.dept_id = s.dept_id
-- JOIN dept_max m
--   ON e.dept_id = m.dept_id
-- WHERE e.salary = m.max_salary;

-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM employees
-- ),
-- dept_performance AS (
--     SELECT dept_id,
--            AVG(salary) AS avg_salary,
--            COUNT(*) AS emp_count
--     FROM employees
--     GROUP BY dept_id
-- ),
-- high_perf_depts AS (
--     SELECT dept_id
--     FROM dept_performance
--     WHERE avg_salary > (SELECT avg_salary FROM company_avg)
--       AND emp_count >= 3
-- )
-- SELECT e.emp_id,
--        e.emp_name,
--        e.salary,
--        e.dept_id
-- FROM employees e
-- JOIN high_perf_depts h
--   ON e.dept_id = h.dept_id
-- WHERE e.salary > (
--     SELECT AVG(salary)
--     FROM employees e2
--     WHERE e2.dept_id = e.dept_id
-- );

-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM employees
-- ),
-- dept_avg AS (
--     SELECT dept_id,
--            AVG(salary) AS avg_salary
--     FROM employees
--     GROUP BY dept_id
-- ),
-- strong_depts AS (
--     SELECT dept_id
--     FROM dept_avg
--     WHERE avg_salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT emp_id,
--        emp_name,
--        salary,
--        dept_id,
--        RANK() OVER (
--            PARTITION BY dept_id
--            ORDER BY salary DESC
--        ) AS dept_rank
-- FROM employees
-- WHERE dept_id IN (SELECT dept_id FROM strong_depts);

-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM employees
-- ),
-- dept_avg AS (
--     SELECT dept_id,
--            AVG(salary) AS avg_salary
--     FROM employees
--     GROUP BY dept_id
-- ),
-- qualified_emps AS (
--     SELECT e.emp_id,
--            e.emp_name,
--            e.salary,
--            e.dept_id
--     FROM employees e
--     JOIN dept_avg d
--       ON e.dept_id = d.dept_id
--     WHERE e.salary > d.avg_salary
--       AND e.salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT * FROM qualified_emps;

WITH dept_stats AS (
    SELECT dept_id,
           COUNT(*) AS emp_count,
           AVG(salary) AS avg_salary,
           MAX(salary) AS max_salary
    FROM employees
    GROUP BY dept_id
),
valid_depts AS (
    SELECT dept_id
    FROM dept_stats
    WHERE emp_count >= 3
      AND avg_salary > 7000
),
top_earners AS (
    SELECT e.emp_id,
           e.emp_name,
           e.salary,
           e.dept_id
    FROM employees e
    JOIN valid_depts v
      ON e.dept_id = v.dept_id
    WHERE e.salary = (
        SELECT MAX(salary)
        FROM employees e2
        WHERE e2.dept_id = e.dept_id
    )
)
SELECT * FROM top_earners;