SELECT * FROM Customers
ORDER BY Country; -- 정렬하고자 하는 column 지정 

SELECT * FROM Customers
ORDER BY Country ASC; -- ASC 기본값 오름차순

SELECT * FROM Customers
ORDER BY Country DESC; -- DESC 내림차순

SELECT * FROM Customers
ORDER BY Country, City; -- 복수 column 작성시 (,) 쉼표로 정렬 순서 지정 가능 