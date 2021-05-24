<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/CH16/lecture" %>
<!-- tagdir 위치 안에 있는 tag들은 my란 prefix를 붙여 사용 가능함 -->

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>

<!-- navbar란 커스텀 태그를 사용한 예 -->
<my:navbar />

<div class="container">
	<!-- #1. custom tag는 /WEB-INF/tags 폴더 또는 하위 폴더에 존재 -->
	<!-- tag1이란 커스텀 태그를 사용한 예 -->
	<my:tag1 />
	
	<hr>
	<!-- #2. tag는 한 번 만들어두면 언제든 재사용이 가능함 -->
	<my:tag1 />


</div>
</body>
</html>