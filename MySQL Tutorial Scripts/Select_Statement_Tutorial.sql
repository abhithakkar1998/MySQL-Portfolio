SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics;

SELECT concat(first_name, " ", last_name) AS "full_name"
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;