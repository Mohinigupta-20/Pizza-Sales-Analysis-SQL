# Pizza-Sales-Analysis-SQL

SQL analysis of a year of pizza sales data: revenue, best sellers, peak hours and category trends.

## Project Overview
This project analyzes a year of sales data (1 January to 31 December 2015) from a pizza restaurant, using SQL to find insights on revenue, customer demand, product performance and operational trends. The goal is to turn raw transactional data into findings that help management improve the menu, pricing and daily operations.

## Summary
Across 21,350 orders and $817,860 in revenue, the data shows steady demand, Large pizzas and Chicken-category pizzas leading sales, and clear lunch and dinner peaks that can guide menu and staffing decisions.

## Key goals:
1. Understand overall sales performance
2. Identify top-performing pizzas and categories
3. Analyze ordering patterns by size, category and time
4. Measure revenue contribution across products
5. Support data-driven business decisions

## Dataset & Schema
1. pizzas: pizza_id, size, price, pizza_type_id
2. pizza_types: pizza_type_id, name, category, ingredients
3. orders: order_id, date, time
4. order_details: order_details_id, order_id, pizza_id, quantity
The tables are joined through primary–foreign key relationships (orders → order_details → pizzas → pizza_types) to build a complete view of every sale.

## Key Insights
🔹 Revenue & Orders:
1. 21,350 total orders were placed.
2. Total revenue generated: $817,860+
3. Revenue shows consistent accumulation over time, indicating stable demand.
   
🔹 Customer Behavior:
1. Large size pizzas are the most frequently ordered.
2. Peak ordering hours are during midday and evening, suggesting lunch and dinner rush periods.
   
🔹 Product Performance:
1. The highest priced pizza is The Greek Pizza ($35.95).
2. Top pizzas by revenue include: The Thai Chicken Pizza The Barbecue Chicken Pizza The California Chicken Pizza
3. Classic category contributes the largest share of total revenue (~27%), followed closely by Supreme, Chicken, and Veggie.

## Business Recommendations

### Menu optimization: Promote Thai Chicken, BBQ Chicken and California Chicken with combos or a “Best Sellers” section. Consider premium Classic variants. Review the lowest-earning pizzas.

### Size strategy: Bundle Large pizzas with drinks or sides to raise average order value. XL and XXL bring in under 2% of revenue, so review them.

### Staffing: Add staff at the lunch and dinner rushes and use quiet hours for prep or off-peak deals.

### Category marketing: Veggie and Chicken earn slightly less than Classic and Supreme, so targeted promotions could balance demand.

### Revenue growth and planning: Use cumulative trends and daily averages to forecast busy periods and plan inventory.

## What I Did in This Project: 
1. Imported four tables and joined them through their keys.
2. Answered 13 questions: 5 basic, 5 intermediate and 3 advanced.
3. Turned the results into insights and business recommendations.
4. Built a slide deck and wrote the documentation.

## Tools

- MySQL 
- Excel
- Canva

## Author
- Mohini Gupta 
- Email: mohinigupta2468@gmail.com
- [LinkedIn Profile] (https://www.linkedin.com/in/mohini-gupta2005/)
