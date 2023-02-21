CREATE OR REPLACE TABLE AM_EMPLOYEE
(
   EMPID INTEGER NOT NULL PRIMARY KEY,
   EMP_NAME VARCHAR2(20),
   JOB_ROLE STRING,
   SALARY NUMBER(10,2)
);

INSERT INTO AM_EMPLOYEE
VALUES('101','ANAND JHA','Analyst',50000);

INSERT INTO AM_EMPLOYEE
VALUES(102,'ALex', 'Data Engineer',60000);

INSERT INTO AM_EMPLOYEE
VALUES(103,'Ravi', 'Data Scientist',48000);

INSERT INTO AM_EMPLOYEE
VALUES(104,'Peter', 'Analyst',98000);

INSERT INTO AM_EMPLOYEE
VALUES(105,'Pulkit', 'Data Scientist',72000);

INSERT INTO AM_EMPLOYEE
VALUES(106,'Robert','Analyst',100000);

INSERT INTO AM_EMPLOYEE
VALUES(107,'Rishabh','Data Engineer',67000);

INSERT INTO AM_EMPLOYEE
VALUES(108,'Subhash','Manager',148000);

INSERT INTO AM_EMPLOYEE
VALUES(109,'Michaeal','Manager',213000);

INSERT INTO AM_EMPLOYEE
VALUES(110,'Dhruv','Data Scientist',89000);

INSERT INTO AM_EMPLOYEE
VALUES(111,'Amit Sharma','Analyst',72000);

SELECT * FROM AM_EMPLOYEE;

--ROW_NUM

SELECT*, ROW_NUMBER() OVER(PARTITION BY JOB_ROLE ORDER BY SALARY DESC) AS SAL_ROW
FROM AM_EMPLOYEE;


SELECT*, ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS SAL_ROW
FROM AM_EMPLOYEE;

--DENSE_RANK

SELECT*, DENSE_RANK() OVER(PARTITION BY JOB_ROLE ORDER BY SALARY DESC) AS SAL_ROW
FROM AM_EMPLOYEE;

SELECT*, RANK() OVER(PARTITION BY JOB_ROLE ORDER BY SALARY DESC) AS SAL_ROW
FROM AM_EMPLOYEE;















