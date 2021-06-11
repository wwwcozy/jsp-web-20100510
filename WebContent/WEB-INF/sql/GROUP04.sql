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


SELECT b.id boardId, 
	   b.title title, 
	   m.name name,
	   count(c.id) numberOfComment,
       b.inserted 
FROM Board b 
JOIN Member m 
ON b.memberId = m.id 
LEFT JOIN Comment c
ON b.id = c.boardId
GROUP BY b.id
ORDER BY boardId DESC;

SELECT m.*, count(b.id), count(c.id)
FROM Member m LEFT JOIN Board b ON m.id = b.memberId
LEFT JOIN Comment c ON m.id = c.memberId
WHERE m.id = 'sjk';

SELECT * FROM Board WHERE memberId= 'sjk';
SELECT * FROM Comment WHERE memberId= 'sjk';