<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03scriptlet.jsp</title>
</head>
<body>
<%
int sum = 0;

for (int i = 1; i <= 100; i++) {
sum += i;
}
%>

<p>1부터 100까지의 합은</p>

<%
//out.write(sum); -> 코드를 찍음
out.print(sum); //-> 계산 값을 보여줌
%>


</body>
</html>