-- WHERE : row를 조건으로 필터
SELECT * 
FROM Customers 
WHERE Country="Mexico";

SELECT *
FROM Customers
WHERE CustomerId= 1;

SELECT * 
FROM Products
WHERE Price = 18;

SELECT *
FROM Products
WHERE Price > 30;

SELECT *
FROM Products
WHERE Price < 30;

SELECT *
FROM Products
WHERE Price >= 30;

SELECT *
FROM Products
WHERE Price <= 30;

SELECT * 
FROM Products
WHERE Price <> 18;

SELECT * 
FROM Products
WHERE Price != 18;

SELECT * 
FROM Products
WHERE Price BETWEEN 20 AND 66;

-- LIKE 텍스트의 일부가 같을 때  s로 시작하고 그 이후는 아무거나 (%) , 대소문자 구분 x
SELECT * 
FROM Customers
WHERE City LIKE 'n%';

SELECT * 
FROM Customers
WHERE City LIKE '%s';

SELECT * 
FROM Customers
WHERE City LIKE '%f%';

SELECT * 
FROM Customers
WHERE Country LIKE '%xi%';


SELECT * FROM Customers
WHERE City <> 'Berlin';

SELECT * FROM Customers
WHERE City != 'Berlin';

SELECT * 
FROM Customers
WHERE NOT City LIKE '%on';

-- IN
SELECT * 
FROM Customers
WHERE City IN ('Paris','London');

SELECT * 
FROM Customers
WHERE City IN ('Paris','London', 'Berlin');


-- AND
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';


-- OR
SELECT * FROM Customers
WHERE City='München' or City='Berlin';

SELECT * FROM Customers
WHERE Country = 'Germany' OR 
(CustomerName LIKE '%s%' AND City LIKE '%ch%');


SELECT * FROM Customers
WHERE Country='Germany' AND 
(City='Berlin' OR City='München');

SELECT * FROM Customers
WHERE NOT Country='Germany' 
AND NOT Country='USA';
