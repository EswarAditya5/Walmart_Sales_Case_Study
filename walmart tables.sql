create database walmart;
use walmart;

-- create table 
CREATE TABLE walmart_sales (
    Store INT,
    Date VARCHAR(10),
    Holiday_Flag INT,
    CPI FLOAT,
    unemployment FLOAT,
    temperature FLOAT,
    fuel_price FLOAT,
    weekly_sales FLOAT
);

-- tells about information of the columns(i.e, datatype, null, column name, etc..)
desc walmart_sales;

-- retrive all the walmart_sales data
SELECT * FROM walmart_sales;

-- Before changing the column we need to import the data using "table data import wizard" 
-- (goto schema -> right click on usinf databse -> click on "table_data_import_wizard" -> give the file location -> click on next -> check the columns is allocated correctly or not 
--  (if not change them according to name) (if yes) -> click next -> click next -> click finish 

-- Step 1: Add a new column with the DATE data type
ALTER TABLE walmart_sales ADD COLUMN new_date_column DATE;

SET SQL_SAFE_UPDATES = 0;

-- Step 2: Update the new column with the converted values from the VARCHAR column
UPDATE walmart_sales SET new_date_column = STR_TO_DATE(Date, '%d-%m-%Y');

-- Step 3: Optionally, drop the original VARCHAR column
ALTER TABLE walmart_sales DROP COLUMN Date;

-- Step 4: Now change the new_date_column to Date
ALTER TABLE walmart_sales RENAME COLUMN new_date_column to Date;
