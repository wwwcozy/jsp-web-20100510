USE test;
SELECT * FROM Customers;

SELECT COUNT(*) FROM Customers;

SELECT Country, CustomerName
FROM Customers
GROUP BY Country;

SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country;

SELECT Country, COUNT(*) cnt
FROM Customers
GROUP BY Country
ORDER BY cnt DESC;

-- exercise1
SELECT Count(CustomerID), Country
FROM Customers
group by country;

-- exercise2
SELECT 
count(CustomerID), Country
FROM Customers
group by country
ORDER BY count(CustomerID) desc;