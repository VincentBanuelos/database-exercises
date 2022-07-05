-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
USE employees;
 
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');


SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
OR  first_name = 'Vidya' 
OR first_name = 'Maya';

SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE gender = 'M'
AND (
first_name = 'Irena' 
OR  first_name = 'Vidya' 
OR first_name = 'Maya'
);

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%';

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%E';

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';

SELECT * FROM employees
WHERE birth_date LIKE '%-12-25%';

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31'
AND birth_date LIKE '%-12-25%';

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%';

SELECT  DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

/* 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the results? (A. Irena Reutenauer)
What was the first and last name of the last person in the table? (A. Vidya Simmen) */
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

/* 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
In your comments, answer: What was the first and last name in the first row of the results? (A. Irena Acton)
What was the first and last name of the last person in the table? (A. Vidya Zwezig) */
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

/* 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
In your comments, answer: What was the first and last name in the first row of the results? (A. Irena Acton) 
What was the first and last name of the last person in the table? (A. Maya Zyda) */
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

/* 5. Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name. 
(A. Number of employees returned was 899, First employee was Ramzi Erde, Last Employee was Tadahiro Erde) */
SELECT * FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;

/* 6. Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee. 
(A. Number of employees returned is 899, the newest employee is Teji, Eldridge, the oldest employee is Sergi Erde) */
SELECT * FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date DESC;

/* 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. 
Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
(A. Oldest employee who was hired last was Khun Berini, youngest employee who was hired first Douadi Pettis) */
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31'
AND birth_date LIKE '%-12-25%'
ORDER BY birth_date ASC, hire_date DESC;