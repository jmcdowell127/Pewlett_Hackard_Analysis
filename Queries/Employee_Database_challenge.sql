---------- DELIVERABLE 1 -------------

-- Create a retirements titles table that holds all the titles of current 
--	employees who were born between Jan 1, 1952 & Dec 31, 1995
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
			       rt.first_name,
			       rt.last_name,
			       rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;
--select * from unique_titles

-- Retrieve the number of employees by their most recent job title who are 
--	about to retire.
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;


----------- DELIVERABLE 2 ------------

-- Create a Mentorship Eligibility table that holds the employees who are 
--	eligible to participate in a mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
			      e.first_name, 
			      e.last_name, 
			      e.birth_date, 
			      de.from_date, 
			      de.to_date,
			      t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY e.emp_no;





		
