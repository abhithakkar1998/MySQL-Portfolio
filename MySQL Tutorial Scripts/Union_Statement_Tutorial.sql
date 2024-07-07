-- Unions
-- Allows you to combine rows together. Allows to combine rows from same or seperate table.

use parks_and_recreation;

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;
-- For above query we are combining random data together. That is not a good practice. We need to keep the data same.

SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;
-- By Default it is UNION DISTINCT. By default it will combine all duplicates from different tables.ALTER

SELECT first_name, last_name
FROM employee_demographics
UNION ALL -- Here we'll have all the results from all the tables. No duplicates removal
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 and gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Woman' AS Label
FROM employee_demographics
WHERE age > 40 and gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;