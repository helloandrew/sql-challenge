--1.List the following details of each employee: 
--employee number, last name, first name, gender, and salary. 
select employees.emp_no, employees.first_name, 
employees.last_name, employees.gender, salaries.salary
from employees join salaries 
on employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
select * from employees where hire_date like '1986%'
select * from employees where substr(hire_date,1,4)='1986'
select * from employees where left(hire_date,4)='1986'

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
select departments.dept_no, departments.dept_name, employees.emp_no, employees.first_name,
employees.last_name, dept_manager.from_date, dept_manager.to_date 
from dept_manager
join departments
on dept_manager.dept_no = departments.dept_no
join employees
on dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
from employees 
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no

--5. List all employees whose first name is 
--"Hercules" and last names begin with "B."
select last_name, first_name 
from employees
where left (last_name,1)='B' and
first_name like 'Hercules%'

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name like 'Sales%'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name like 'Sales%' 
or departments.dept_name like 'Development'

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name) as "Last name count" from employees
group by last_name
order by "Last name count" desc



