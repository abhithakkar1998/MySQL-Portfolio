-- WHERE CLAUSE

SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_salary
WHERE salary <= 50000;

SELECT *
FROM employee_salary
WHERE salary <> 55000; -- <> means not equal to

SELECT *
FROM employee_demographics
WHERE gender != 'Female' -- != also means not equal to
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- ADD OR NOT -- Logical Operators
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender != 'Male'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND NOT gender = 'Male'
;

SELECT *
FROM employee_demographics
WHERE (first_name = 'April' AND age = 29) OR age > 45
;

-- LIKE Statement
-- % means anything
-- _ means specific value 
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%an%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%_r_'
;