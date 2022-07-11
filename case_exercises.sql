/* 1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' 
that is a 1 if the employee is still with the company and 0 if not. */

select 
emp_no, dept_no, from_date as start_date, to_date as end_date,
CASE to_date 
	when '9999-01-01' then 1
    else 0
    end as is_current_employee
from dept_emp;

/* 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' 
that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. */
select
first_name, 
last_name, 
substr(last_name, 1, 1) as first_letter_of_last_name,
CASE
	WHEN substr(last_name, 1,1) <= 'H' THEN 'A-H'
	WHEN substr(last_name, 1,1) <= 'Q' THEN 'I-Q'
	WHEN substr(last_name, 1,1) <= 'Z' THEN 'R-Z'
	END AS alpha_group
		FROM employees;
        
/* 