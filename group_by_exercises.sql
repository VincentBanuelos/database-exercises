-- 1. Create a new file named group_by_exercises.sql
USE employees;
SHOW TABLES;

/* 2.In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? Answer that in a comment in your SQL file.
(A. There are 7 Distinct Titles) */
SELECT DISTINCT title
FROM titles;

/* 3. Write a query to find a list of all unique last names of all employees 
that start and end with 'E' using GROUP BY. */
SELECT last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

/* 4. Write a query to to find all unique combinations of first and last names 
of all employees whose last names start and end with 'E'. */
SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;

/* 5. Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. (A. 3 unique names were found) */
SELECT last_name FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

/* 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.*/
SELECT last_name, COUNT(*) AS counts_of_unique_last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

/* 7. Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. */
SELECT first_name, gender, COUNT(*) AS counts_of_unique_first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

/* 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
Are there any duplicate usernames? (A. There are duplicates) */
 SELECT CONCAT(
 SUBSTR(first_name, 1, 1),
 (SUBSTRING(last_name, 1, 4))
 ,'_',
 (SUBSTRING(birth_date,6, 2)),
 SUBSTRING(birth_date,3, 2))
 AS username,
 COUNT(*) AS number_of_usernames
 FROM employees
 GROUP BY username
 ORDER BY number_of_usernames DESC;
 
 /* 8. BONUS: How many duplicate usernames are there? 
 (A. There are 13251 duplicates.)*/
 SELECT CONCAT(
 SUBSTR(first_name, 1, 1),
 (SUBSTRING(last_name, 1, 4))
 ,'_',
 (SUBSTRING(birth_date,6, 2)),
 SUBSTRING(birth_date,3, 2))
 AS username,
 COUNT(*) AS number_of_usernames
 FROM employees
 GROUP BY username
 HAVING number_of_usernames > 1;
 
 /* 9. Bonus: More practice with aggregate functions:
Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, 
you'll probably be grouping by that exact column. */
SHOW TABLES;
SELECT * FROM dept_emp;

/* Using the dept_emp table, count how many current employees work in each department. 
The query result should show 9 rows, one for each department and the employee count. */
SELECT dept_no, COUNT('dept_no') 
FROM dept_emp
WHERE to_date >= NOW()
GROUP BY dept_no
Limit 9;

-- Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, COUNT(*) AS number_of_employee_salaries
FROM salaries
GROUP BY emp_no;

-- Find the maximum salary for each employee.

-- Find the minimum salary for each employee.

-- Find the standard deviation of salaries for each employee.

-- Now find the max salary for each employee where that max salary is greater than $150,000.

-- Find the average salary for each employee where that average salary is between $80k and $90k. */

