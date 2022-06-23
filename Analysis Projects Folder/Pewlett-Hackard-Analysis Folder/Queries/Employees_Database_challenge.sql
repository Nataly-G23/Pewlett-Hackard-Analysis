-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e 
INNER JOIN titles as ti 
on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--REMOVE DUPLICATES	
SELECT DISTINCT ON (r.emp_no) r.emp_no,
	r.first_name,
	r.last_name,
	r.title
INTO unique_titles
FROM retirement_titles as r
WHERE (r.to_date = '9999-01-01')
ORDER BY r.emp_no, r.to_date DESC;

-- Retiring titles count
Select COUNT (u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u 
GROUP BY u.title
ORDER BY count DESC;

--Mentorship Eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.from_date,
	d.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_employees as d
	ON (e.emp_no = d.emp_no)
	INNER JOIN titles as ti
	on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
