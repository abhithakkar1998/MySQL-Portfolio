-- Case statements
-- Allows to add logic in select statements similar to if and else statements in programming

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Middle Aged'
    WHEN age >= 50 THEN 'Old'
END AS Age_Bracket
FROM employee_demographics;

-- Pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM employee_salary;

-- Using case with join and order by for better understanding
SELECT sal.first_name, sal.last_name, dept.department_name, sal.salary,
CASE
	WHEN sal.salary < 50000 THEN sal.salary + (sal.salary * 0.05)
    WHEN sal.salary > 50000 THEN sal.salary + (sal.salary * 0.07)
END AS new_salary,
CASE
	WHEN dept.department_name = 'Finance' THEN salary * 0.10
END AS bonus
FROM employee_salary AS sal
INNER JOIN parks_departments AS dept
		ON sal.dept_id = dept.department_id
ORDER BY new_salary DESC, bonus DESC
;