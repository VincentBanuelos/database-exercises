-- This tells moves me into the employees schema (file)
USE employees;

-- This will show me what tables are in the employees schema
SHOW TABLES;

-- Explore the employees table. What different data types are present in the table? 
-- This will show me what data types are in employees table.
SHOW CREATE TABLE employees;
-- A: Data Types: int, date, varchar, enum

USE employees;

SHOW TABLES;

-- Which table(s) do you think contain a numeric type column?
-- A: I think that, dept_emp, dept_manager, employees, and salaries have numeric type columns

-- Which table(s) do you think contain a string type column? 
-- A: i think departments, dept_emp, dept_manager, employees, and titles have string type columns.

-- Which table(s) do you think contain a date type column?
-- A: I think that dept_emp, dept_managers, employees, and titles hold date type columns. 

-- What is the relationship between the employees and the departments tables?
-- A: I believe that the relatinoship between the employees table and the departments table is that they both use
--  their respective numbers as their primary keys. (EMPLOYEES uses "emp_no" and DEPARTMENTS uses "dept_no".
SHOW CREATE TABLE employees;
SHOW CREATE TABLE departments;

-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.

-- A: SHOW CREATE TABLE dept_manager

