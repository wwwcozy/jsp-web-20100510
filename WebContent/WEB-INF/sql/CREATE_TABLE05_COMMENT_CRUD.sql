USE test2;

DROP TABLE Comment; -- 테이블 잘못 생성했을 시 삭제
DROP TABLE IF EXISTS Comment;  -- 테이블있으면 삭제

CREATE TABLE Comment -- 댓글 테이블생성 코드
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	comment varchar(2047) NOT NULL,
    memberId VARCHAR(255) NOT NULL,
    boardId INT NOT NULL,
    inserted TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (memberId) REFERENCES Member(id),
    FOREIGN KEY (boardId) REFERENCES Board(id)
);

SELECT * FROM Comment;