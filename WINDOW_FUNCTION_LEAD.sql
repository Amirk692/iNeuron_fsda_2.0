USE AM_WINDOW_FUNCTIONS;

DROP TABLE SALES;

CREATE OR REPLACE TABLE SALES(
PROD_ID INT NOT NULL,
Sale_Date DATE,
Daily_Sales NUMBER(10,2)
);

INSERT INTO SALES VALUES(1000,'2000-09-28',48850.40);
INSERT INTO SALES VALUES(1000,'2000-09-29',54500.22);
INSERT INTO SALES VALUES(1000,'2000-09-30',36000.07);
INSERT INTO SALES VALUES(1000,'2000-10-01',40200.43);
INSERT INTO SALES VALUES(1000,'2000-09-28',48850.40);
INSERT INTO SALES VALUES(2000,'2000-09-28',41888.88);
INSERT INTO SALES VALUES(2000,'2000-09-29',48000.00);
INSERT INTO SALES VALUES(2000,'2000-09-30',49850.03);
INSERT INTO SALES VALUES(2000,'2000-10-01',54850.29);
INSERT INTO SALES VALUES(3000,'2000-09-28',61301.77);
INSERT INTO SALES VALUES(3000,'2000-09-29',34509.13);
INSERT INTO SALES VALUES(3000,'2000-09-30',43868.86);
INSERT INTO SALES VALUES(3000,'2000-10-01',28000.00);

SELECT * FROM SALES;

--LEAD FUNCTION

SELECT PROD_ID, Sale_Date AS DATE, Daily_Sales AS SALES,
LEAD(DAILY_SALES,1) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS SECOND_DAY_SALE,
LEAD(DAILY_SALES,2) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS THIRD_DAY_SALE,
LEAD(DAILY_SALES,3) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS FOURTH_DAY_SALE
FROM SALES;

SELECT PROD_ID, Sale_Date AS DATE, Daily_Sales AS SALES,
LEAD(DAILY_SALES,1) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS SECOND_DAY_SALE,
LEAD(DAILY_SALES,2) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS THIRD_DAY_SALE,
LEAD(DAILY_SALES,3) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS FOURTH_DAY_SALE,
ROUND(SECOND_DAY_SALE-SALES/SALES*100) AS SALES_CHANGE,
ROUND(THIRD_DAY_SALE-SECOND_DAY_SALE*100) AS SALES_CHANGE_SECOND_DAY,
ROUND(FOURTH_DAY_SALE-THIRD_DAY_SALE*100) AS SALES_CHANGE_THIRD_DAY

FROM SALES;

-- ONLY TO SHOW THE PERCENT CHANGE

SELECT PROD_ID,DATE,SALES,SALES_CHANGE_FIRST_DAY,SALES_CHANGE_SECOND_DAY,SALES_CHANGE_THIRD_DAY 
FROM(
SELECT PROD_ID, Sale_Date AS DATE, Daily_Sales AS SALES,
LEAD(DAILY_SALES,1) OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS SECOND_DAY_SALE,
LEAD(DAILY_SALES,2) OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS THIRD_DAY_SALE,
LEAD(DAILY_SALES,3) OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS FOURTH_DAY_SALE,
ROUND(SECOND_DAY_SALE-SALES/SALES*100) AS SALES_CHANGE_FIRST_DAY,
ROUND(THIRD_DAY_SALE-SECOND_DAY_SALE*100) AS SALES_CHANGE_SECOND_DAY,
ROUND(FOURTH_DAY_SALE-THIRD_DAY_SALE*100) AS SALES_CHANGE_THIRD_DAY
FROM SALES);

-- LAG FUNCTION

SELECT PROD_ID, Sale_Date AS DATE, Daily_Sales AS TODAY_SALES,
LEAD(DAILY_SALES,1) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS PREVIOUS_DAY_SALE,
LEAD(DAILY_SALES,2) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS PREVIOUS_TWO_DAY_SALE,
LEAD(DAILY_SALES,3) IGNORE NULLS OVER(PARTITION BY PROD_ID ORDER BY SALE_DATE) AS PREVIOUS_THREE_DAY_SALE,
ROUND(PREVIOUS_DAY_SALE-TODAY_SALES/TODAY_SALES*100) AS SALES_CHANGE,
ROUND(PREVIOUS_TWO_DAY_SALE-PREVIOUS_DAY_SALE/PREVIOUS_DAY_SALE*100) AS SALES_CHANGE_SECOND_DAY,
ROUND(PREVIOUS_THREE_DAY_SALE-PREVIOUS_TWO_DAY_SALE/PREVIOUS_TWO_DAY_SALE*100) AS SALES_CHANGE_THIRD_DAY
FROM SALES;























