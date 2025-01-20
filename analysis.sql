--create the database
CREATE DATABASE hinoStore;


--use the database
USE hinoStore;


--create an schema for the tables and more
create schema operations;



--we import the csv file into a new table in the database
--show the table
SELECT * FROM operations.sales;



--Sum Of Total Sales Amount
SELECT
	SUM(totalSalesAmount) AS SumOfTotalSalesAmount
FROM
	operations.sales





--sales count by sales channel and percentage of total
DECLARE @totalCount FLOAT = (SELECT COUNT(*) FROM operations.sales)

SELECT @totalCount AS totalCountOfSales

SELECT
	salesChannel,
	COUNT(*) AS SalesCount,
	CAST((COUNT(*) / @totalCount * 100) AS DECIMAL(10,2)) AS PercentageOfTotal
FROM
	operations.sales
GROUP BY
	salesChannel






--total sales amount by type of product
SELECT
	typeOfProduct,
	SUM(totalSalesAmount) AS SumOfTotalSalesAmount
FROM
	operations.sales
GROUP BY
	typeOfProduct
ORDER BY
	SumOfTotalSalesAmount DESC






--analysis of the distinct values of the column month
SELECT
	DISTINCT month
FROM
	operations.sales


--setting the full name of months in the column month using a transaction
BEGIN TRAN

UPDATE
	operations.sales
SET
	month =
		CASE
			WHEN month = 'ene' THEN 'Enero'
			WHEN month = 'feb' THEN 'Febrero'
			WHEN month = 'mar' THEN 'Marzo'
			WHEN month = 'abr' THEN 'Abril'
			WHEN month = 'may' THEN 'Mayo'
			WHEN month = 'jun' THEN 'Junio'
			WHEN month = 'jul' THEN 'Julio'
			WHEN month = 'ago' THEN 'Agosto'
			WHEN month = 'sep' THEN 'Septiembre'
			WHEN month = 'oct' THEN 'Octubre'
			WHEN month = 'nov' THEN 'Noviembre'
			WHEN month = 'dic' THEN 'Diciembre'
		END

--check the full name of the months
SELECT
	DISTINCT month
FROM 
	operations.sales

SELECT * FROM operations.sales

COMMIT TRAN






--total sales amount by month
SELECT
	month,
	SUM(totalSalesAmount) AS SumOfTotalSalesAmount
FROM
	operations.sales
GROUP BY
	month
ORDER BY
	SumOfTotalSalesAmount DESC







--sum of total sales amount by sales channel and percentage of total
DECLARE @totalSum FLOAT = (SELECT SUM(totalSalesAmount) FROM operations.sales)

SELECT @totalSum AS SumOftotalSalesAmount

SELECT
	salesChannel,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount,
	CAST((SUM(totalSalesAmount) / @totalSum * 100) AS DECIMAL(10,2)) AS PercentageOfTotal,
	(100 - CAST((SUM(totalSalesAmount) / @totalSum * 100) AS DECIMAL(10,2))) AS RestOfPercentageTotal
FROM
	operations.sales
GROUP BY
	salesChannel
ORDER BY
	SumOftotalSalesAmount DESC





--sum of total sales amount by country
SELECT
	country,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount
FROM
	operations.sales
GROUP BY
	country
ORDER BY
	SumOftotalSalesAmount DESC
	






--the top 5 countries by sum of total sales amount
SELECT
	TOP 5 country,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount
FROM
	operations.sales
GROUP BY
	country
ORDER BY
	SumOftotalSalesAmount DESC





--the last 5 countries by sum of total sales amount
SELECT
	TOP 5 country,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount
FROM
	operations.sales
GROUP BY
	country
ORDER BY
	SumOftotalSalesAmount ASC







--sum of total sales amount
DECLARE @SumOftotalSalesAmount FLOAT = (SELECT SUM(totalSalesAmount) FROM operations.sales)

SELECT @SumOftotalSalesAmount AS SumOftotalSalesAmount






--sum of total cost amount
DECLARE @SumOftotalCostAmount FLOAT = (SELECT SUM(totalCostAmount) FROM operations.sales)

SELECT @SumOftotalCostAmount AS SumOftotalCostAmount







--sum of units by zone
SELECT
	zone,
	SUM(units) AS SumOfUnits
FROM
	operations.sales
GROUP BY
	zone
ORDER BY
	SumOfUnits DESC





--sum of total sales amount by year
SELECT
	year,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount
FROM
	operations.sales
GROUP BY
	year
ORDER BY
	SumOftotalSalesAmount DESC







--sum of total sales amount
DECLARE @SumOftotalSalesAmount FLOAT = (SELECT SUM(totalSalesAmount) FROM operations.sales)

SELECT @SumOftotalSalesAmount AS SumOftotalSalesAmount

--sum of total sales amount by zone
SELECT
	zone,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount,
	CAST((SUM(totalSalesAmount) / @SumOftotalSalesAmount * 100) AS DECIMAL(10,2)) AS PercentageOfTotal
FROM
	operations.sales
GROUP BY
	zone
ORDER BY
	SumOftotalSalesAmount DESC








--count of sales by priority
SELECT
	priority,
	COUNT(*) AS SalesCount
FROM
	operations.sales
GROUP BY
	priority






--sum of total sales amount by sales channel and type of product
SELECT
	salesChannel,
	typeOfProduct,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount
FROM
	operations.sales
GROUP BY
	salesChannel,
	typeOfProduct
ORDER BY
	salesChannel ASC,
	SumOftotalSalesAmount DESC






--sum of total sales amount by year and type of product
SELECT
	year,
	typeOfProduct,
	SUM(totalSalesAmount) AS SumOftotalSalesAmount
FROM
	operations.sales
GROUP BY
	year,
	typeOfProduct
ORDER BY
	year DESC,
	SumOftotalSalesAmount DESC
