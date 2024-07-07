-- Limit & Aliasing
-- Limit -> Specifies how many tables we need in output

SELECT *
FROM employee_demographics
LIMIT 3
;

-- Limit can be combined with order by
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

-- Limit X ,Y  start at position X and select Y next rows
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1
;

-- Aliasing -> Just a way to change the name of the columns. Used primararily in joins
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;