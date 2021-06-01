SELECT * FROM Customers
WHERE CustomerID = 1;

SELECT * FROM Employees
WHERE EmployeeID = 2;

UPDATE Customers
SET CustomerName = '스파이더맨'; -- 모든 customerName column 값이 변경됨

UPDATE Customers
SET CustomerName = '아이언맨'
WHERE CustomerID = 1;  
-- where : 업데이트가 필요한 레코드 지정
-- where절이 생략될 경우, 모든 테이블에 영향을 끼침 / 주의할 것

UPDATE Customers
SET CustomerName = 'thor',
	ContactName = 'odinson',
    Address = 'Asgard'
WHERE CustomerID = 1;
-- 여러 column 값을 수정해야 하는 경우 (,) 쉼표로 구분해서 작성한다
