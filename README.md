# Superstore Sales Analysis Project

## 1. Project Objective
The primary goal of this project is to analyze the 'Superstore' sales dataset to derive actionable insights. The analysis focuses on identifying key performance indicators (KPIs), understanding customer behavior, and evaluating sales performance across different product categories and geographical regions.

---

## 2. Tools & Technologies Used
* **SQL (SQLite):** For initial data exploration and querying.
* **Excel / Power Query:** For data cleaning and preparation.
* **Power BI:** For creating DAX measures and building the interactive multi-page report.

---

## 3. Project Workflow
1.  **Data Cleaning & Preparation:** The raw `Sales.csv` file was loaded into Power Query, where data types were corrected, duplicates were removed, and derived columns (e.g., `Processing_Days`) were created.
2.  **Data Exploration (SQL):** The clean data was loaded into an SQLite database. SQL queries were written to explore initial patterns, such as identifying top customers and highest-selling products.
3.  **Data Modeling & Visualization (Power BI):** The clean dataset was imported into Power BI. DAX measures were written to calculate key metrics. A 4-page interactive report was built to visualize the findings.

---

## 4. Power BI Report Screenshots

### Page 1: Executive Summary
*Provides a high-level overview of the business's overall performance.*
![Executive Summary](Screenshot-2025-10-18-162908.png)

### Page 2: Customer Analysis
*A deep dive into customer segments and identifying top customers.*
![Customer Analysis](Screenshot-2025-10-18-162925.png)

### Page 3: Product Analysis
*Analyzes sales performance across different product categories and sub-categories.*
![Product Analysis](Screenshot-2025-10-18-162942.png)

### Page 4: Geographic & Shipping Analysis
*Visualizes sales by state and analyzes the efficiency of different shipping modes.*
![Geographic Analysis](Screenshot-2025-10-18-162954.png)

---

## 5. Key Insights (Example)
* **Customer Behavior:** The 'Consumer' segment drives the highest number of orders, while the 'Corporate' segment has a higher average sale value.
* **Product Performance:** The 'Technology' category is the highest-grossing, while the 'Office Supplies' category has the highest volume of individual orders.
* **Operational Efficiency:** 'Standard Class' shipping is the most used method, but 'First Class' shows a significantly better average processing time.
