USE DATABASE DEMODATABASE;

-- REVERSE IN STRING
select reverse('India is My Country');

-- SPLIT
select split('127.0.0.1', '.');
SELECT SPLIT('ANAND-KUMAR-JHA',' ');
SELECT SPLIT('ANAND-KUMAR-JHA','-');
select split('|a||', '|');

create or replace table am_persons
(
   NAME CHAR(10),
   CHILDREN VARCHAR(30)
);

INSERT INTO AM_PERSONS
VALUES('Mark','Marky,Mark Jr,Maria'),('John','Johnny,Jane');

select * from AM_persons;

SELECT SPLIT(CHILDREN,',') FROM AM_persons;

select name, anand.value::string as childname
from AM_persons,
     lateral flatten(input=>split(children, ',')) anand;






select  split_part('11.22.33', '.', 1) as first_part , 
        split_part('11.22.33', '.', 2) as sec_part;

select split_part('aaa--bbb-BBB--ccc', '--',1);
select split_part('aaa--bbb-BBB--ccc', '--',2);
select split_part('aaa--bbb-BBB--ccc', '--',3);
select split_part('aaa--bbb-BBB--ccc', '--',4);

SELECT split(AGENT_DETAILS, '-')
FROM (
SELECT *,concat(AGENT_CODE, '-', AGENT_NAME) AS agent_details 
  from agents );
  

SELECT lower('India Is My Country') as lwr_strng;
SELECT UPPER('India Is My Country') as upr_strng;


select UPPER(CONCAT(substring('ruhee k qureshi',1,1), 
                    substring('ruhee k qureshi',7,1) ,
                    substring('ruhee k qureshi',9,1))) as initial;

SELECT INITCAP('india is my country') as init_cap_sent;
/*
delimiters specified as an empty string (i.e. '') instructs INITCAP to ignore all delimiters, 
including whitespace characters, in the input expression (i.e. the input expression is treated as a single, continuous word). 
The resulting output is a string with the 
first character capitalized (if the first character is a letter) and all other letters in lowercase.
*/
select initcap('this is the new Frame+work');
select initcap('this is the new Framework','');
select initcap('iqamqinterestedqinqthisqtopic','q');
select initcap('lion☂fRog potato⨊cLoUD', '⨊☂');





--REPLACE COMMAND
-- REPLACE( <subject> , <pattern> [ , <replacement> ] )

select REPLACE( '   ANAND KUMAR JHA   ' ,' ','*');
select REPLACE( '   ANAND KUMAR JHA   ' ,' '); -- 

SELECT REPLACE('   T  E S T I N G 1 2 3 4   ',' ');

select replace('abcd', 'bc') as replaced_nothing_just_remove;

create or replace table replace_example
(subject varchar(10), 
 pattern varchar(10), 
 replacement varchar(10));
 
insert into replace_example 
values('snowman', 'snow', 'fire'), 
('sad face', 'sad', 'happy');

select * from replace_example;

select subject, pattern, replacement, 
       replace(subject, pattern, replacement) as new 
       from replace_example;

select * from AM_CONSUMER_COMPLAINTS WHERE STARTSWITH(PRODUCT_NAME,'Bank');
select * from AM_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE 'Bank%';
select * from AM_CONSUMER_COMPLAINTS where contains(PRODUCT_NAME, 'Bank');
select * from AM_CONSUMER_COMPLAINTS where endswith(PRODUCT_NAME , 'Loan');


select right('ABCDEFG', 2);

select LEFT('ABCDEFG', 4);

SELECT RIGHT('ASJHKVASFJFSACNKLSAHFL2378475723595469HERLLOUS',2) AS COUNTRY_CODE;

SELECT LOWER(CONCAT(AGENT_NAME, ' ', country)) AS NAME_COUNTRY,
       INITCAP(NAME_COUNTRY) AS_INITCAP_EX,
       UPPER(RIGHT(NAME_COUNTRY,2)) AS RIGHT_Country
