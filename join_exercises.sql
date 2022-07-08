-- Join Example Database
-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

/* 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
Before you run each query, guess the expected number of results */

-- This below will bring in the column 'name' from from both tables and name them as 'name' and 'Role'
-- As well as role_id and join the table 'role' onto the column role_id from users
-- In simple terms, this brings togther the data that we have chosen that will produce the same results,
-- I.E. how id from role and role_id from users are essentially the same thing, with users pulling the id clumn values from the role table and assinging that onto the users table as role_id.
SELECT users.name AS name, roles.name AS Role, role_id
FROM users
JOIN roles ON users.role_id = roles.id;


SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

/* 3. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
Hint: You will also need to use group by in the query. */
SELECT roles.name AS Role, COUNT(*) AS number_of_users_per_role
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY role;

-- Employees Database

-- 1. Use the employees database.
USE employees;
SHOW TABLES;


-- 2. Write a query that shows each department along with the name of the current manager for that department.
SELECT  d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dm
  USING(emp_no)
JOIN departments AS d
  USING(dept_no)
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;


-- 3. Find the name of all departments currently managed by women.
SELECT  d.dept_name AS 'Department Manager', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dm
  using(emp_no)
JOIN departments AS d
  USING(dept_no)
WHERE dm.to_date = '9999-01-01' AND gender = 'F'
ORDER BY d.dept_name;


-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS Title, COUNT(t.emp_no) AS Count
FROM employees AS e
JOIN dept_emp AS de
  USING(emp_no)
JOIN departments AS d
  USING(dept_no)
JOIN titles AS t
  USING(emp_no)
WHERE t.to_date = '9999-01-01' and d.dept_name = 'Customer Service'
GROUP BY t.title
ORDER BY t.title;


-- 5. Find the current salary of all current managers.
SELECT  dm.emp_no, d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name', s.salary AS Salary
FROM employees AS e
JOIN dept_manager AS dm
  USING(emp_no)
JOIN departments AS d
  USING(dept_no)
JOIN salaries AS s
  USING(emp_no)
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;


-- 6. Find the number of current employees in each department.
SELECT d.dept_no, d.dept_name, COUNT(de.emp_no) AS num_employees
FROM employees AS e
JOIN dept_emp AS de
  USING(emp_no)
JOIN departments AS d
  USING(dept_no)
WHERE de.to_date = '9999-01-01' AND d.dept_no = de.dept_no
GROUP BY d.dept_no
ORDER BY d.dept_no;


-- 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT  d.dept_name AS 'Department Name', AVG(s.salary) AS average_salary
FROM employees AS e
JOIN dept_emp AS de
  USING(emp_no)
JOIN departments AS d
  USING(dept_no)
JOIN salaries AS s
  USING(emp_no)
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing department?
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name', MAX(s.salary) AS MAX_SALARY
FROM employees AS e
JOIN dept_emp AS de
  USING(emp_no)
JOIN departments AS d
  USING(dept_no)
JOIN salaries AS s
  USING(emp_no)
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01' AND d.dept_name = 'Marketing'
GROUP BY CONCAT(e.first_name, ' ', e.last_name)
ORDER BY MAX_SALARY DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?
SELECT  d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name', s.salary AS Salary
FROM employees AS e
JOIN dept_manager AS dm
  USING (emp_no)
JOIN departments AS d
  USING(dept_no)
JOIN salaries AS s
  USING(emp_no)
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
Limit 1;

-- 10. Determine the average salary for each department. Use all salary information and round your results.
SELECT  d.dept_name AS 'Department Name', ROUND(AVG(s.salary)) AS average_salary
FROM employees AS e
	JOIN dept_emp AS de
		USING(emp_no)
	JOIN departments AS d
		USING(dept_no)
	JOIN salaries AS s
		USING(emp_no)
GROUP BY d.dept_name
ORDER BY average_salary DESC;