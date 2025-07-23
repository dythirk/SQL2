/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */

SELECT 
    products.name AS 'Product',
    categories.name AS 'Category Name'
FROM
    products
        INNER JOIN
    categories ON products.categoryid = categories.categoryid
WHERE
    products.categoryid = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT 
    products.name AS 'Name',
    products.price AS 'Price',
    reviews.rating AS 'Rating'
FROM
    products
        INNER JOIN
    reviews ON products.productid = reviews.ProductID
WHERE
    reviews.rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT 
    employees.FirstName,
    employees.LastName,
    SUM(sales.Quantity) AS Total
FROM
    employees
        INNER JOIN
    sales ON employees.employeeid = sales.employeeid
GROUP BY employees.employeeid
HAVING Total = (SELECT 
        SUM(sales.quantity) AS Total
    FROM
        sales
    GROUP BY sales.employeeid
    ORDER BY Total DESC
    LIMIT 1);


/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT 
    categories.name AS 'Category Name',
    departments.name AS 'Department Name'
FROM
    categories
        INNER JOIN
    departments ON categories.departmentid = departments.departmentid
WHERE
    categories.name = 'Appliances'
        OR categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT 
    products.name,
    SUM(sales.quantity * products.price) AS 'Total $ Sold',
    SUM(sales.quantity) AS 'Quantity Sold'
FROM
    products
        INNER JOIN
    sales ON products.productid = sales.productid
WHERE
    products.name = 'Eagles: Hotel California';
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT 
    products.name,
    reviews.reviewer,
    reviews.rating,
    reviews.comment
FROM
    products
        INNER JOIN
    reviews ON products.productid = reviews.productid
WHERE
    products.name = 'Visio TV'
ORDER BY reviews.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */


SELECT 
    employees.employeeid,
    employees.firstname,
    employees.lastname,
    products.name,
    sales.quantity
FROM
    employees
        INNER JOIN
    sales ON employees.employeeid = sales.employeeid
        INNER JOIN
    products ON sales.productid = products.productid
ORDER BY employees.employeeid;