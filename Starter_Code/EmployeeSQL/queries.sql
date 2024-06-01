--[DONE] List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--[DONE] List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_DATE(hire_date, 'MM/DD/YYYY') >= '1986-01-01'	--TO_DATE converts hire_date string in the m/d/yyyy format
AND TO_DATE(hire_date, 'MM/DD/YYYY') < '1987-01-01';

--[DONE] List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.emp_no AS manager_emp_no, 
       e.last_name AS manager_last_name, 
       e.first_name AS manager_first_name, 
       dm.dept_no AS department_number, 
       d.dept_name AS department_name, 
       e.emp_no AS employee_number, 
       e.last_name AS employee_last_name, 
       e.first_name AS employee_first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--[DONE] List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT d.dept_no AS department_number, 
	   e.emp_no AS employee_number, 
       e.last_name AS employee_last_name, 
       e.first_name AS employee_first_name, 
       d.dept_name AS department_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

--[DONE] List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--[DONE] List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no AS sales_employee_number, 
       e.last_name AS sales_employee_last_name, 
       e.first_name AS sales_employee_first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--[DONE] List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no AS salesemployee_number, 
       e.last_name AS employee_last_name, 
       e.first_name AS employee_first_name,
       d.dept_name AS department_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--[DONE] List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) as same_last_name_count
FROM employees
GROUP BY last_name
ORDER BY same_last_name_count DESC;