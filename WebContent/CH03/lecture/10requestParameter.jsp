<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10requestParameter</title>
</head>
<body>
<p>request parameter</p>
<%= request.getParameter("name") %>
<%= request.getParameter("age") %>
</body>
</html>