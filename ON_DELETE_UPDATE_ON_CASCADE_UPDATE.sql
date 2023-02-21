USE DEMODATABASE;

DROP TABLE Employee;

CREATE OR REPLACE TABLE Employee (
emp_id int NOT NULL,
name varchar(40) NOT NULL,
birthdate date NOT NULL,
gender varchar(10) NOT NULL,
hire_date date NOT NULL,
PRIMARY KEY (emp_id)
);

INSERT INTO Employee (emp_id, name, birthdate, gender, hire_date) VALUES
(101, 'Bryan', '1988-08-12', 'M', '2015-08-26'),
(102, 'Joseph', '1978-05-12', 'M', '2014-10-21'),
(103, 'Mike', '1984-10-13', 'M', '2017-10-28'),
(104, 'Daren', '1979-04-11', 'M', '2006-11-01'),
(105, 'Marie', '1990-02-11', 'F', '2018-10-12');

SELECT * FROM Employee;

DROP TABLE Payment;

CREATE TABLE Payment (
payment_id int PRIMARY KEY NOT NULL,
emp_id int NOT NULL,
amount float NOT NULL,
payment_date date NOT NULL,
FOREIGN KEY (emp_id) REFERENCES Employee (emp_id) ON DELETE CASCADE
);

INSERT INTO Payment (payment_id, emp_id, amount, payment_date) VALUES
(301, 101, 1200, '2015-09-15'),
(302, 101, 1200, '2015-09-30'),
(303, 101, 1500, '2015-10-15'),
(304, 101, 1500, '2015-10-30'),
(305, 102, 1800, '2015-09-15'),
(306, 102, 1800, '2015-09-30');

SELECT * FROM Payment;

DELETE FROM Employee WHERE emp_id = 102;

-- TO KNOW WHICH TABLE WILL BE AFFECTED IF ROWS ARE DELETED FROM THE PARENT TABLE 'EMPLOYEE' --
USE information_schema;
SELECT table_name FROM referential_constraints
WHERE constraint_schema = 'DEMO_DATABASE'
AND referenced_table_name = 'Employee'
AND delete_rule = 'CASCADE';

CREATE TABLE EMPLOYEE_PAYMENT_MASTER AS
SELECT E.emp_id AS Emp_Id,name,gender,birthdate,hire_date,payment_id,payment_date,amount
FROM Payment AS P
LEFT OUTER JOIN Employee AS E ON E.emp_id = P.emp_id;

SELECT * FROM EMPLOYEE_PAYMENT_MASTER;








