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



