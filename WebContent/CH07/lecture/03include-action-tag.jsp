<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>
<%-- 디렉티브 --%>

<title>Insert title name</title>
</head>
<body>
<div class="container">
	<h1>03 include</h1>
	
	<jsp:include page="04include-action-tag.jsp"></jsp:include>
	<%-- 태그 --%>
	
	<h1>03 include</h1>
	
</div>


</body>
</html>