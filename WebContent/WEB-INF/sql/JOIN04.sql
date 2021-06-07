USE test2;

-- 게시물을 작성하지 않은 member의 id와 name을 나열해 보시오.
SELECT *
FROM Board b RIGHT JOIN Member m
ON b.memberID = m.id
WHERE b.memberId IS NULL;

SELECT m.id, m.name
FROM Board b RIGHT JOIN Member m
ON b.memberID = m.id
WHERE b.memberId IS NULL;