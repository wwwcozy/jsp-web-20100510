USE test;

CREATE TABLE Table01
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    bookId INT
); -- FOREIGN KEY (bookId) REFERENCES

CREATE TABLE Table02
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    bookName VARCHAR(255)
);

INSERT INTO Table01
(name, bookId)
VALUES ('kim', 1);

INSERT INTO Table01
(name, bookId)
VALUES ('lee', 2);

INSERT INTO Table01
(name, bookId)
VALUES ('choi', 3);

INSERT INTO Table01
(name, bookId)
VALUES ('park', 4);

INSERT INTO Table02
(bookName)
VALUES ('book1');

INSERT INTO Table02
(bookName)
VALUES ('book2');

INSERT INTO Table02
(bookName)
VALUES ('book3');

INSERT INTO Table02
(bookName)
VALUES ('book4');

SELECT * FROM Table01; -- 4개 record

SELECT * FROM Table02; -- 4개 record

SELECT * FROM Table01, Table02; -- 16개 record

-- join 
SELECT * FROM
Table01 JOIN Table02
ON Table01.bookId = Table02.id; -- ON + 조건 / bookId랑 id랑 같은 것만 추릴 것

-- alias 별칭으로 줄여서 사용할 때 사용 
SELECT * FROM
Table01 AS t1 JOIN Table02 AS t2
ON t1.bookId = t2.id;

SELECT * FROM
Table01 t1 JOIN Table02 t2 -- 더 생략하고 싶을 땐 AS 생략
ON t1.bookId = t2.id;

-- column
SELECT
t1.id AS id1, -- column 명도 as 키워드로 줄일 수 있음
t1.name AS name1,
t1.bookId AS bookId,
t2.id AS id2,
t2.bookName AS bname
FROM
Table01 t1 JOIN Table02 t2
ON t1.bookId = t2.id;

SELECT
t1.id id1, -- 테이블과 동일하게 as 생략 가능
t1.name name1,
t1.bookId bookId,
t2.id id2,
t2.bookName bname
FROM
Table01 t1 JOIN Table02 t2
ON t1.bookId = t2.id;