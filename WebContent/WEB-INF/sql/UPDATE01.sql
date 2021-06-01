SELECT * FROM Customers;

UPDATE Customers
SET CustomerName = '스파이더맨'; -- 모든 customerName이 변경됨

UPDATE Customers
SET CustomerName = '아이언맨'
WHERE CustomerID = 1;  -- where절이 생략되면 모든 절에 영향을 끼침 / 주의할 것

UPDATE Customers
SET CustomerName = 'thor',
	ContactName = 'odinson',
    Address = 'Asgard'
WHERE CustomerID = 1;

