-- Window Functions
-- Work like group by but dont roll up everything into one row when grouping.
-- Each keep unique row in the output.

SELECT *
FROM employee_demographics;

SELECT gender, AVG(salary) as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- Window Function
SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Partition by will seperate data based on the groups
SELECT dem.first_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.first_name, gender, SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_number_partition, -- row number won't have duplicate numbers
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_number_partition, 
-- rank is similar to row num but based on order by column it will give duplicate number if value is same
-- It will give the numbers positionally
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_number_partition
-- Similar to rank but will give the value numerically in sequence with duplicates
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;