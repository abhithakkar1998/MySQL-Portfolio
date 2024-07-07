-- Triggers and Events
-- Trigger is block of code wwhen an event takes place in specific table.

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

-- Example
DELIMITER $$
CREATE TRIGGER trig_employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW -- Triggers every time a row is inserted
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ; 

INSERT INTO employee_salary VALUES(13, 'John', 'Sapier', 'Entertainment 720 CEO', 1000000, NULL);
SELECT *
FROM employee_salary
;
SELECT *
FROM employee_demographics
;


-- EVENTS (scheduled to happen)
SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT ev_delete_retires
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SELECT *
FROM employee_demographics
;

SHOW VARIABLES LIKE 'event%';