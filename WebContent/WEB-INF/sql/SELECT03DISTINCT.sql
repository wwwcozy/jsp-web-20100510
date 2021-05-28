SELECT City FROM Customers;

-- DISTINCT 중복 제외
SELECT DISTINCT City FROM Customers;

-- COUNT Function 레코드가 몇개인지 리턴해주는 함수
SELECT COUNT(*) FROM Customers;

SELECT COUNT(City) FROM Customers;

SELECT COUNT(DISTINCT City) FROM Customers;


SELECT DISTINCT Country FROM Customers;

SELECT Count(DISTINCT Country) FROM Customers;

SELECT DISTINCT City, Country FROM Customers;