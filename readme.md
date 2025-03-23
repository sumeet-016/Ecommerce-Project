## Ecommerce Sales Dashboard Project

## Project Overview

The Ecommerce Sales Dashboard is a comprehensive Power BI project designed to visualize key sales and customer insights for an ecommerce business. It leverages datasets including order details and transaction records to present actionable insights such as total sales, profits, sales by state, and customer preferences.

## Features of the Dashboard

1. KPIs (Key Performance Indicators)

Sum of Amount: Total revenue generated (438K).

Sum of Quantity: Total number of items sold (5615).

Sum of Profit: Overall profit (37K).

Sum of Average Order Value (AOV): Calculated value (121K).

2. Profit and Sales Analytics

Top 5 Profit by Sub-Category visualized by states.

Top 5 Profit by Product Sub-Category.

3. Category Insights

Payment preferences breakdown (COD, UPI, Debit, Credit, and EMI).

Quantity breakdown by category (Clothing, Electronics, Furniture).

4. Customer and Monthly Analysis

Total sales amounts by top customers.

Profit trends visualized month-wise.

## Datasets

The project uses two datasets:

1. Details.csv: Contains details of products and categories.

2. Orders.csv: Contains customer, order, and transactional data.

## Usage Instructions

1. Data Preparation

Load Details.csv and Orders.csv into Power BI.

Clean and preprocess data (e.g., handle null values).

2. Data Modeling

Establish relationships between Details.csv and Orders.csv.

Create calculated fields where necessary (e.g., Profit, AOV).

3. Visualization

Design charts and KPIs to represent key business insights.

Use slicers for State and Quarter filters.


## SQL Queries

The Solution.sql file contains queries used to:

1. Aggregate sales and profit data

2. Filter orders based on category and location

3. Calculate total revenue and most profitable products

## Insights

1. Maharashtra contributes the highest profit by state.

2. Printers and Bookcases are the top sub-categories driving profit.

3. COD is the most preferred payment method.

4. Clothing holds the highest share among categories (63%).

5. December has the highest monthly profit, while May records a loss.

6. Harivansh is the highest spending customer.

## Conclusion

This Ecommerce Sales Dashboard project provides essential business insights and is a powerful tool for decision-makers to understand performance and optimize business strategies.
