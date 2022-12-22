Q2- Change the Primary key to Order Id Column

USE WAREHOUSE TASK;

USE DATABASE ASSIGNMENT;

CREATE OR REPLACE TABLE AM_SALES_DATA(
ORDER_ID VARCHAR(20),
ORDER_DATE DATE PRIMARY KEY,
SHIP_DATE DATE,
SHIP_MODE VARCHAR (20),
CUSTOMER_NAME VARCHAR (30),
SEGMENT VARCHAR (15),
STATE VARCHAR (40),
COUNTRY VARCHAR(40),
MARKET VARCHAR(10),
REGION VARCHAR (15),
PRODUCT_ID VARCHAR (20),
CATEGORY VARCHAR (20),
SUB_CATEGORY VARCHAR (15),
PRODUCT_NAME STRING,
SALES INTEGER,
QUANTITY INTEGER,
DISCOUNT FLOAT,
PROFIT FLOAT,
SHIPPING_COST FLOAT,
ORDER_PRIORITY VARCHAR (10),
YEAR INT);

CREATE OR REPLACE TABLE AM_SALES_DATA_COPY LIKE AM_SALES_DATA;

INSERT INTO AM_SALES_DATA_COPY SELECT * FROM AM_SALES_DATA;

ALTER TABLE AM_SALES_DATA_COPY
DROP PRIMARY KEY;

ALTER TABLE AM_SALES_DATA_COPY
ADD PRIMARY KEY (ORDER_ID);

SELECT * FROM AM_SALES_DATA_COPY;

Q3- Check the data type for Order date and Ship date and mention in what data type it should be?

CHANGED THE ORDER_DATE AND SHIP_DATE TO THE DATE FORMAT IN THE CSV FILE ITSELF

Q4- Create a new column called order_extract and extract the number after the last ‘–‘from Order ID column.

ALTER TABLE AM_SALES_DATA_COPY ADD COLUMN ORDER_EXTRACT STRING;

UPDATE AM_SALES_DATA_COPY
SET ORDER_EXTRACT= SUBSTR(ORDER_ID,9);

Q5- Create a new column called Discount Flag and categorize it based on discount. Use ‘Yes’ if the discount is greater than zero else ‘No’.

ALTER TABLE AM_SALES_DATA_COPY ADD COLUMN ORDER_EXTRACT STRING;

UPDATE AM_SALES_DATA_COPY
SET DISCOUNT_FLAG = (CASE
                          WHEN DISCOUNT > 0 THEN 'YES'
                          ELSE 'NO'
                          END);
						  
						  
Q6- Create a new column called process days and calculate how many days it takes for each order id to process from the order to its shipment.

SELECT * FROM AM_SALES_DATA_COPY;

UPDATE AM_SALES_DATA_COPY

SET PROCESS_DAYS= DATEDIFF(DAY,ORDER_DATE,SHIP_DATE);


Q7- Create a new column called Rating and then based on the Process dates give rating like given below.
a. If process days less than or equal to 3days then rating should be 5
b. If process days are greater than 3 and less than or equal to 6 then rating should be 4
c. If process days are greater than 6 and less than or equal to 10 then rating should be 3
d. If process days are greater than 10 then the rating should be 2.

ALTER TABLE AM_SALES_DATA_COPY ADD COLUMN RATING INT;

UPDATE AM_SALES_DATA_COPY
SET RATING =
CASE
             
            WHEN PROCESS_DAYS <= 3 THEN 5
            WHEN PROCESS_DAYS >3 AND PROCESS_DAYS <=6 THEN 4
            WHEN PROCESS_DAYS >6 AND PROCESS_DAYS <=10 THEN 3
            WHEN PROCESS_DAYS >10 THEN 2
            END;						  
