-- GROUP BY Clause
SELECT *
FROM employee_demographics
;

SELECT gender
FROM employee_demographics
GROUP BY gender
;

-- Below query will give error as  ther is no aggregator function used
SELECT first_name
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT *
FROM employee_salary
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age), SUM(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY Clause
SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_demographics
ORDER BY first_name -- By Default is is ASC (ascending order)
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;

-- you can use column position insead of name. can be used sometimes. not the best practice
SELECT *
FROM employee_demographics
ORDER BY 5, -- gender at 5  
4 DESC -- age at 4
;
-- This will cause problems when you delete any column and the the numbers of the column change. Your entire functionality of query will change.