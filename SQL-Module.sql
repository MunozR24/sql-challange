CREATE TABLE titles(
	title_id VARCHAR not null,
	title VARCHAR not null,
	Primary key (title_id)
);

CREATE TABLE employees(
	emp_no int not null,
	emp_title_id VARCHAR not null,
	birth_date date not null,
	first_name VARCHAR not null,
	last_name VARCHAR not null,
	sex VARCHAR not null,
	hire_date date not null,
	Foreign key (emp_title_id) references titles (title_id),
	Primary key (emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR not null,
	dept_name VARCHAR not null,
	Primary key (dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR not null,
	emp_no int not null,
	Foreign key (dept_no) references departments (dept_no),
	Foreign key (emp_no) references employees (emp_no),
	Primary key (dept_no, emp_no)
);

CREATE TABLE dept_emp (
	emp_no int not null,
	dept_no VARCHAR not null,
	Foreign key (dept_no) references departments (dept_no),
	Foreign key (emp_no) references employees (emp_no),
	Primary key (dept_no, emp_no)
	
);


CREATE TABLE salaries(
	emp_no int not null,
	salary int not null,
	Foreign key (emp_no) references employees (emp_no),
	Primary key (emp_no)
);



SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT emp_no, last_name, first_name
FROM employees
JOIN dept_emp ON emp_no = emp_no
JOIN departments ON dept_no = dept_no
WHERE dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;



