/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */

select products.name as 'Product', categories.name as 'Category Name' from products inner join categories on products.categoryid = categories.categoryid where products.categoryid = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

select products.name as "Name", products.price as "Price", reviews.rating as "Rating" from  products inner join reviews on products.productid = reviews.ProductID where reviews.rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select employees.FirstName, employees.LastName from employees inner join sales group by sum(sales.Quantity) order by sales.Quantity;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

select categories.name as 'Category Name', departments.name as 'Department Name' from categories inner join departments on categories.departmentid = departments.departmentid where categories.name = 'Appliances' or categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */