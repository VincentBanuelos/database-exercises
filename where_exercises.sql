-- 1. Create a file named where_exercises.sql. Make sure to use the employees database.
USE employees;
 
 /* 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
 Enter a comment with the number of records returned. (A. Number of records returned is 709) */
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

/* 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2,  but use OR instead of IN.  Enter a comment with the number of records returned.  
Does it match number of rows from Q2?  (A. It does return the same number of records as Q2,because it is still asking for all of the names indivdiually) */
SELECT * FROM employees
WHERE first_name = 'Irena' 
OR  first_name = 'Vidya' 
OR first_name = 'Maya';

/* 4. Find all current or previous employees with first names  'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
Enter a comment with the number of records returned. (Number of records returned is 441) */
SELECT * FROM employees
WHERE gender = 'M'
AND (
first_name = 'Irena' 
OR  first_name = 'Vidya' 
OR first_name = 'Maya'
);

/* 5. Find all current or previous employees whose last name starts with 'E'. 
Enter a comment with the number of employees whose last name starts with E. 
(A. 7330) */
SELECT * FROM employees
WHERE last_name LIKE 'E%';

/* 6. Find all current or previous employees whose last name starts or ends with 'E'. 
Enter a comment with the number of employees whose last name starts or ends with E. (A. 30723 employees have names what start or end with E)*/
SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

/* (6. Continued) How many employees have a last name that ends with E, but does not start with E? (A. 23393 employees have names that end with 'E' but do not start with 'E' */
SELECT * FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';


/* 7. Find all current or previous employees whose last name starts and ends with 'E'. 
Enter a comment with the number of employees whose last name starts and ends with E. (A. 899 employees have names then start and end with E) */
SELECT * FROM employees
WHERE last_name LIKE 'E%E';
/* (7. Continued) How many employees' last names end with E, regardless of whether they start with E? (A. 24292 employees have names that end with E 
regardless of what letter they start with.) */
SELECT * FROM employees
WHERE last_name LIKE '%E';

/* 8. Find all current or previous employees hired in the 90s. 
Enter a comment with the number of employees returned. (A. 135214 employees were hired in the 90's)*/
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';

/* 9. Find all current or previous employees born on Christmas. 
Enter a comment with the number of employees returned.(A. 842) */
SELECT * FROM employees
WHERE birth_date LIKE '%-12-25%';

/* 10. Find all current or previous employees hired in the 90s and born on Christmas. 
Enter a comment with the number of employees returned. (A. 362) */
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31'
AND birth_date LIKE '%-12-25%';

/* 11. Find all current or previous employees with a 'q' in their last name. 
Enter a comment with the number of records returned. (A. 1873 employees contain a q in their last name) */
SELECT * FROM employees
WHERE last_name LIKE '%q%';

/* 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. 
How many employees are found? (A. 547) */
SELECT * FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';