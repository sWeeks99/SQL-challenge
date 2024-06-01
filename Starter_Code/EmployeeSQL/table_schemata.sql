DROP TABLE departments;	--TO REMOVE 

CREATE TABLE departments (	--done
    dept_no CHAR(4) PRIMARY KEY,	--dept_no PRIMARY
    dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM departments

DROP TABLE dept_emp;	--TO REMOVE 
	
CREATE TABLE dept_emp (	--done
	emp_no INT,		--emp_no, dupes exist so do not establish primary key
	dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)		--dept_no FOREIGN
);
SELECT * FROM dept_emp

DROP TABLE dept_manager;	--TO REMOVE 
	
CREATE TABLE dept_manager ( --done
	dept_no CHAR(4) NOT NULL,	--dept no
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),		--dept_no FOREIGN
	emp_no INT
);
SELECT * FROM dept_manager

DROP TABLE employees;	--TO REMOVE 
	
CREATE TABLE employees ( --done
	emp_no INT PRIMARY KEY,		--emp_no PRIMARY
	emp_title VARCHAR(30) NOT NULL,
	birth_date VARCHAR(15) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(15) NOT NULL
);
SELECT * FROM employees

DROP TABLE salaries;	--TO REMOVE 

CREATE TABLE salaries (	--done redo
	emp_no INT,			--emp_no
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),		--emp_no FOREIGN
	salary INT NOT NULL
);
SELECT * FROM salaries

DROP TABLE titles;	--TO REMOVE 
	
CREATE TABLE titles (
	title_id VARCHAR (15) NOT NULL,
	title VARCHAR (30) NOT NULL
);
SELECT * FROM titles