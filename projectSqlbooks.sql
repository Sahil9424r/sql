create database book;
use book;
select * from book;
-- 1
select Title from books where Genre='Fiction';
--  2
select Title from books where Published_year>1950;
-- 3  
select name from customers where Country='Canada';
-- 4
select * from orders where month(Order_date)='11' and year(Order_date)='2023';
-- 5
select sum(Stock) as total_stock from books;
-- 6
 select * from books order by Price desc limit 1;
 -- 7
 select * from Orders  where Quantity>1;
 -- 8
 select * from orders where Total_Amount>20;
 -- 9 
 select distinct Genre from books;
 -- 10
 select * from books order by Stock asc limit 1;
-- 11
-- ADVANCE QUERIES
select sum(Total_Amount) as Revenue from orders;
-- 1
select books.Genre,sum(orders.Quantity) as total_books_sold from books join orders on orders.Book_ID=books.Book_ID group by books.Genre;
-- 2
select avg(Price)   from books where Genre='Fantasy';
-- 3
select customers.Name  from customers join orders on customers.Customer_ID=orders.Customer_ID group by customers.Name having count(orders.Order_ID) >=2;
-- 4
select Book_ID,count(order_ID) as order_count from orders group by Book_ID order by order_count Desc limit 1 ;
-- 5
select Title,Price from books where Genre='Fantasy' order by Price Desc limit 3;
-- 6
select b.Author,sum(o.Quantity) as total_books_sold from books b join orders o on b.Book_ID=o.Book_ID group by b.Author;
-- 7
select distinct c.City from customers c join orders o on c.Customer_ID=o.Customer_ID  where o.Total_Amount>100;
-- 8
select c.Customer_ID,c.name, sum(o.Total_Amount) as total_spend from customers c join orders o on c.Customer_ID=o.Customer_ID group by c.Customer_ID,c.name order by total_spend desc limit 1;
-- 9
-- coalesce (condition1,condition2) so if null then condition2 runs else condition1 runs
select b.book_ID,b.title,b.stock,coalesce(o.quantity,0),sum(b.Stock)-coalesce(sum(o.Quantity),0) as Stock_remaining from books b left join orders o on b.book_ID=o.book_ID group by b.title,b.book_ID,b.stock,o.quantity;;



 
