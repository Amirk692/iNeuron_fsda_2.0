USE DATABASE DEMODATABASE;

CREATE OR REPLACE TABLE AM_AGENTS
   (	
     AGENT_CODE CHAR(6) NOT NULL PRIMARY KEY, 
	 AGENT_NAME CHAR(40) , 
	 WORKING_AREA CHAR(35), 
	 COMMISSION NUMBER(10,2) DEFAULT 0.05, 
	 PHONE_NO CHAR(15), 
	 COUNTRY VARCHAR2(25) 
	 );

INSERT INTO AM_AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore',0.15,'077-25814763', '');
INSERT INTO AM_AGENTS(AGENT_CODE,AGENT_NAME,WORKING_AREA) 
VALUES ('A110', 'Anand', 'Germany');


INSERT INTO AM_AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AM_AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AM_AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AM_AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AM_AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AM_AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AM_AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AM_AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AM_AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AM_AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AM_AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

SELECT * FROM AM_AGENTS;

----SET THE COUNTRY TO 'IN' WHEREEVER COUNTRY IS NULL OR BLANK IS NULL

UPDATE AM_AGENTS
SET COUNTRY = 'IN' WHERE COUNTRY IS NULL OR COUNTRY = '';

/* The SUBSTRING () function returns the position of a string or binary value from the complete string, 
starting with the character specified by substring_start_index. If any input is null, null is returned */

/*Example 1: Get the substring from a specific string in Snowflake*/


SELECT SUBSTRING ('MD AMIR', 1,6) AS PARTIAL_NAME;

SELECT SUBSTRING ('MD    AMIR', 1,6) AS PARTIAL_NAME;

SELECT SUBSTRING ('MD AMIR', 0,6) AS PARTIAL_NAME2;

SELECT SUBSTRING ('ANAND KUMAR JHA', 0,3) AS PARTIAL_NAME;

SELECT SUBSTRING ('ANAND KUMAR JHA', 1,3) AS PARTIAL_NAME;

SELECT SUBSTR ('MD AMIR', 1,6) AS PARTIAL_NAME;

SELECT SUBSTR ('MD AMIR', 0,6) AS PARTIAL_NAME;

SELECT SUBSTR ('MD AMIR', 0) AS PARTIAL_NAME;

SELECT SUBSTR ('MD AMIR', 1) AS PARTIAL_NAME;

SELECT SUBSTR ('MD AMIR', -4) AS PARTIAL_NAME;

SELECT SUBSTR ('MD AMIR', -3) AS PARTIAL_NAME;

-- AKASH
-- sir if I want only M from MD and A FROM AMIR SO IN THIS CASE WHAT SHOULD I DO

SELECT SUBSTR('MD AMIR',1,1)|| SUBSTR('MD AMIR',4,1) AS INITIALS_OF_BOTH_NAMES;

--OR

SELECT CONCAT(SUBSTR('MD AMIR',1,1), SUBSTR('MD AMIR',4,1)) AS INITIALS_OF_BOTH_NAMES;


SELECT AGENT_CODE, AGENT_NAME, SUBSTR(AGENT_NAME, 0,2) AS INITIALS
FROM AM_AGENTS; 

--(LEN) TO RETURN THER LENGTH OF A STRING

SELECT LEN('MD AMIR') AS TOTAL_CHARACTERS;

--BLANKS ARE ALSO COUNTED
SELECT LEN('   MD AMIR   ') AS TOTAL_CHARACTERS;

SELECT CONCAT('MD AMIR','BARCLAYS', 'NOIDA');

SELECT 'MD AMIR'||'BARCLAYS'||'NOIDA';

SELECT CONCAT('    MD AMIR    ','    BARCLAYS     ','    NOIDA    ');

SELECT 'MD AMIR'||' BARCLAYS'|| ' NOIDA';

SELECT AGENT_CODE || ' ' || AGENT_NAME as AGENT_DETAILS 
FROM AM_AGENTS;

SELECT WORKING_AREA || ' ' || COUNTRY AS WORKING_COUNTRY
FROM AM_AGENTS;

/*
Snowflake CAST is a data-type conversion command. 
Snowflake CAST works similar to the TO_ datatype conversion functions. 
If a particular data type conversion is not possible,
it raises an error. Let’s understand the Snowflake CAST in detail via the syntax and a few examples.
*/

select cast('1.6845' as decimal(4,2));
select '1.6845'::decimal(2,1);

select cast('10-Sep-2021' as timestamp);

select cast('5.786542' as decimal(6,4));

select try_cast('MD AMIR' as CHAR(4));
select try_cast('MD AMIR' as STRING);
select cast('MD AMIR' as CHAR(4));
select cast('MD AMIR' as STRING);

