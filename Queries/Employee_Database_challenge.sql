SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.titles,
	ti.from_date,
	ti.to_date INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT *
FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.titles -- Export the Unique Titles table as unique_titles.csv
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no,
	rt.to_date DESC;
	
SELECT *
FROM unique_titles;


SELECT COUNT(ut.emp_no),
	ut.titles 
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY COUNT DESC;

SELECT *
FROM retiring_titles;


