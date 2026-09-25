# Restaurant-Sales-Analysis
## Project Overview
This project analyses transactional sales data from a fictional hospitality business operating across two locations between May 2025 and September 2026.

The objective of the analysis is to understand the key drivers of revenue and profitability, identify trends in product performance, and uncover opportunities to improve business performance.

This projects follows and end-to-end data analysis workflow, using **Excel** for data cleaning and initial exploration, **MySQL** for data analysis and business-focused queries and finally **Tableau** to create an interactive dashboard for communicating the findings.

The analysis focuses on revenue trends, location performance, product and category performance, sales channels, customer behaviour, profitability and operational metrics.
## Business Objective
The business wants to understand what is driving revenue and profitability across the two locations. The analysis aims to identify areas of strong performance, potential operational issues and opportunities for growth.
  
  **- Key questions:**
  
    - How has revenue changed over time?
    - Which location generates the most revenue?
    - Which product generates the most revenue and are most profitable?
    - Which customer type generates the most value?
    - Does waiting time affect revenue?
    - Does weather affect sales?

## Tableau Dashboard
The final **Tableau** dashboard provides an interactive overview of revenue, profitability, product performance.
https://public.tableau.com/app/profile/jarold.moreno/viz/RestaurantRevenueDashboard_17900898010520/Dashboard1

## Key Findings
1. **Revenue performance over time:**

   Revenue shows seasonal variation, with stronger performance during the summer months and lower revenue during autumn-winter periods. This is an opportunity to align staffing, inventory and promotional activity given historical demand patterns.

3. **Which location generates the most revenue:**

    Norwich city centre generated £471k in revenue compared with £385k at Riverside location. However, the average revenue per order is almost identical. This suggests that the revenue difference is primarily driven by order volume rather than customer spend per order.

5. **Which products generate the most revenue/profit:**

   The major revenue generators include:
   - Seafood Paella: ~£129k
   - Black Rice: ~£125k
   - Chicken & Chorizo Paella: ~£113k
   - Vegetable Paella: ~£102k
  However, higher revenue does not necessarily mean higher profit margin. Paella dishes in this case generate more profit because of the sales volume but drinks have a much higher margin.

6. **Which customer type generates more value:**

   Returning customers generate the largest amount of revenue and profit. In this analysis returning customers account for ~48% of total revenue. Loyal customers has the highest average item revenue but the difference between the others is relatively small.
   
8. **Does waiting time affect revenue/custoemer experince:**

   There is a clear negative association between waiting time and customer rating. Longer waiting times are associated with lower customer ratings.
10. **Does weather affect sales:**
  
   Weather have a stronger relationship with order volume than average order value. Average revenue per order remained stable across weather conditions.
    
## Recommendations
1. Investigate footfall, channels and peak periods at the Riverside location.
2. Adjust staffing, stock and promotions according to seasonal trends.
3. Maintain availability of certain products and optimise food costs.
4. Use food-and-drink promotional strategies.
5. Develop loyalty and campaigns for customer re-visits.
6. Reduce orders exceeding 20-30 minutes to reduce negative reviews.

## Project Structure

restaurant-sales-analysis/

│

├── README.md

│

├── data/

│   └── restaurant_sales_may2025-september2026.csv

|   └── restaurant_sales_may2025-september2026_clean.csv

│

├── sql/

│   ├── 01_data_cleaning.sql

│   ├── 02_exploratory_analysis.sql

│   └── 03_business_questions.sql

│

├── tableau/

│   └── restaurant_sales_dashboard.twbx

