-- WHERE vs HAVING
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
; -- This query will give an error. This is because the "AVG(age)" with the SELECT clause is executed only after the grouping 
-- is done based on the gender. When we try to filter it hasn't been created yet since the group by would not have happened.

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT *
FROM employee_salary
;

SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary) > 60000
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE "%manager%" -- Row level filtering
GROUP BY occupation
HAVING AVG(salary) >= 75000 -- Aggr. func level filtering
;