create database SuperStore1 
use SuperStore1 ;

create table dim_country(
country_id int identity(1,1) primary key ,
country varchar(55) not null, city varchar(55) not null , [State] varchar(55) not null,
postal_code int not null
);

insert into dim_country(
country,
city,
[State],
postal_code
) 

select distinct 
Country,
City,
[State],
Postal_Code
from superstore_analysis;


SELECT * FROM dim_country;



create table dim_customer (
Customer_key int identity(1,1) primary key ,
Customer_ID varchar(55) not null,
Customer_Name varchar(55) not null,
Segment varchar(55) not null
);

insert into dim_customer (
Customer_ID,
Customer_Name,
Segment
)

select distinct
Customer_ID,
Customer_Name,
Segment
from superstore_analysis ;

select * from dim_customer


create table dim_date(
date_key int identity(1,1) primary key,
order_date date not null,
[day] int not null ,
[month] int not null ,
[year] int not null,
Month_Name NVARCHAR(20),
Quarter_Number INT,
Day_Name NVARCHAR(20)
)

insert into dim_date (
order_date,
[day] ,
[month] ,
[year] ,
Month_Name ,
Quarter_Number ,
Day_Name
)

select distinct 
cast (Order_Date as date) ,
day(Order_Date),
MONTH (Order_Date),
year (Order_Date),
DATENAME(MONTH, Order_Date),
DATEPART(QUARTER, Order_Date),
DATENAME(WEEKDAY, Order_Date)
FROM superstore_analysis;

select * from dim_date


create table dim_product(
product_key int identity(1,1) primary key,
Product_ID NVARCHAR(55) not null,
Category NVARCHAR(55) not null ,
Sub_Category NVARCHAR(55),
Product_Name NVARCHAR(255)
)

insert into dim_product(
Product_ID,
Category,
Sub_Category,
Product_Name
)

select distinct 
Product_ID,
Category,
Sub_Category,
Product_Name
from superstore_analysis;

select * from dim_product



create table fact_sales(
sales_key int identity(1,1) primary key,
Sales float not null,
Quantity float not null,
Discount float not null,
Profit float not null,
Profit_Margin float not null,
Customer_key int not null,
country_id int not null,
product_key int not null,
date_key int not null,

foreign key (Customer_key) references dim_customer(Customer_key),
foreign key (country_id) references dim_country(country_id),
foreign key (product_key) references dim_product(product_key),
foreign key (date_key) references dim_date(date_key),
);

select * from fact_sales;

UPDATE superstore_analysis
SET Profit = 0
WHERE Profit IS NULL;


insert into  fact_sales (
Sales,
Quantity,
Discount,
Profit,
Profit_Margin,
Customer_key,
country_id,
product_key,
date_key
)

select distinct
S.Sales,
S.Quantity,
S.Discount,
S.Profit,
S.Profit_Margin,
U.Customer_key,
C.country_id,
P.product_key,
D.date_key

from superstore_analysis S 

JOIN dim_country C
ON S.Country=C.Country
AND S.City=C.City
AND S.[State]=C.[State]
AND S.Postal_Code=C.Postal_Code

JOIN dim_customer U
ON S.Customer_ID=U.Customer_ID
AND S.Customer_Name=U.Customer_Name
AND S.Segment=U.Segment

join dim_product P
on S.Product_ID =P.Product_ID
AND S.Category = P.Category
AND S.Sub_Category =P.Sub_Category
AND S.Product_Name = P.Product_Name

JOIN dim_date D
ON CAST(S.Order_Date AS DATE) = D.Order_Date

SELECT * FROM fact_sales


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'superstore_analysis';
