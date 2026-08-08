# 📊 SuperStore Sales Analysis Dashboard

## 📌 Project Overview

This project presents an interactive **SuperStore Sales Analysis Dashboard** built using Microsoft Excel. The goal of the project is to analyze sales performance, profitability, customer behavior, product performance, category performance, and geographic sales performance through an interactive Business Intelligence dashboard.

The project demonstrates the complete data analysis workflow, including data preparation, data modeling, DAX measures, KPIs, PivotTables, PivotCharts, Slicers, and data visualization.

---

## 🎯 Business Objectives

The dashboard was designed to answer key business questions such as:

- What is the total sales and total profit?
- Which categories generate the highest sales and profit?
- How are sales changing over the years?
- Which customer segments contribute the most revenue?
- What are the top-selling products?
- Who are the top customers by sales?
- Which cities generate the highest sales and profit?
- What is the overall profit margin?
- How fast are sales growing year over year?

---

## 🛠️ Tools & Technologies

- Microsoft Excel
- Power Query
- Power Pivot
- DAX
- PivotTables
- PivotCharts
- Slicers
- Data Modeling
- Data Visualization

---

## 🗂️ Data Modeling

The project uses a **Star Schema** data model consisting of:

### Fact Table

**fact_sales**

Contains transactional sales information such as:

- Sales
- Quantity
- Discount
- Profit
- Profit Margin
- Customer Key
- Product Key
- Country ID
- Date Key

### Dimension Tables

**dim_customer**
- Customer ID
- Customer Name
- Segment

**dim_product**
- Product ID
- Product Name
- Category
- Sub-Category

**dim_country**
- Country
- City
- State
- Postal Code

**dim_date**
- Order Date
- Day
- Month
- Year
- Month Name
- Quarter
- Day Name

---

## 📐 DAX Measures

Several DAX measures were created to support the dashboard.

**Total Sales**
```DAX
Total Sales = SUM(fact_sales[Sales])
```

**Total Profit**
```DAX
Total Profit = SUM(fact_sales[Profit])
```

**Profit Margin %**
```DAX
Profit Margin % = DIVIDE(
    SUM(fact_sales[Profit]),
    SUM(fact_sales[Sales]),
    0
)
```

**Total Customers**
```DAX
Total Customers = DISTINCTCOUNT(dim_customer[Customer_ID])
```

**Average Sales per Customer**
```DAX
Average Sales per Customer = DIVIDE(
    [Total Sales],
    [Total Customers],
    0
)
```

**Sales Growth %**

Sales growth was calculated by comparing yearly sales with the previous year.

---

## 📊 Dashboard KPIs

The dashboard contains several KPI cards:

- 💰 Total Sales
- 💵 Total Profit
- 📈 Profit Margin
- 🚀 Sales Growth
- 👥 Total Customers
- 🛒 Average Sales per Customer

---

## 📈 Dashboard Visualizations

The dashboard includes the following charts:

1. **Sales & Profit by Category** — Compares sales and profit across different product categories.
2. **Yearly Sales & Profit** — Analyzes sales and profit trends over time.
3. **Sales by Segment & Category** — Shows how different customer segments perform across product categories.
4. **Top 10 Products by Sales** — Identifies the highest-performing products based on sales.
5. **Top 10 Customers by Sales** — Highlights the customers generating the highest revenue.
6. **Top 10 Cities by Sales & Profit** — Identifies cities with the strongest sales and profit performance.

---

## 🎛️ Interactive Dashboard

The dashboard includes interactive Slicers that allow users to filter the analysis dynamically.

Available filters include:

- Year
- Category
- Segment
- Sub-Category
- Geographic dimensions

The slicers are connected to the dashboard PivotTables and KPI calculations, allowing the entire dashboard to update interactively.

---

## 🔍 Key Business Insights

The analysis allows businesses to:

- Identify high-performing product categories.
- Monitor yearly sales growth.
- Evaluate profitability.
- Identify valuable customers.
- Discover top-selling products.
- Compare customer segments.
- Identify high-performing cities.
- Support data-driven business decisions.
