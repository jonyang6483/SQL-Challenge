-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, last_name, first_name, sex, salary
FROM employees AS emp
JOIN salaries AS sal
ON sal.emp_no = emp.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dmgr.dept_no, dep.dept_name, dmgr.emp_no, emp.last_name AS manager_last_name, emp.first_name AS manager_first_name
FROM dept_manager AS dmgr
JOIN employees AS emp
ON emp.emp_no = dmgr.emp_no
JOIN departments AS dep
ON dep.dept_no = dmgr.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dmgr.dept_no, dmgr.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM dept_emp AS dmgr
JOIN employees AS emp
ON emp.emp_no = dmgr.emp_no
JOIN departments AS dep
ON dep.dept_no = dmgr.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT 'Sales' AS dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
JOIN dept_emp AS dem
ON emp.emp_no = dem.emp_no
WHERE dem.dept_no = (SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales');

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
JOIN dept_emp AS dem
ON emp.emp_no = dem.emp_no
JOIN departments AS dep
ON dep.dept_no = dem.dept_no
WHERE dep.dept_name IN ('Sales','Development');

-- 8. List the frequency counts, in descending order, of all the employee last names 
SELECT last_name, COUNT(first_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;