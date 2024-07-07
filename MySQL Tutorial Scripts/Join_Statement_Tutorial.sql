-- JOINS
-- Allow you to combine tables based on common column.
-- Not necessary that column names should be same, but the data contained in them should be same. 
USE parks_and_recreation;

SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_salary
;

-- JOIN -> By default represents INNER JOIN
-- Here we are not pulling in all the rows. It will only pull the rows which have the same values in thwe tying columns
-- in this case employee_id
SELECT * 
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

-- Use aliasing to shorten
SELECT * 
FROM employee_demographics AS dm
INNER JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

-- selecting columns. common column needs to mentioned explicitly
SELECT dm.employee_id, age, salary
FROM employee_demographics AS dm
INNER JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

-- OUTER JOIN
-- Types: LEFT OUTER JOIN (or LEFT JOIN) and RIGHT OUTER JOIN (or IGHT JOIN)
-- Left join: Take everything from left table and only take matches from right table.
-- Right join: Take everything from right table and only take matches from left table.
-- FROM statement has the left table; JOIN statement has the right table
-- null values filled for  values that dont match

SELECT *
FROM employee_demographics AS dm
LEFT JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dm
RIGHT JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

-- SELF JOIN
-- It is join where you tie a table to itself.

SELECT * 
FROM employee_salary
;

SELECT * 
FROM employee_salary AS sal1
JOIN employee_salary AS sal2
	ON sal1.employee_id = sal2.employee_id
;

SELECT sal1.employee_id AS emp_secret_santa,
sal1.first_name AS first_name_secret_santa,
sal1.last_name AS last_name_secret_santa,
sal2.first_name AS first_name_emp,
sal2.last_name AS last_name_emp
FROM employee_salary AS sal1
JOIN employee_salary AS sal2
	ON sal1.employee_id + 1= sal2.employee_id
;

-- Joining multiple tables together
SELECT *
FROM employee_demographics AS dm
INNER JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;