/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name, c.Name
 FROM products AS p
JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 where c.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating
 FROM products AS p
 JOIN reviews AS r 
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(s.Quantity) AS 'Total Quantity'
FROM sales AS s
JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department Name', c.Name AS 'Category Name'
FROM categories AS c
JOIN departments AS d
ON c.DepartmentID = d.DepartmentID
WHERE c.name = 'Appliances' OR  c.name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.ProductID, p.Name, SUM(s.Quantity) AS 'Total Sold', (s.PricePerUnit * Sum(s.Quantity)) AS 'Total Price'
FROM sales AS s
LEFT JOIN products AS p 
ON s.ProductID = p.ProductID
WHERE p.Name = 'Eagles: Hotel California';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select p.Name, r.Reviewer, Min(r.Rating), r.Comment
FROM reviews AS r
JOIN products AS p
ON p.ProductID = r.ProductID
Where p.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity)
FROM employees AS e
LEFT JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY p.Name
ORDER BY e.EmployeeID;