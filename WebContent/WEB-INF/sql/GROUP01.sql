USE test;

SELECT * FROM Products;

-- min
SELECT min(Price) FROM Products;

-- max
SELECT max(Price) FROM Products;

-- count
SELECT count(*) FROM Products;

-- avg
SELECT avg(Price) FROM Products;

-- sum
SELECT sum(Price) FROM Products;

SELECT * FROM Products;

-- exercise1
SELECT MIN(Price) FROM Products;
-- exercise2
SELECT MAX(Price) FROM Products;
-- exercise3
SELECT * FROM Products WHERE Price;
SELECT COUNT(*) FROM Products WHERE Price = 18;
-- exercise4
SELECT AVG(Price) FROM Products;
-- exercise5
SELECT SUM(Price) FROM Products;