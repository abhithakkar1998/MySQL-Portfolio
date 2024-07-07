-- CTEs (Common table expression)
-- Define a subquery block that you can reference to a main query

WITH CTE_Example AS
(
	SELECT gender, AVG(salary) as avg_sal, MAX(salary) as max_sal, MIN(salary) as min_sal, COUNT(salary) as count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
	GROUP BY gender
)
SELECT *
FROM CTE_Example
;


WITH CTE_Example AS
(
	SELECT gender, AVG(salary) as avg_sal, MAX(salary) as max_sal, MIN(salary) as min_sal, COUNT(salary) as count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
	GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;

-- Multiple CTEs example
WITH CTE_Example AS
(
	SELECT employee_id, gender, birth_date
    FROM employee_demographics
    WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
	SELECT employee_id, salary
    FROM employee_salary
    WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;


-- Adding alias in CTE definition
WITH CTE_Example (Gender, AVG_sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(
	SELECT gender, AVG(salary) as avg_sal, MAX(salary) as max_sal, MIN(salary) as min_sal, COUNT(salary) as count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
	GROUP BY gender
)
SELECT *
FROM CTE_Example
;
