SELECT * FROM Customers -- * 모든 column을 가리킴
WHERE CustomerID = 1;

SELECT CustomerName FROM Customers
WHERE CustomerID = 1;

SELECT CustomerName, City
FROM Customers
WHERE CustomerID = 1;

SELECT CustomerID, CustomerName, City
FROM Customers
WHERE CustomerID = 2;

SELECT CustomerID
FROM Customers;

SELECT * FROM Employees
WHERE EmployeeID = 1;

SELECT DISTINCT City FROM Customers
ORDER BY City; -- order by 정렬 

SELECT CustomerName, City FROM Customers
WHERE CustomerID = 5;

SELECT EmployeeID, LastName, FirstName
FROM Employees 
WHERE EmployeeID;

SELECT EmployeeID, LastName, FirstName
FROM Employees; -- 여러명을 지정할 땐 where절 생략