FROM AGENTS;

select nvl(null, 'bard') as col1, 
       nvl(null, 0) as col2;

select column1, column2, column3, 
coalesce(column1, column2, column3) as extracted_values
from 
(values
  ('anand', 'kumar'   ,   null  ),
  (null, null, 'singh' )
) v;
-----------------------------------------
SELECT COALESCE(1,'ANAND','KUMAR') AS NAME;

SELECT COALESCE('VIJAY', 1,'ANAND','KUMAR') AS NAME;

SELECT * FROM AGENTS;

SELECT COALESCE(AGENT_CODE, CAST(COMMISSION AS VARCHAR)) AS NEW_DATA FROM AGENTS;



SELECT INITCAP('this is the new Frame+work', '');

SELECT INITCAP('THIS IS THE NEW FRAME+WORK', '');

select initcap('iqamqinterestedqinqthisqtopic','q');-- THERE IS NO Q AFTER 'topic', why has it given 'Topic' in return?

select initcap('apple is僉sweetandballIsROUND', '僉a b');

select initcap('iqamqinterestedqinqthisqtopic','q');-- IN INITCAP, EVERY SUBSEQUENT LETTER AFTER THE DELIMITTER BECOMES UPPERCASE INCLUDING THE FIRST LETTER OF THE WNTIRE STRING

--REPLACE COMMAND
-- REPLACE( <subject> , <pattern> [ , <replacement> ] )

select REPLACE( '   ANAND KUMAR JHA   ' ,' ','*');
select REPLACE( '   ANAND KUMAR JHA   ' ,' '); -- 

SELECT REPLACE('   T  E S T I N G 1 2 3 4   ',' ');

select replace('abcd', 'bc') as replaced_nothing_just_remove;

create or replace table replace_example
(subject varchar(10), 
 pattern varchar(10), 
 replacement varchar(10));
 
insert into replace_example 
values('snowman', 'snow', 'fire'), 
('sad face', 'sad', 'happy');

select * from replace_example;

select subject, pattern, replacement, 
       replace(subject, pattern, replacement) as new 
       from replace_example;
       
SELECT * FROM AM_CONSUMER_COMPLAINTS;

select * from AM_CONSUMER_COMPLAINTS WHERE STARTSWITH(PRODUCT_NAME,'Bank');
select * from AM_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE 'Bank%';
select * from AM_CONSUMER_COMPLAINTS where contains(PRODUCT_NAME, 'Bank');
select * from AM_CONSUMER_COMPLAINTS where endswith(PRODUCT_NAME , 'Loan');


select right('ABCDEFG', 2);

select SUBSTR('ABCDEFG', 6);

select LEFT('ABCDEFG', 4);

select SUBSTR('ABCDEFG', 1,4);

SELECT RIGHT('ASJHKVASFJFSACNKLSAHFL2378475723595469HERLLOUS',2) AS COUNTRY_CODE;

SELECT LOWER(CONCAT(AGENT_NAME, ' ', country)) AS NAME_COUNTRY,
       INITCAP(NAME_COUNTRY) AS_INITCAP_EX,
       UPPER(RIGHT(NAME_COUNTRY,2)) AS RIGHT_Country
FROM AGENTS;

select nvl(null, 'bard') as col1, 
       nvl(null, 0) as col2;

select column1, column2, column3, 
coalesce(column1, column2, column3) as extracted_values
from 
(values
  ('anand', 'kumar'   ,   null  ),
  (null, null, 'singh' )
) v;

SELECT COALESCE(1,'ANAND','KUMAR') AS NAME;

SELECT COALESCE('VIJAY', 1,'ANAND','KUMAR') AS NAME;

SELECT * FROM AGENTS;

SELECT COALESCE(AGENT_CODE, CAST(COMMISSION AS VARCHAR)) AS NEW_DATA FROM AGENTS;








