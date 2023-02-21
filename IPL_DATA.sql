USE DATABASE DEMODATABASE;

CREATE TABLE AM_IPL(
SID INT NOT NULL PRIMARY KEY,
SNAME VARCHAR (50) NOT NULL,
SAL FLOAT NOT NULL, 
AGE INT NOT NULL
);

INSERT INTO AM_IPL VALUES(1, 'mahi', 12, 40);
INSERT INTO AM_IPL VALUES(2, 'kohli', 14, 33);
INSERT INTO AM_IPL VALUES(3, 'DK', 6.25, 33);
INSERT INTO AM_IPL VALUES(4, 'warner', 6.75, 33);
INSERT INTO AM_IPL VALUES(5, 'rahul', 16, 29);
INSERT INTO AM_IPL VALUES(6, 'pandya', 14, 27);

SELECT * FROM AM_IPL;

SELECT Sname, sid, sal,
DECODE (sid, 1, 1.5*sal,
             2, 4*sal,
			 3, 9*sal,
             4, 10.25*sal,
             5, 5*sal, 100000) AS "REVISED SALARY"
              from AM_IPL ;
              
              
CREATE OR REPLACE VIEW AM_IPL_VIEW AS
SELECT Sname, sid, sal,
DECODE (sid, 1, 1.5*sal,
             2, 4*sal,
			 3, 9*sal,
             4, 10.25*sal,
             5, 5*sal, 100000) AS "REVISED SALARY"
              from AM_IPL ;
              
              
              
SELECT * FROM AM_IPL_VIEW;

CREATE OR REPLACE VIEW AM_IPL_UPDRADED_VIEW AS
SELECT Sid, Sname, Sal, Age,
DECODE (sid, 1, 2 * sid * sal,
             2, 3 * sid * sal,
             3, 5 * sid * sal,
             4, 10 * sid * sal,
             5, 12 * sid * sal,
             6, 15 * sid * sal,
             sal/2) AS "UPGRADED SALARY"
FROM AM_IPL;

SELECT * FROM AM_IPL_UPDRADED_VIEW;