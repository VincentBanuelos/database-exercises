USE employees;
-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees as e
JOIN dept_emp as de
USING(emp_no)
WHERE e.hire_date IN 
	(
	SELECT hire_date 
	FROM employees as e
	WHERE e.emp_no = 101010 and de.to_date > CURDATE()
	);



-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT title, count(*)
FROM titles
where emp_no in
(
select emp_no
from employees
join dept_emp
using (emp_no)
where first_name = 'Aamod' and to_date > curdate()
)
group by title;

/* 3. How many people in the employees table are no longer working for the company? 
(A.59900)*/
SELECT count(*)
FROM employees
WHERE emp_no not in
(
SELECT emp_no
FROM dept_emp
WHERE to_date  > CURDATE()
);




-- 4. Find all the current department managers that are female. List their names in a comment in your code.
select * from employees
where emp_no in 
(
SELECT emp_no 
from dept_manager
where to_date  > curdate() and gender = 'f'
);

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select * 
from employees
	join salaries
    using(emp_no)
    where to_date > curdate()
    and salary >
( 
select avg(salary)
from salaries
);


/* 6. How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this? */
select count(*)
from salaries
where salary > 
(
select max(salary)
from salaries
where to_date > curdate()
)
-
(
select stddev(salary)
from salaries
where to_date > curdate()
)
and 
to_date > curdate();

select max(salary)
 from salaries
 where to_date > now()
 ;

 select stddev(salary)
 from salaries
 where to_date > now()
 ;
 
 -- What percentage of all salaries is this?

 select 
 (
select count(*)
from salaries
where salary > 
(
(select max(salary)
from salaries
where to_date > now()
)
- 
(select stddev(salary)
from salaries
where to_date > now()
)
)
and to_date >now()
 )
 / 
 (
select count(*) 
from salaries
where to_date > now()
 ) 
 * 100;