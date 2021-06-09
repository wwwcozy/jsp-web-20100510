USE test;

CREATE TABLE Table05
(
name varchar(255) PRIMARY KEY,
money int NOT NULL DEFAULT 0
);

INSERT INTO Table05 (name, money) VALUES ('kim', 10000);
INSERT INTO Table05 (name, money) VALUES ('lee', 10000);

SELECT * FROM Table05;

-- 동시에 실행되는 상태, 하나만 실행 x
-- 여러 쿼리가 한 번에 반영되는 단어 : COMMIT 
UPDATE Table05
SET money = 5000
WHERE name = 'kim';

SELECT * FROM Table05;

-- 반영 전으로 원상복귀
ROLLBACK;

SELECT * FROM Table05;

-- 동시 실행

UPDATE Table05
SET money = 5000
WHERE name = 'kim';

UPDATE Table05
SET money = 15000
WHERE name = 'lee';
 
 COMMIT; -- 확정이므로 롤백 불가능해짐
 
 SELECT * FROM Table05;
 
 -- 트랜잭션 연습할떈 쿼리탭 - 오토커밋트랜잭션 체크 해제 후 진행하기