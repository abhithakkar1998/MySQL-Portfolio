-- Subqueries
-- A query within another query

use parks_and_recreation;

-- Subquery in where statement
SELECT *
FROM employee_demographics
WHERE employee_id IN (
	SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1
)
;

-- Subquery in select statement
SELECT first_name, salary, (
	SELECT avg(salary)
    FROM employee_salary
    ) AS avg_salary
FROM employee_salary
;

-- Subquery in from statement
SELECT gender, avg(age), max(age), count(age)
FROM employee_demographics
GROUP BY gender
;

SELECT *
FROM (
		SELECT gender, avg(age), max(age), min(age), count(age)
		FROM employee_demographics
		GROUP BY gender
	) AS aggr_table
;

SELECT gender, avg(`max(age)`)
FROM (
		SELECT gender, avg(age), max(age), min(age), count(age)
		FROM employee_demographics
		GROUP BY gender
	) AS aggr_table
GROUP BY gender
;

-- rename some columns
SELECT gender, avg(avg_age), avg(max_age), avg(min_age), avg(count_age)
FROM (
		SELECT gender, 
        avg(age) as avg_age,
        max(age) as max_age,
        min(age) as min_age,
        count(age) as count_age
		FROM employee_demographics
		GROUP BY gender
	) AS aggr_table
GROUP BY gender
;