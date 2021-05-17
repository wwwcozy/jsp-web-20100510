<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="book1" scope="page" class="CH08.Book"></jsp:useBean>
<jsp:useBean id="book2" scope="request" class="CH08.Book"></jsp:useBean>
<jsp:useBean id="book3" scope="session" class="CH08.Book"></jsp:useBean>
<jsp:useBean id="book4" scope="application" class="CH08.Book"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h3>scope3.jsp</h3>
	책1 제목: <jsp:getProperty property="title" name="book1"/> <br>
	책2 제목: <jsp:getProperty property="title" name="book2"/> <br>
	책3 제목: <jsp:getProperty property="title" name="book3"/> <br>
	책4 제목: <jsp:getProperty property="title" name="book4"/> <br>
</div>
</body>
</html>