/*   KPI's Level Bussiness Queries   */

-- 1.Find the total revenue Means : The sum of the total price of all pizza orders ?
Select Sum(total_price) as total_revenue from PizzaSales

-- 2. Find the average order value Means : The Average amount spent per order, calculated by dividing the total revenue by the total number of orders ?
Select Sum(total_price)/count (distinct order_id) as average_order_value from PizzaSales;

-- 3. Find the total pizzas sold Means : The sum of quantity of all pizzas sold ?
Select Sum(quantity) as total_pizzas_sold from PizzaSales;

-- 4. Find the total orders Means : The total number of orders placed ?
Select count( distinct order_id) as total_orders from PizzaSales;

-- 5. Find the Averahe per order Means : The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders ?
Select Sum(quantity)/count(distinct order_id) as Average_per_order from PizzaSales;


/*   Chart's Level Bussiness Queries   */

-- 1.Daily Trends for total orders ?
Select DATENAME(DW, order_date) as order_day, count(distinct order_id) as total_orders from PizzaSales
Group by order_day;

-- 2. Hourly Trends for total orders ?
Select DATEPART(Hour, order_time) as order_hour, count(distinct order_id) as total_orders from PizzaSales
Group by order_hour
order by order_hour asc;

-- 3.Percentage of Sales by pizza category ?
Select pizza_category, Sum(total_price ) as total_revenue, Sum(total_price)*100/(Select Sum(total_price) from PizzaSales) as Percentages
from PizzaSales
Group by pizza_category;

-- 4. Percentage of Sales by Pizza size ?

Select pizza_size, Sum(total_price ) as total_revenue, Sum(total_price)*100/(Select Sum(total_price) from PizzaSales) as Percentages
from PizzaSales
Group by pizza_size;

-- 5.Total Pizza sold by pizza category

Select pizza_category, Sum(quantity) as total_pizzas_sold_by_category from PizzaSales
Group by pizza_category;


/*   Top & Worst Sales Level Bussiness Queries   */

-- 1.Top 5 best sallers by total pizza sold ?
Select Top 5 pizza_name, Sum(quantity) as total_pizzas_sold from PizzaSales
Group by pizza_name
order by total_pizzas_sold desc;

-- 2. Bottom 5 Worst sallers by total pizza sold ?
Select Top 5 pizza_name, Sum(quantity) as total_pizzas_sold from PizzaSales
Group by pizza_name
order by total_pizzas_sold asc;





