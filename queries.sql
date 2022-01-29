-- Check for employees born 1952-1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Check for employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT first_name
, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Send list of eligible retirees to a table for export
SELECT first_name
, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Drop the retirement table so it can be remade with emp_no for joins
DROP TABLE retirement_info;

-- Send list of eligible retirees to a table for export WITH EMP_NO FOR JOINS
SELECT emp_no
, first_name
, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check table was made correctly
SELECT * FROM retirement_info;

-- Join departments and dept_manager tables
SELECT departments.dept_name
, managers.emp_no
, managers.from_date
, managers.to_date
FROM departments
INNER JOIN managers
ON departments.dept_no = managers.dept_no;

-- Join retirement_info and dept_emp to confirm the employees are still presently employed at PH
SELECT R.emp_no
	, R.first_name
	, R.last_name
	, D.to_date
INTO current_emp	
FROM retirement_info AS R
LEFT JOIN dept_emp AS D
ON R.emp_no = D.emp_no
WHERE D.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Join current_emp and dept_emp tables to get an employee count by dept number
SELECT COUNT(C.emp_no), D.dept_no
INTO retiree_count_by_dept
FROM current_emp AS C
LEFT JOIN dept_emp AS D
ON C.emp_no = D.emp_no
GROUP BY D.dept_no
ORDER BY D.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

-- Make a new table with requested employee info (+ gender, salary)
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

DROP TABLE emp_info;

-- Join emp_info with salaries table
SELECT E.emp_no
	, E.first_name
	, E.last_name
	, E.gender
	, S.salary
	, DE.to_date
INTO emp_info
FROM employees AS E
INNER JOIN salaries AS S
ON (E.emp_no = S.emp_no)
INNER JOIN dept_emp as DE
ON (E.emp_no = DE.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--INTO manager_info
FROM managers AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
-- Add departments to current_emp for a list of retirees by department
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM dept_info
WHERE dept_name IN ('Sales','Development');