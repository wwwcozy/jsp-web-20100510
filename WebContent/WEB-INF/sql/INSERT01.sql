SELECT * FROM Customers
ORDER BY CustomerID DESC;

INSERT INTO Customers -- 테이블네임
(CustomerID, CustomerName,
 ContactName, Address,
 City, PostalCode, Country) -- column
VALUES 
(200, 'Kim', 'Lee', 'Gangnam', 'Seoul', '00000', 'Korea'); -- 값

INSERT INTO Customers
VALUES
(150, 'Choi', 'Hong', 'Gangnam', 'Seoul', '00000', 'Korea');


INSERT INTO Customers
(CustomerID, CustomerName, ContactName)
VALUES
(101, 'Back', 'Seoul');

INSERT INTO Customers
(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Trump', 'Donald', 'NY', 'NY', '000', 'US');

--  테이블 설명 보기
DESC Customers;
DESC Employees;

SELECT * FROM Employees
ORDER BY EmployeeID DESC;

