<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11form</title>
</head>
<body>
<%-- 검색창 만들기 --%>
<h1>form</h1>
<form action="">
<input name="q" type ="text"> <%-- q: query string --%>
<br>
<input name="age" type ="text">
<br>
<input type="submit" value="send">
</form>
<hr>
<p><%= request.getParameter("q") %> </p> <%-- q값 출력 --%>
<p><%= request.getParameter("age") %> </p>

</body>
</html>