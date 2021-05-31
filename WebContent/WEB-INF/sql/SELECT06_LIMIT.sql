SELECT * FROM Customers;

SELECT * FROM Customers
LIMIT 10;

SELECT * FROM Customers
LIMIT 5;

SELECT * FROM Customers
ORDER BY Country
LIMIT 10;

SELECT * FROM Customers
ORDER BY Country
LIMIT 10; -- 갯수만큼 상위 리스트를 뽑아냄

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 0, 10; -- LIMIT 값을 2개까지 받을 수 있음 (,) 쉼표로 구분함 (첫번째 페이지)

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 10, 10; -- 앞자리는 페이지 시작페이지, 뒷자리는 페이지 갯수 (두번째 페이지)

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 20, 10; -- (세번째 페이지)

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 30, 10; -- (네번째 페이지)