USE DATABASE DEMODATABASE;

CREATE OR REPLACE TABLE AM_BRILLIANT_BRITISH_CAR2(
InvoiceDate DATE, 
Make VARCHAR (20),
CountryName VARCHAR (20),
IsDealer VARCHAR (5),
SalePrice NUMBER (10,0),
CostPrice NUMBER (10,0),
TotalDiscount INTEGER,
DeliveryCharge INTEGER,
SpareParts INTEGER,
LaborCost INTEGER,
ClientName VARCHAR (50),
Model VARCHAR (20),
Color VARCHAR (30),
ReportingYear INTEGER,
ReportingMonth INTEGER,
Registeration_Date STRING,
VehicleType VARCHAR (20),
InvoiceNumber VARCHAR (40),
CountryISOCode VARCHAR (5),
OuterPostode VARCHAR (8),
Region VARCHAR (40)
);




SELECT * FROM AM_BRILLIANT_BRITISH_CAR2;

SELECT NVL(OUTERPOSTODE, 2) AS NEW_OUTERPOSTODE FROM AM_BRILLIANT_BRITISH_CAR2;
SELECT NVL(REGION, 'AMIR') FROM AM_BRILLIANT_BRITISH_CAR2;
SELECT NVL(NULL, 'AMIR') AS ABC;
SELECT NVL(ISDEALER, 5) FROM AM_BRILLIANT_BRITISH_CAR2;
SELECT SALEPRICE FROM AM_BRILLIANT_BRITISH_CAR2;
WHERE INVOICEDATE BETWEEN '2012-10-04' AND '2012-02-02'


create or replace table 

