 -- Q11 Calculate the percentage contribution of each pizza type to total revenue.
 
 select pizza_types.category,
 (sum(order_details.quantity *pizzas.price)/ (SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_Sale
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id) ) *100 as revenue
 from pizza_types join pizzas 
 on pizza_types.pizza_type_id = pizzas.pizza_type_id
 join order_details
 on order_details.pizza_id = pizzas.pizza_id
 group by category
 order by revenue desc;