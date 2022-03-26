CREATE DATABASE UPSKILL; -- CREATING A DATABASE
USE UPSKILL; -- ENTERING THE DATABASE
CREATE TABLE MANUFACTURING(
INDUSTRY_ID INT,
ACTION_ID INT,
ACTION varchar(100),
INDUSTRY varchar(100),
QUARTER INT,
YEAR INT,
VALUE_IN_PERCENTAGE FLOAT
); -- CREATE A TABLE
-- THEN I IMPORTED DATA FROM A  CSV FILE
SHOW TABLES;
SELECT *
FROM manufacturing;
SELECT DISTINCT INDUSTRY_ID, INDUSTRY
FROM manufacturing;
create table INDUSTRY(
ID int,
NAME varchar(100)
);
INSERT INTO INDUSTRY(ID, NAME) 
SELECT DISTINCT INDUSTRY_ID, INDUSTRY
FROM manufacturing;
SELECT *
FROM INDUSTRY; -- ENTER DATA INTO THE TABLE
ALTER TABLE INDUSTRY
ADD PRIMARY KEY(ID);
CREATE TABLE ACTION(
ID INT,
NAME varchar(100)
);
SELECT DISTINCT ACTION_ID, ACTION
FROM manufacturing;
INSERT INTO ACTION(ID, NAME)
SELECT DISTINCT ACTION_ID, ACTION
FROM manufacturing;
SELECT *
FROM ACTION;
ALTER TABLE ACTION
ADD primary key(ID);
DELETE FROM INDUSTRY
WHERE ID = 300;
SELECT * FROM INDUSTRY;
DELETE FROM manufacturing 
WHERE INDUSTRY_ID = 300;
SELECT * FROM manufacturing;
SELECT INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE_IN_PERCENTAGE AS UTILISATION
FROM manufacturing
WHERE ACTION_ID = 10;
SELECT INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE_IN_PERCENTAGE
FROM manufacturing;
select count(*)
from manufacturing;
CREATE TABLE NUMBERS(
INDUSTRY_ID INT,
ACTION_ID INT,
QUARTER INT,
YEAR INT, 
VALUE_IN_PERCENTAGE FLOAT
);
ALTER TABLE NUMBERS
ADD foreign key(INDUSTRY_ID) references INDUSTRY(ID),
ADD foreign key(ACTION_ID) REFERENCES ACTION(ID);
SELECT * FROM NUMBERS;
INSERT INTO NUMBERS(INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE_IN_PERCENTAGE)
SELECT INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE_IN_PERCENTAGE
FROM manufacturing;
SELECT * FROM NUMBERS;
DROP TABLE MANUFACTURING;
SHOW TABLES;
SELECT * FROM NUMBERS;
select * FROM ACTION;
SELECT * FROM INDUSTRY;
DELETE FROM INDUSTRY
WHERE NAME LIKE '%division';
SELECT * FROM INDUSTRY
WHERE name LIKE '%division';
SELECT INDUSTRY_ID, INDUSTRY.NAME, ACTION_ID, ACTION.NAME,  QUARTER, YEAR, VALUE_IN_PERCENTAGE
FROM NUMBERS
LEFT JOIN  INDUSTRY
ON NUMBERS.INDUSTRY_ID = INDUSTRY.ID
LEFT JOIN ACTION
ON NUMBERS.ACTION_ID = ACTION.ID;
CREATE TABLE DATA(
INDUSTRY_ID INT,
INDUSTRY_NAME VARCHAR(100), 
ACTION_ID INT,
ACTION_NAME VARCHAR(100),
QUARTER INT,
YEAR INT,
VALUE FLOAT
);
INSERT INTO DATA(INDUSTRY_ID, INDUSTRY_NAME, ACTION_ID, ACTION_NAME, QUARTER, YEAR, VALUE)
SELECT INDUSTRY_ID, INDUSTRY.NAME, ACTION_ID, ACTION.NAME,  QUARTER, YEAR, VALUE_IN_PERCENTAGE
FROM NUMBERS
LEFT JOIN  INDUSTRY
ON NUMBERS.INDUSTRY_ID = INDUSTRY.ID
LEFT JOIN ACTION
ON NUMBERS.ACTION_ID = ACTION.ID;
SELECT *
FROM DATA;
DELETE FROM DATA
WHERE INDUSTRY_NAME LIKE '%division';
SELECT DISTINCT INDUSTRY_NAME
FROM DATA;
DROP TABLES INDUSTRY, NUMBERS, ACTION;
CREATE TABLE INDUSTRY(
ID  INT PRIMARY KEY,
NAME VARCHAR(100)
);
CREATE TABLE ACTION(
ID INT,
NAME VARCHAR(100)
);
CREATE TABLE NUMBERS(
INDUSTRY_ID INT,
ACTION_ID INT,
QUARTER  INT,
YEAR INT,
VALUE_IN_PERCENTAGES FLOAT
); -- CREATING A TABLE THAT CONTAINS TRANSACTIONS OF OCCURED FROM 2003 IN THE FOURTH QUARTER
DROP TABLE NUMBERS;
ALTER TABLE ACTION
ADD PRIMARY KEY (ID);
ALTER TABLE NUMBERS
ADD FOREIGN KEY (INDUSTRY_ID) REFERENCES INDUSTRY(ID),
ADD FOREIGN KEY (ACTION_ID) REFERENCES ACTION(ID);
SELECT DISTINCT INDUSTRY_ID, INDUSTRY_NAME
FROM DATA;
INSERT INTO INDUSTRY(ID, NAME)
SELECT DISTINCT INDUSTRY_ID, INDUSTRY_NAME
FROM DATA;
SELECT DISTINCT ACTION_ID, ACTION_NAME
FROM DATA;
INSERT INTO ACTION(ID, NAME)
SELECT DISTINCT ACTION_ID, ACTION_NAME
FROM DATA;
SELECT INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE
FROM DATA; 
SELECT * FROM NUMBERS;
INSERT INTO NUMBERS(INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE_IN_PERCENTAGES)
SELECT INDUSTRY_ID, ACTION_ID, QUARTER, YEAR, VALUE
FROM DATA; 
SELECT * FROM NUMBERS;
SELECT * FROM ACTION;
SELECT * FROM INDUSTRY;
DROP  TABLE DATA; -- DELETE THE DATA TABLE WITH UNNECESSARY DATA
SELECT INDUSTRY_ID, INDUSTRY.NAME, ACTION_ID, ACTION.NAME,  QUARTER, YEAR, VALUE_IN_PERCENTAGES
FROM NUMBERS
LEFT JOIN  INDUSTRY
ON NUMBERS.INDUSTRY_ID = INDUSTRY.ID
LEFT JOIN ACTION
ON NUMBERS.ACTION_ID = ACTION.ID; -- JOIN THE DATA THEN EXPORT IT TO A CSV FILE