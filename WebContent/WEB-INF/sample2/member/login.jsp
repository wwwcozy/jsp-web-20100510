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
<s2:navbar />
<s2:message />

<div class="container">

	<div class="row justify-content-center">
	
		<div class="col-3">
		
			<h1 align="center">로그인</h1>
				<form method="post" action="${pageContext.request.contextPath }/sample2/member/login">
					<div class="form-group">
						<label for="input1">아이디</label>
						<input class="form-control" type="text" name="id" id="input1">
					</div>
					
					<div class="form-group">
						<label for="input2">패스워드</label>
						<input class="form-control" type="password" name="password" id="input2">
					</div>
					
					<button type="submit" class="btn btn-dark"><i class="fas fa-sign-in-alt"></i>  로그인</button>
					<button type="button" class="btn btn-dark" 
	        		onClick="location.href='<%=request.getContextPath()%>/sample2/member/signup'">
	        		<i class="fas fa-user-plus"></i>  회원가입</button>
				</form>
		</div>
	</div>
	
</div>


	
<%-- 	
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath }/sample2/member/login">
		id <br>
		<input type="text" name="id"> <br>
		
		pW <br>
		<input type="password" name="password"> <br>
		<input type="submit" value="로그인">
	</form>
	 --%>
	
<%-- 	<c:if test="${not empty message }">
		<div>
			${message }
		
		</div>
	</c:if> --%>	
	
	
</body>
</html>