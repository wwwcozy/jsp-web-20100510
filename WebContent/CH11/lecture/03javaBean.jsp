<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>


<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="book1" class="CH08.Book" >
<jsp:setProperty name="book1" property="title" value="JAVA"/>
<jsp:setProperty name="book1" property="writer" value="kim"/>
</jsp:useBean>

<%
pageContext.setAttribute("title", "writer");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	book : ${book1 }<Br>
	title : ${book1.title }<br>
	writer: ${book1.writer }<br>
	<%-- none : ${book1.none }<br> --%>
	
	<hr>
	title : ${book1["title"] }<br>
	writer : ${book1["writer"] }<br>
	
	<hr>
	title : ${book1[title] }<br>
</div>
</body>
</html>