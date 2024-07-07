-- String Functions
-- Built-in functions that will help us use strings and work with strings differently

-- LENGTH
SELECT length('skyfall');

SELECT * 
FROM employee_demographics;

SELECT first_name, length(first_name) AS 'Name_Length'
FROM employee_demographics
ORDER BY 'Name_Length';


-- UPPER & LOWER
SELECT upper('sky');
SELECT lower('SKYfaLL');
SELECT first_name, upper(last_name) AS last_name
FROM employee_demographics;
-- Upper or Lower can be used for standardization. Helpful when multiple cases in string.


-- TRIM
-- Trim, left trim and right trim
-- Trim can take the whitespace in the front or the end and remove it.
SELECT trim('     sky  '); -- trim gets rid of leading & trailing whitespaces
SELECT ltrim('     sky  '); -- ltrim gets rid of leading whitespaces
SELECT rtrim('     sky  '); -- rtrim gets rid of trailing whitespaces


-- SUBSTRING
-- Left: Number characters to be selected from left hand side
SELECT first_name, left(first_name, 3)
FROM employee_demographics;

-- Right: Number characters to be selected from right hand side
SELECT first_name, right(first_name, 3)
FROM employee_demographics;

-- Substring
SELECT first_name, substring(first_name, 3, 2)   -- substring(column, start_position, number_of_characters)
FROM employee_demographics;

SELECT first_name, substring(first_name, 3, 2),
birth_date, substring(birth_date, 6, 2) AS birth_month
FROM employee_demographics;


-- REPLACE
-- will replace specific characters with the characters you want
SELECT first_name, replace(first_name, 'a', 'z')
FROM employee_demographics;


-- LOCATE
SELECT locate('b','Abhi');
SELECT first_name, locate('An', first_name)
FROM employee_demographics;

-- CONCAT
SELECT first_name, last_name,
concat(first_name, ' ', last_name) AS full_name
FROM employee_demographics;