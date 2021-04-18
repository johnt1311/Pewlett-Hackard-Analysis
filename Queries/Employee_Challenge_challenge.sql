--DELIVERABLE 1
SELECT emp_no, first_name, last_name FROM employees;

SELECT title, from_date, to_date FROM titles;

-- join titles and employees tables
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO employees_titles
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM employees_titles
ORDER BY emp_no, to_date DESC;

-- retiring titles table
SELECT title, COUNT(title) 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--DELIVERABLE 2
SELECT emp_no, first_name, last_name, birth_date FROM employees;

SELECT from_date, to_date FROM dept_emp;

SELECT DISTINCT ON (emp_no) title FROM titles
ORDER BY emp_no;

SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date,  t.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
JOIN titles AS t
on e.emp_no = t.emp_no
WHERE (d.to_date = '9999-01-01') AND
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;