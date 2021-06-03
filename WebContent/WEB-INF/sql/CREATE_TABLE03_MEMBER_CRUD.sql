CREATE DATABASE study; -- 폴더 새로 만들기
USE test2; -- 사용할 폴더 지정

CREATE TABLE Member (
	id VARCHAR(255),
    password VARCHAR(255),
    name VARCHAR(255),
    birth DATE,
    inserted TIMESTAMP
    );

SELECT * FROM Member;