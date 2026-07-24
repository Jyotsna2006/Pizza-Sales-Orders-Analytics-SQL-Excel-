# Pizza Sales & Orders Analytics (SQL & Excel)

An end-to-end data analysis project exploring pizza sales data to evaluate business performance, identify peak ordering patterns, analyze sales distributions across categories and sizes, and uncover key revenue drivers using **SQL Server** and **Microsoft Excel**.

---

## Project Access & Resources

*  **Live Interactive Excel Dashboard:** [View Live Report Here](https://1drv.ms/x/c/CA5C55EAF5C83190/IQCv41QqakqnQZf4g1Yj8AG8AamnvGC2Yt2Bi7cDAB_ECTY?e=lh2VAH)
*  **SQL Script**: [View Full SQL Queries](Pizza_Project.sql)
*  **Raw Dataset**: [Access Raw CSV Dataset](pizza_sales.csv)

  ---
## Dashboard Landing Page

![Pizza Sales Dashboard](Sales_Dashboard.png)

---
## Problem Statement

A high-volume pizzeria business requires clear insights into its operational efficiency, sales trends, and customer buying preferences. Key performance metrics were fragmented across raw transactional records containing over 49,000 individual pizza sales. 

This project solves these challenges by leveraging **SQL Queries** to execute data extraction and aggregations, paired with an **Interactive Excel Dashboard** utilizing Pivot Tables, Slicers, and visual charts for executive decision-making.

---
## Key Performance Indicators (KPIs) Analysis

To measure business performance, core metrics were computed in **SQL Server** and cross-verified against **Microsoft Excel** pivot tables.
| Metric | SQL Query | SSMS Output & Excel Validation |
| :--- | :--- | :--- |
| **Total Revenue** | `SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;` | **$817,860.05** |
| **Avg Order Value** | `SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;` | **$38.31** |
| **Total Pizzas Sold** | `SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;` | **49,574 units** |
| **Total Orders** | `SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;` | **21,350 orders** |
| **Avg Pizzas / Order** | `SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order FROM pizza_sales;` | **2.32 units** |

### Excel Baseline Verification
To verify data integrity across platforms, database calculations were checked against the Excel Pivot aggregation summary:

![KPI Summary Table](KPI.png)

---
