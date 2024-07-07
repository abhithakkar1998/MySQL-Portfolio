-- STORED PROCEDURES
-- Way to save sql code to reuse it
-- Once you save it, its gonna execute all the code written in stored procedures
-- really helpful in storing complex queries, simplifying repetitve code

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

-- A super simple stored procedure

USE parks_and_recreation;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

CALL large_salaries();

-- A lot of things to take into account for stored procedures
-- Multiple queries

DELIMITER $$
CREATE PROCEDURE large_salaries_2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries_2();


-- Parameters
-- Variables passed as inputs to stored procedures

DELIMITER $$
CREATE PROCEDURE large_salaries_3(emp_id INT)
BEGIN
	SELECT *
	FROM employee_salary
    WHERE employee_id = emp_id;
END $$
DELIMITER ;

CALL large_salaries_3(4);
