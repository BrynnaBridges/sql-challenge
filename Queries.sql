-- 1. List the following details of each employee: 
	--employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON salaries.emp_no = employees.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.last_name, 
employees.first_name, employees.hire_date
from employees
where extract(year from hire_date) = 1986;

--3. List the manager of each department with the following information: 
	--department number, department name, the manager's employee number, last name, first name.
SELECT employees.emp_no,
employees.last_name, employees.first_name, dept_manager.dept_num, departments.dept_name 
FROM dept_manager
Inner JOIN employees ON dept_manager.emp_no = employees.emp_no
Inner JOIN departments ON departments.dept_num = dept_manager.dept_num;

--4. List the department of each employee with the following information: 
	--employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name, employees.first_name, departments.dept_name 
FROM dept_emp
Inner JOIN employees ON dept_emp.emp_no = employees.emp_no
Inner JOIN departments ON departments.dept_num = dept_emp.dept_num;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name,
employees.last_name, employees.sex
from employees
WHERE employees.last_name LIKE 'B%'
AND employees.first_name = 'Hercules';

--6. List all employees in the Sales department, 
	--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name, employees.first_name, departments.dept_name 
FROM dept_emp
Inner JOIN employees ON dept_emp.emp_no = employees.emp_no
Inner JOIN departments ON departments.dept_num = dept_emp.dept_num
Where departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
	--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name, employees.first_name, departments.dept_name 
FROM dept_emp
Inner JOIN employees ON dept_emp.emp_no = employees.emp_no
Inner JOIN departments ON departments.dept_num = dept_emp.dept_num
Where departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY employees.last_name
ORDER BY 2 DESC;
