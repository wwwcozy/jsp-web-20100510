<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>

<div class="container">
<s2:navbar />
	제목 : <br>
	<input type="text" value="${board.title }" readonly>
	<br>
	본문 : <br>
	<textarea readonly>${board.body }</textarea>
	<br>
	작성자 : <br>
	<input type="text" value="${board.memberIdHidden }" readonly>
	<br>
	작성시간 : <br>
	<input type="text" value="${board.inserted }" readonly>
		
</div>

</body>
</html>