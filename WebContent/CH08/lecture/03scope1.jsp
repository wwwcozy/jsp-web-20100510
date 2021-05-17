<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="CH08.*" %>


<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="book1" scope="page" class="CH08.Book"></jsp:useBean>
<jsp:setProperty name="book1" property="title" value="스프링" />

<jsp:useBean id="book2" scope="request" class="CH08.Book"></jsp:useBean>
<jsp:setProperty name="book2" property="title" value="웹" />

<jsp:useBean id="book3" scope="session" class="CH08.Book"></jsp:useBean>
<jsp:setProperty name="book3" property="title" value="JSP" />

<jsp:useBean id="book4" scope="application" class="CH08.Book"></jsp:useBean>
<jsp:setProperty name="book4" property="title" value="CSS" />

<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	책1 제목 : <jsp:getProperty property="title" name="book1"/><br>
	책2 제목 : <jsp:getProperty property="title" name="book2"/><br>

</div>

<jsp:include page="03scope2.jsp"></jsp:include>


</body>
</html>