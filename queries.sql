-- queries 
-- HW QUERIES
-- #1 list the following details of each employee: employee number (employee), last name (employee), first name (employee), sex (employee),and salary (salary).
select employees.emp_no, employees.last_name, employees.first_name, salaries.salary
from employees
left join salaries
on (employees.emp_no = salaries.emp_no)
order by employees.emp_no;
	
-- #2. List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31';
	
-- #3. List manager of each dept with the following information: dept number, 
-- dept name, the managers employee number, last name, first name.
select dept_manager.dept_no, 
departments.dept_name, 
dept_manager.emp_no, 
employees.last_name, 
employees.first_name
from dept_manager
inner join departments on (dept_manager.dept_no = departments.dept_no)
inner join employees on (dept_manager.emp_no = employees.emp_no);

-- #4 List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, 
employees.last_name, 
employees.first_name,
departments.dept_name
from employees
inner join dept_emp on (employee.emp_no = dept_emp.emp_no)
inner join employees on (dept_emp.dept_no = departments.dept_no);
order by dept_name; - doesnt work 

-- #5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,
last_name,
sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name;

-- #6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.last_name,
employees.first_name,
departments.dept_name
from employees
inner join dept_emp on(employees.emp_no = dept_emp.emp_no)
inner join departments on (dept_emp.dept_no = departments.dept_no)
where departments.dept_name = 'Sales'
order by employees.emp_no;  

-- #7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no,
employees.last_name,
employees.first_name,
departments. dept_name
from employees 
inner join dept_emp on (employees.emp_no = dept_emp.emp_no)
inner join departments on (dept_emp.dept_no = departments.dept_no)
where departments.dept_name in ('Sales', 'Development')
order by employees.emp_no;

-- #8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,
count(last_name)
from employees
group by last_name
order by count(last_name) desc;