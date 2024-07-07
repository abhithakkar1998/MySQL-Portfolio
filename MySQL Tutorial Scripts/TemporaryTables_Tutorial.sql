-- Temporary Tables
-- Only visible to sessions they are created in
-- Generally used to store intermediate results for complex queries like CTE
-- Also for manipulating data before inserting it into a permanent table

CREATE TEMPORARY TABLE temp_table
(
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    fav_movie VARCHAR(100)

);

INSERT INTO temp_table
VALUES('Alex','Freberg','Lord of the Rings');

SELECT *
FROM temp_table
;

-- -- --

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM salary_over_50k;
FROM salary_over_50k;