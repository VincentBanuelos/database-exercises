-- 1. Create a new SQL script named limit_exercises.sql.

/* 2. List the first 10 distinct last name sorted in descending order.
(A. ZYKH, ZYDA,ZWICKER, ZWEZIG, ZUMAQUE, ZULTNER, ZUCKER, ZUBEREK, ZSCHOCHE, ZONGER) */
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
Limit 10;

/* 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting 
by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
(A. ALSELM CAPPELLO, UTZ MANDELL, BOUCHUNG SCHREITER, BAOCAI KUSHNER, PETTER STROUSTRUP) */
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31'
AND birth_date LIKE '%-12-25%'
ORDER BY hire_date
LIMIT 5;

/* 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. 
Update the query to find the tenth page of results. LIMIT and OFFSET can be used to create multiple pages of data. 
What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number? */
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31'
AND birth_date LIKE '%-12-25%'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
