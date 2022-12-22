--Q2

CREATE OR REPLACE TABLE AM_SALES_DATA_COPY LIKE AM_SALES_DATA;

INSERT INTO AM_SALES_DATA_COPY SELECT * FROM AM_SALES_DATA;

SELECT * FROM AM_SALES_DATA_COPY;

ALTER TABLE AM_SALES_DATA_COPY
DROP PRIMARY KEY;

ALTER TABLE AM_SALES_DATA_COPY
ADD PRIMARY KEY (ORDER_ID);


/*Q3*/
ANS-CHANGED THE ORDER_DATE AND SHIP_DATE TO THE DATE FORMAT IN THE CSV FILE ITSELF

/*Q4-DOUBT*/

ALTER TABLE AM_SALES_DATA_COPY ADD COLUMN ORDER_EXTRACT STRING;

UPDATE AM_SALES_DATA_COPY

SET ORDER_EXTRACT= SUBSTR(ORDER_ID,9);

/*Q5*/

SELECT * FROM AM_SALES_DATA_COPY;

UPDATE AM_SALES_DATA_COPY
SET DISCOUNT_FLAG = (CASE
                          WHEN DISCOUNT > 0 THEN 'YES'
                          ELSE 'NO'
                          END);
						  
						  
/*Q6*/

SELECT * FROM AM_SALES_DATA_COPY;

UPDATE AM_SALES_DATA_COPY

SET PROCESS_DAYS= DATEDIFF(DAY,ORDER_DATE,SHIP_DATE);


ALTER TABLE AM_SALES_DATA_COPY ADD COLUMN RATING INT;

UPDATE AM_SALES_DATA_COPY
SET RATING =
CASE
             
            WHEN PROCESS_DAYS <= 3 THEN 5
            WHEN PROCESS_DAYS >3 AND PROCESS_DAYS <=6 THEN 4
            WHEN PROCESS_DAYS >6 AND PROCESS_DAYS <=10 THEN 3
            WHEN PROCESS_DAYS >10 THEN 2
            END;						  