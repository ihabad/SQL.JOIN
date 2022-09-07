/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.Name , c.Name
From product as p
inner join categories as c on c.CategoryID = p.CategoryID 
where c.Name="computer";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select  p.Name, p.Prices, p.rating
 from products as p
 inner join reviews as r
 on r.ProductID = p.ProductID
 WHERE r.rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

Select  E.FirstName, E.LastName, sum(S.Quantity) as total
from sales as s
inner join employees
as E on E.EmployeeID = S.EmployeeID
group by E.EmployeeID
ORDER BY total asc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select D.Name as "department Name",
C.Name as "Category Name" 
From departments as D 
inner join categories as C
on C.DepartmentID = D.DepartmentID
WHERE C.Name= "Appliances" 
or C.Name = "Games" ;

/* joins: find the product name, total # sold, and total price sold,PRIMARY
 for Eagles: Hotel California --You may need to use SUM() */
select P.Name, sum(S.Quantity) as "total units sold",
sum(s.Quantity * S.PricePerUnit) as "total price sold"
from products as P
inner join sales as S 
on p.ProductID = s.ProductID
WHERE Name like "%Eagles: Hotel California%";
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.Name , reviews.Rating, reviews.Comment
from products 
inner join reviews
on products.productID = reviews.ProductID
where products.ProductID =857
and reviews.rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select employees.EmployeeID, employees.EmployeeID, employees.LastName, products.Name,
SUM(sales.Quantity) AS "total units sales"
from employees
inner join sales on employees.EmployeeID = sales.EmployeeID
inner join products on sales.ProductID = products.ProductID
group by employees.EmployeeID, products.ProductID
order by employees.FirstName;