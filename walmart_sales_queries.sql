-- show what are the tables are there in given dataset
show tables;

-- checking the data
select*from walmart_sales;

-- Find the summary of the data
desc walmart_sales;
-- Tells about attributes of the data

-- What is the total revenure or sales covered by this dataset
select sum(weekly_sales) as Total_revenue from walmart_sales;

-- Retrive the unique stores are there
select distinct(store) from walmart_sales;

-- Find how many unique stores are there
select count(distinct(store)) from walmart_sales;

-- Find unique dates from the data
select distinct(Date) from walmart_sales;

--How many unique dates are the from the data
select count(distinct(Date)) from walmart_sales;

-- show date as "yyyymmdd" from "ddmmyyyy" 
SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m-%d') AS Formatted_Date
FROM 
    Walmart_Sales;

-- Find the average sales from weekly_sales
select avg(weekly_sales) from walmart_sales;

-- Find the minimum sales from weekly_sales
select min(weekly_sales) from walmart_sales;

-- Find the maximum sales from weekly_sales
select max(weekly_sales) from walmart_sales;

-- Find the Total sales from weekly_sales
select sum(weekly_sales) from walmart_sales;

-- show the unique values values of holiday_flag
select distinct(Holiday_Flag) from walmart_sales;

-- Find how many unique vales are there in holiday_flag
select count(distinct(Holiday_Flag)) from walmart_sales;

-- Find unique temperatures from the temperature column
select distinct(temperature) from walmart_sales;

-- Find how many unique temperatures are there
select count(distinct(temperature)) from walmart_sales;

-- Find the average temperature 
select avg(temperature) from walmart_sales;

-- Find the minimum temperature
select min(temperature) from walmart_sales;

-- Find the maximum temperature
select max(temperature) from walmart_sales;

-- Find the unique fuel prices
select distinct(fuel_price) from walmart_sales;

-- Find how many unique fuel prices are there
select count(distinct(fuel_price)) from walmart_sales;

-- Find the average fuel price 
select avg(fuel_price) from walmart_sales;

-- Find the minimum fuel price
select min(fuel_price) from walmart_sales;

-- Find the Maximum fuel price
select max(fuel_price) from walmart_sales;

-- Find the total fuel price
select sum(fuel_price) as Total_fuel_price from walmart_sales;

-- Find the unique cpi values
select distinct(cpi) from walmart_sales;

-- Find how many unique cpi's are there
select count(distinct(cpi)) from walmart_sales;

-- Find the average cpi
select avg(cpi) from walmart_sales;

-- Find the minimum cpi
select min(cpi) from walmart_sales;

-- Find the maximum cpi
select max(cpi) from walmart_sales;

-- Find the total consumer price index (cpi)
select sum(cpi) as Total_consumer_price_index from walmart_sales;

-- Find the unique unemployment values
select distinct(unemployment) from walmart_sales;

-- Find how many unique unemployment values are there
select count(distinct(unemployment)) from walmart_sales;

-- Find the average unemployment
select avg(unemployment) from walmart_sales;

-- Find the minimum unemployment value
select min(unemployment) from walmart_sales;

-- Find the maximum unemployment value
select max(unemployment) from walmart_sales;

-- Find the total unemployment value
select sum(unemployment) as Total_consumer_price_index from walmart_sales;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Toughness level: Easy

-- Retrieve the total weekly sales for each store.
select store,round(sum(weekly_sales),2) from walmart_sales group by store;

-- Find the average temperature for each store.
select store,round(avg(weekly_sales),2) from walmart_sales group by store;

-- Calculate the total sales during holiday weeks.
select sum(weekly_sales)as total_sales from walmart_sales where holiday_flag=1;

-- Identify the week with the highest sales across all stores.
select Date,max(weekly_sales) from walmart_sales group by Date order by max(weekly_sales) desc limit 1;

-- Determine the store with the highest average weekly sales.
select store,avg(weekly_sales)as average_weekly_sales from walmart_sales group by store order by avg(weekly_sales) desc limit 1;

-- Find out the week with the lowest temperature and its corresponding sales.
select Date,min(temperature) as lowest_temperature,weekly_sales from walmart_sales group by Date,weekly_sales order by lowest_temperature asc limit 1;
# SELECT Date, Temperature, Weekly_Sales FROM Walmart_Sales WHERE Temperature = (SELECT MIN(Temperature) FROM Walmart_Sales);

-- Identify the store with the highest fuel price.
select store,fuel_price from walmart_sales where fuel_price = (select max(fuel_price) from walmart_sales);

-- Determine the average unemployment rate during holiday weeks.
select round(avg(unemployment),2) as average_unemployment_rate from walmart_sales where holiday_flag=1;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Toughness level: Medium

-- Determine the total sales for each store during holiday weeks, compared to non-holiday weeks.
select 
    Store,
    sum(case when holiday_flag = 1 then Weekly_Sales else 0 end) as Total_Sales_Holiday,
    sum(case when holiday_flag = 0 then Weekly_Sales else 0 end) as Total_Sales_Non_Holiday
from Walmart_Sales group by Store;

-- Calculate the average weekly sales for each month of the year.
select month(str_to_date(Date,'%d-%m-%Y')) as month,round(avg(weekly_sales),2) as Average_weekly_sales from walmart_sales group by month order by month asc;

-- Find the average weekly sales for each store during weeks when the CPI is above a certain threshold.
select store, avg(weekly_sales) from walmart_sales where cpi>200 group by store;

-- Identify the store with the highest weekly sales during weeks when unemployment rate is below a certain threshold.
select store,max(weekly_sales) as Highest_Weekly_Sales from walmart_sales where unemployment<200 and 
  Weekly_Sales = (select max(Weekly_Sales) from Walmart_Sales where Unemployment < 200) group by store;

-- Calculate the total sales for each store during holiday weeks, considering only weeks with a temperature below a certain threshold.
select store,sum(weekly_sales) as total_sales from walmart_sales where holiday_flag=1 and temperature < 20 group by store;

-- Find the week with the highest sales for each store, considering only weeks with above-average temperatures.
select date,store,sum(weekly_sales) from walmart_sales where temperature>(select avg(temperature) from walmart_sales) group by date,store; #not sure answer

