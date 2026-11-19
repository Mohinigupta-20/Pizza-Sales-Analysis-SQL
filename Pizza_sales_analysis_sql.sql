create database pizza_sales;
use pizza_sales;

drop table orders;

create table orders (
order_id int not null,
order_date datetime,
order_time time,
primary key (order_id));

select * from orders;

create table orders_details (
order_details_id int not null,
order_id int not null,
pizza_id varchar(100),
quantity int,
primary key (order_details_id));

select * from orders_details;

-- Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) AS Total_orders
FROM
    orders;
    

-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(pizzas.price * orders_details.quantity),
            2) AS Total_sales
FROM
    pizzas
         JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id;
    
   
-- Identify the highest-priced pizza.

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;


-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size, COUNT(orders_details.order_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY size
ORDER BY order_count DESC
LIMIT 1;


-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;


-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizza_types.category,
    SUM(orders_details.quantity) AS Quantity_ordered
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY SUM(orders_details.quantity) DESC; 


-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY order_count DESC;


-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    pizza_types.category, COUNT(name)
FROM
    pizza_types
GROUP BY category;


-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(quantity), 0) AS Avg_Pizzas_ordered_per_day
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS ordered_quantity;


-- Determine the top 3 most ordered pizza types based on revenue.


    SELECT 
    pizza_types.NAME,
    SUM(orders_details.quantity * PIZZAS.PRICE) AS REVENUE
FROM
    pizza_types
        JOIN
    PIZZAS ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.NAME
ORDER BY revenue DESC
LIMIT 3;


-- Calculate the percentage contribution of each pizza type to total revenue.
    
    SELECT 
    pizza_types.category,
    ROUND(SUM(orders_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(orders_details.quantity * pizzas.price),
                                2) AS total_sales
                FROM
                    orders_details
                        INNER JOIN
                    pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100,
            2) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY SUM(orders_details.quantity * pizzas.price) DESC;


-- Analyze the cumulative revenue generated over time.

select order_date , 
round(sum(revenue) over (order by order_date), 2) as cum_revenue
from
(select round(sum(orders_details.quantity * pizzas.price),2) as revenue , 
orders.order_date
from orders_details 
join orders
on orders_details.order_id = orders.order_id
join pizzas
on orders_details.pizza_id = pizzas.pizza_id
group by orders.order_date) as sales;


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

 select name,category, revenue from
(select category,name,revenue,
rank() over (partition by category order by revenue desc ) as rn
from
(SELECT 
    pizza_types.NAME,
    SUM(orders_details.quantity * pizzas.price) AS revenue , pizza_types.category
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.NAME , pizza_types.category) as a) as b 
where rn <=3;


