-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retiring_soon 
FROM current_emp as ce
LEFT JOIN dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;