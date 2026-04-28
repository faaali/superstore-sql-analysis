--  Calculate overall sales, average order value, and total profit:

select 
	count(DISTINCT order_id) AS total_orders, 
    ROUND(SUM(sales), 2) AS total_sales, 
    ROUND(SUM(profit), 2) AS total_propfit, 
    ROUND(AVG(sales), 2) AS avg_order_value
 FROM superstore_sales;   


-- Evaluate performance across product categories

SELECT 
	category, 
    ROUND(SUM(sales), 2) AS total_sales, 
    ROUND(SUM(profit), 2) AS total_profit, 
    SUM(quantity) AS total_quantity
    
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;


-- Identify highest-value customers absed on spending 

SELECT 
	customer_name, 
    ROUND(SUM(sales), 2) AS total_spent, 
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;  


-- identify highest-value customers based on spending 

SELECT 
	customer_name,
    ROUND(SUM(sales), 2) as total_spent, 
    COUNT(DISTINCT order_id) as total_orders
 FROM superstore_sales
 GROUP BY customer_name
 ORDER BY total_spent DESC
 LIMIT 10;



-- Convert string to date, then analyze monthly trends
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM superstore_sales
GROUP BY month
ORDER BY month;


-- Compare performance across regions
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(sales), 2) AS avg_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;


-- Segment transactions into pricing tiers
SELECT 
    CASE 
        WHEN sales < 100 THEN 'Low Value'
        WHEN sales BETWEEN 100 AND 500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS sale_category,
    
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS avg_sales
    
FROM superstore_sales
GROUP BY sale_category
ORDER BY total_sales DESC;



-- Analyze profit margins by category and sub-category
SELECT 
    category,
    `sub-category`,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 2) AS profit_margin
FROM superstore_sales
GROUP BY category, `sub-category`
ORDER BY profit_margin DESC;









