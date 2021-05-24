-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "salaries".emp_no, last_name, first_name, sex, salary
FROM "Employees"
JOIN "salaries" ON "Employees".emp_no= "salaries".emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE  (SELECT EXTRACT(YEAR FROM hire_date))=1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Departments".dept_no, dept_name, "Employees".emp_no, last_name, first_name
FROM "dept_manager"
JOIN "Departments" ON "Departments".dept_no="dept_manager".dept_no
JOIN "Employees" ON "Employees".emp_no="dept_manager".emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "Employees".emp_no, last_name, first_name, dept_name
FROM "Employees"
JOIN "dept_emp" ON "dept_emp".emp_no="Employees".emp_no
JOIN "Departments" ON "Departments".dept_no="dept_emp".dept_no
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name='Hercules' AND last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, last_name, first_name, dept_name
FROM "Employees"
JOIN "dept_emp" ON "dept_emp".emp_no="Employees".emp_no
JOIN "Departments" ON "Departments".dept_no="dept_emp".dept_no
WHERE dept_name='Sales'
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, last_name, first_name, dept_name
FROM "Employees"
JOIN "dept_emp" ON "dept_emp".emp_no="Employees".emp_no
JOIN "Departments" ON "Departments".dept_no="dept_emp".dept_no
WHERE dept_name='Sales' OR dept_name='Development'
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name) AS lcount, last_name
FROM "Employees"
GROUP BY last_name ORDER BY  lcount DESC 