-- When the provided precision is insufficient 
-- to hold the input value, the Snowflake CAST command raises an error as follows:
select cast('123.12' as number(4,2));
--Here, precision is set as 4 but the input value has a total of 5 digits, thereby raising the error.
select cast('123.12' as number(4,1));

--TRY_CAST( <source_string_expr> AS <target_data_type> )
select try_cast('05-Mar-2016' as timestamp);

--The Snowflake TRY_CAST command returns NULL as the input value 
--has more characters than the provided precision in the target data type.
select try_cast('ANAND' as char(4));

---select cast ('27-09-2012' as timestamp) why is it not taking

select TRY_cast('23-09-1990' as timestamp);
select TRY_cast('1990-09-23' as timestamp);

--trim function
select trim('❄-❄ABC-❄-', '❄-') as trimmed_string;
select trim('❄-❄ABC-❄-', '❄') as trimmed_string;
select trim('❄-❄ABC-❄-', '-') as trimmed_string;
SELECT TRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE;
SELECT TRIM('********T E S T I*N*G 1 2 3 4********','*') AS TRIMMED_SPACE;


--trim function-DOUBT
select trim('ABC-❄-,,,,,', ',') as trimmed_string;
select trim('❄-❄ABC--❄', '❄') as trimmed_string;
select trim('❄-❄ABC-❄-', '-') as trimmed_string;
SELECT TRIM('********/T E S T I N G 1 2 3 4/********','*/') AS TRIMMED_SPACE;
SELECT TRIM('********T E S T I*N*G 1 2 3 4********','*') AS TRIMMED_SPACE;


select trim('****MD AMIR****', '*') as trimmed_string;

select trim('*❄MD AMIR❄*', '❄*') as trimmed_string;

--ltrim
select ltrim('#000000123', '0#');
select ltrim('#000000123', '#0');
select ltrim('#0000AISHWARYA', '0#');
select ltrim('      ANAND JHA', '');
SELECT LTRIM('*000000     MD AMIR','*0''');

SELECT LTRIM('*######     MD AMIR','#*''');




--RTRIM
select rtrim('$125.00', '0.');
select rtrim('ANAND JHA*****', '*');
SELECT LTRIM('MD AMIR*-*-*-*-*-*         ','*-''');
--DOUBT
SELECT LTRIM('MD AMIR*-*-*-*-*-*         ','*-');

--To remove the white spaces or the blank spaces from the string TRIM function can be used. 
--It can remove the whitespaces from the start and end both.
select TRIM('  Snwoflake Space Remove  ',' ');

--To remove the first character from the string you can pass the string in the RTRIM function.
select LTRIM('Snowflake Remove  ', 'S'); --EXCEL U WILL FIND LEFT
--To remove the last character from the string you can pass the string in the RTRIM function.
select RTRIM('Snwoflake Remove', 'e'); --IN EXCEL U WILL FIND RIGHT

select BTRIM('  Snwoflake Space Remove  ', ' '); -- THERE IS NOTHING CALLED BTGRIM

--LENGTH FUNCTION
SELECT LEN(trim('  Snowflake Space Remove  ')) as length_EXCUDING_SPACE_string;
SELECT LEN('Snowflake Space Remove');
SELECT LENGTH(trim('  Snowflake Space Remove  ')) as length_string;

--concat
select * from AM_AGENTS;

SELECT CONCAT('KA', '-', 'India') as state_country;

SELECT *,concat('*',AGENT_CODE, '-', AGENT_NAME,'*') AS agent_details from AM_AGENTS;

--Snowflake CONCAT_WS Function
/* The concat_ws function concatenates two or more strings, or concatenates two or more binary values 
and adds separator between those strings.
The CONCAT_WS operator requires at least two arguments, and uses the first argument to separate all following arguments

Following is the concat_ws function syntax
CONCAT_WS( <separator> , <expression1> [ , <expressionN> ... ] ) */

SELECT CONCAT_WS('-', 'KA','India') as state_country;

/*
Snowflake Concat Operator (||)
The concatenation operator concatenates two strings on either side of the || symbol and returns the concatenated string. 
The || operator provides alternative syntax for CONCAT and requires at least two arguments.

For example,
*/
select 'Nested' || ' CONCAT' || ' example!' as Concat_operator;


--Handling NULL Values in CONCAT function and the Concatenation operator
--For both the CONCAT function and the concatenation operator,
--if one or both strings are null, the result of the concatenation is null.
--For example,

select concat('Bangalore, ', NULL) as null_example;
select 'Bangalore, '|| NULL as null_example;

--how to handle it?
select concat('Bangalore ', NVL(NULL,'')) as null_example;
select 'Bangalore'|| NVL(NULL, '') as null_example;









