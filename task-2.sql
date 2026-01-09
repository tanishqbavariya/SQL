create table customers (
    customer_id int primary key,
    customer_name varchar(100),
    city varchar(50),
    phone_number bigint,
    email varchar(100),
    registration_date date
);


create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    order_amount numeric(10,2),
    delivery_city varchar(50),
    payment_mode varchar(30)
);

create table products (
    productid int primary key,
    product_name varchar(100),
    category varchar(50),
    price numeric(10,2),
    stock_quantity int,
    supplier_name varchar(100),
    supplier_city varchar(50),
    supply_date date
);

create table order_items (
    order_item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    total_price numeric(10,2)
);

-----------------------------------------------------------------------------------------------------------------------

select customer_name, city, order_date from customers c 
join orders o on c.customer_id = o.customer_id where order_date between '2023-1-1' and '2023-12-31'

-----------------------------------------------------------------------------------------------------------------------

select product_name, category, total_price from products p 
join order_items oi on oi.product_id = p.productid
join orders o on o.order_id = oi.order_id
join customers c on c.customer_id = o.customer_id
where city = 'Mumbai'

-----------------------------------------------------------------------------------------------------------------------

select customer_name, order_date, total_price from customers c 
join orders o on c.customer_id = o.customer_id
join order_items oi on oi.order_id = o.order_id
where payment_mode = 'Credit Card'

-----------------------------------------------------------------------------------------------------------------------

select product_name, category, total_price from products p 
join order_items oi on oi.product_id = p.productid
join orders o on o.order_id = oi.order_id
where order_date between '2023-1-1' and '2023-6-30'

-----------------------------------------------------------------------------------------------------------------------

select customer_name, sum(quantity) total_product_ordered from customers c 
join orders o on o.customer_id = c.customer_id
join order_items oi on oi.order_id = o.order_id
group by c.customer_name

-----------------------------------------------------------------------------------------------------------------------

select distinct city from customers

-----------------------------------------------------------------------------------------------------------------------

select distinct supplier_name from products

-----------------------------------------------------------------------------------------------------------------------

select distinct payment_mode from orders

-----------------------------------------------------------------------------------------------------------------------

select distinct category from products

-----------------------------------------------------------------------------------------------------------------------

select distinct supplier_city from products

-----------------------------------------------------------------------------------------------------------------------

select customer_name from customers order by customer_name asc

-----------------------------------------------------------------------------------------------------------------------

select o.order_id, order_date, total_price from orders o
join order_items oi
on o.order_id = oi.order_id
order by oi.total_price desc

-----------------------------------------------------------------------------------------------------------------------

select product_name, category from products order by price asc, category desc

-----------------------------------------------------------------------------------------------------------------------

select order_id, customer_id, order_date from orders order by order_date desc

-----------------------------------------------------------------------------------------------------------------------

select delivery_city, count(order_id) total_number_of_orders from orders group by delivery_city
order by delivery_city asc

-----------------------------------------------------------------------------------------------------------------------

select * from customers order by customer_name limit 10

-----------------------------------------------------------------------------------------------------------------------

select product_name from products order by price desc limit 5

-----------------------------------------------------------------------------------------------------------------------

select * from orders order by customer_id offset 10 limit 10

-----------------------------------------------------------------------------------------------------------------------

select distinct delivery_city from orders offset 10 limit 10

-----------------------------------------------------------------------------------------------------------------------

select count(order_id) total_orders from orders

-----------------------------------------------------------------------------------------------------------------------

select distinct payment_mode, sum(order_amount) total_revenue from orders where payment_mode = 'UPI' group by payment_mode

-----------------------------------------------------------------------------------------------------------------------

select round(avg(price), 2) average_price from products

-----------------------------------------------------------------------------------------------------------------------

select max(total_price), min(total_price) from orders o join order_items oi on o.order_id = oi.order_id where order_date between '2023-1-1' and '2023-12-31'

select max(total_price), min(total_price) from orders o join order_items oi on o.order_id = oi.order_id where extract (year from order_date) = 2023

-----------------------------------------------------------------------------------------------------------------------

select product_id, count(quantity) total_quantity from order_items group by product_id

-----------------------------------------------------------------------------------------------------------------------

select c.customer_id, c.customer_name from customers c 
join orders o on o.customer_id = c.customer_id 
where extract (year from o.order_date) = 2022

intersect 

select c.customer_id, c.customer_name from customers c 
join orders o on o.customer_id = c.customer_id 
where extract (year from o.order_date) = 2023

-----------------------------------------------------------------------------------------------------------------------

select product_id, product_name from products p
join  order_items oi on p.productid = oi.product_id
join orders o on o.order_id = oi.order_id
where p.productid = oi.product_id and extract(year from order_date) = 2022

except

select product_id, product_name from products p
join  order_items oi on p.productid = oi.product_id
join orders o on o.order_id = oi.order_id
where p.productid = oi.product_id and extract(year from order_date) = 2023

-----------------------------------------------------------------------------------------------------------------------

select supplier_city from products

except

select city from customers

-----------------------------------------------------------------------------------------------------------------------

select supplier_city from products

union

select city from customers

-----------------------------------------------------------------------------------------------------------------------

select product_name from products where productid in (select product_id from order_items oi 
join orders o on oi.order_id = o.order_id 
where extract(year from order_date) = 2023

intersect

select productid from products)

-----------------------------------------------------------------------------------------------------------------------

select customer_name from customers c 
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
where total_price > (select avg(total_price) from order_items)

-----------------------------------------------------------------------------------------------------------------------

select productid, product_name from products p where (select count(*) from order_items oi where oi.product_id = p.productid) > 1

-----------------------------------------------------------------------------------------------------------------------

select product_name from products p where exists (select 1 from order_items oi
join orders o on oi.order_id = o.order_id 
join customers c on c.customer_id = o.customer_id 
where oi.product_id = p.productid and city = 'Pune')

-----------------------------------------------------------------------------------------------------------------------

select order_amount from orders where order_amount in (select order_amount from orders order by order_amount desc limit 3) order by order_amount desc

-----------------------------------------------------------------------------------------------------------------------

select customer_name from customers c where customer_id = any (select customer_id from orders o 
join order_items oi on oi.order_id = o.order_id 
join products p on p.productid = oi.product_id 
where c.customer_id = o.customer_id and price >=30000)

-----------------------------------------------------------------------------------------------------------------------










