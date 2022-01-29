-- START OF CHALLENGE CODE
-- Deliverable 1: create the Retirment Titles table for employees born in 1952-1955
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles	
FROM employees AS em
LEFT JOIN titles AS t
ON em.emp_no = t.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Deliverable 1: Use Dictinct with Order By to remove duplicate rows in order to get just the most recent title in Unique Titles table
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Deliverable 1: Create a table with the count of employees retiring by title in Retiring Titles table
SELECT DISTINCT(title),
	COUNT(emp_no)
INTO  retiring_titles
FROM unique_titles
GROUP BY title;

-- Deliverable 2: Create a Mentorship Eligibility table
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no
 