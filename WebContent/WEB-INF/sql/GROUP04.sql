USE test2;

SELECT * FROM Board
ORDER BY id DESC;

SELECT * FROM Board b JOIN Comment c ON c.boardId = b.id
ORDER BY b.id DESC; -- (교집합) 댓글이 없는 경우, 노출되지 않음

SELECT * FROM Board b LEFT JOIN Comment c ON c.boardId = b.id
ORDER BY b.id DESC; -- 댓글이 없어도 목록에 나오도록 하는 방법

SELECT b.*, count(c.id) FROM Board b LEFT JOIN Comment c ON c.boardId = b.id
GROUP BY b.id
ORDER BY b.id DESC; -- 