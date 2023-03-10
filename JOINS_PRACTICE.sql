USE WAREHOUSE ABCD;

USE DATABASE DEMODATABASE;

CREATE OR REPLACE TABLE AM_COMPLAIN2(

ComplainID INT,
ComplainDate VARCHAR (10),
CompletionDate VARCHAR (10),
CustomerID INT,
BrokerID INT,
ProductID INT,
ComplainPriorityID INT,
ComplainTypeID INT,
ComplainSourceID INT,
ComplainCategoryID INT,
ComplainStatusID INT,
AdministratorID STRING,
ClientSatisfaction VARCHAR (5),
ExpectedReimbursement INT );

SELECT * FROM AM_COMPLAIN2;


-----
CREATE OR REPLACE TABLE AM_CUSTOMERS2(

CustomerID INT,
LastName VARCHAR (60),
FirstName VARCHAR (60),
BirthDate VARCHAR (20),
Gender VARCHAR (10),
ParticipantType VARCHAR (20),
RegionID INT,
MaritalStatus VARCHAR (20));

SELECT * FROM AM_CUSTOMERS2;

-----

CREATE OR REPLACE TABLE  AM_BROKERS2(

BrokerID INT,
BrokerCode VARCHAR (20),
BrokerFullName VARCHAR (50),
DistributionNetwork VARCHAR (50),
DistributionChannel VARCHAR (50),
CommissionScheme VARCHAR (20)

);

SELECT * FROM AM_BROKERS2;

CREATE OR REPLACE TABLE AM_CATEGORY2(

ID INT,
Description VARCHAR (100),
Active INT

);

SELECT * FROM AM_CATEGORY2;

-----

CREATE OR REPLACE TABLE AM_PRIORITY2(

ID INT,
Description_priority CHAR (10)  
);

SELECT * FROM AM_PRIORITY2;

-----

CREATE OR REPLACE TABLE AM_PRODUCT2(

ProductID INT,
ProductCategory VARCHAR (30),
ProductSubCategory VARCHAR (30),
Product VARCHAR (10)  
  
);

SELECT * FROM AM_PRODUCT2;

-----

CREATE OR REPLACE TABLE AM_REGION2(

id INT,
name STRING,
county STRING,
state_code CHAR (5),
state VARCHAR (50),  
type VARCHAR (50),  
latitude NUMBER (11,4),
longitude NUMBER (11,4),
area_code INT,
population INT,
households INT,
median_income INT,
land_area INT,
water_area INT,
time_zone VARCHAR (50)

);

SELECT * FROM AM_REGION2;

-----

CREATE OR REPLACE TABLE AM_SOURCES2(

ID INT,
Description VARCHAR (20)
);

SELECT * FROM AM_SOURCES2;

-----

CREATE OR REPLACE TABLE AM_STATE_REGION2(

State_Code VARCHAR (20),
State VARCHAR (20),
Region VARCHAR (20)

);

SELECT * FROM AM_STATE_REGION2;

-------

CREATE OR REPLACE TABLE AM_STATUS2(

ID INT,
Description_source VARCHAR (20)


);

SELECT * FROM AM_STATUS2;

-----

CREATE OR REPLACE TABLE AM_TYPE2(

ID INT,
Description_type VARCHAR (20)

);

SELECT * FROM AM_TYPE2;

------

CREATE OR REPLACE TABLE AM_STATUS_HISTORY2(

ID INT,
ComplaintID INT,
ComplaintStatusID INT,
StatusDate VARCHAR (10)

);

SELECT * FROM AM_STATUS_HISTORY2;

-----

DESC TABLE AM_COMPLAIN2;                SELECT * FROM AM_COMPLAIN2;    COM
DESC TABLE AM_CUSTOMERS2;               SELECT * FROM AM_CUSTOMERS2;   CUS
DESC TABLE AM_BROKERS2;                 SELECT * FROM AM_BROKERS2;     BR
DESC TABLE AM_CATEGORY2;                SELECT * FROM AM_CATEGORY2;    CAT
DESC TABLE AM_PRIORITY2;                SELECT * FROM AM_PRIORITY2;    PR
DESC TABLE AM_PRODUCT2;                 SELECT * FROM AM_PRODUCT2;     PD
DESC TABLE AM_REGION2;                  SELECT * FROM AM_REGION2;      RG
DESC TABLE AM_SOURCES2;                 SELECT * FROM AM_SOURCES2;     SR
DESC TABLE AM_STATE_REGION2;            SELECT * FROM AM_STATE_REGION2;STR
DESC TABLE AM_STATUS2;                  SELECT * FROM AM_STATUS2;      ST
DESC TABLE AM_TYPE2;                    SELECT * FROM AM_TYPE2;        TP
DESC TABLE AM_STATUS_HISTORY2;          SELECT * FROM AM_STATUS_HISTORY2; --SH

-----

CREATE OR REPLACE TABLE AM_COMPLAIN_MASTER_TABLE AS
SELECT COM.*, CUS.FIRSTNAME AS FIRST_NAME, CUS.LASTNAME AS LAST_NAME, CUS.BIRTHDATE AS D_O_B, CUS.GENDER, CUS.PARTICIPANTTYPE, CUS.MARITALSTATUS,
       BR.BROKERID AS BROKER_ID, BR.BROKERCODE, BR.BROKERFULLNAME, CAT.DESCRIPTION, PR.DESCRIPTION_PRIORITY, PD.PRODUCTCATEGORY, PD.PRODUCTSUBCATEGORY,
       RG.NAME AS REGION_NAME, RG.COUNTY,STR.REGION,RG.TYPE, SR.DESCRIPTION AS SOURCE_DESCRIPTION, ST.DESCRIPTION_SOURCE, TP.DESCRIPTION_TYPE,
       SH.STATUSDATE
FROM AM_COMPLAIN2 COM
LEFT OUTER JOIN AM_CUSTOMERS2 CUS ON COM.CUSTOMERID = CUS.CUSTOMERID
LEFT OUTER JOIN AM_BROKERS2 BR ON BR.BROKERID = COM.BROKERID
LEFT OUTER JOIN AM_CATEGORY2 CAT ON CAT.ID = COM.COMPLAINID
LEFT OUTER JOIN AM_PRIORITY2 PR ON PR.ID = COM.COMPLAINPRIORITYID
LEFT OUTER JOIN AM_PRODUCT2 PD ON PD.PRODUCTID = COM.PRODUCTID
LEFT OUTER JOIN AM_REGION2 RG ON RG.ID = CUS.CUSTOMERID
LEFT OUTER JOIN AM_STATE_REGION2 STR ON STR.STATE_CODE = RG.STATE_CODE
LEFT OUTER JOIN AM_SOURCES2 SR ON SR.ID = COM.COMPLAINSOURCEID
LEFT OUTER JOIN AM_STATUS2 ST ON ST.ID = COM.COMPLAINSTATUSID
LEFT OUTER JOIN AM_TYPE2 TP ON TP.ID = COM.COMPLAINTYPEID
LEFT OUTER JOIN AM_STATUS_HISTORY2 SH ON SH.ID = ST.ID;

SELECT * FROM AM_COMPLAIN_MASTER_TABLE;



