<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
<script>
var url = "${pageContext.request.contextPath}" + "/sample2/member/checkdup";

$(document).ready(function() {
	$("#button1").click(function() {
		var id = $("#input1").val();
		
		$.post(url, {id: id}, function(data) {
			if (data == 'ok') {
				// 가입 가능 메세지
				// console.log("ok");
				$("#span1").text("사용 가능");
			} else {
				// 가입 불가능 메세지
				// console.log("not ok");
				$("#span1").text("사용 불가능");
			}
		});
	});
});
</script>

</head>
<body>
<s2:navbar></s2:navbar>

<div class="container">
	<div class="row"></div>
	<div class="row justify-content-center" >	
	<div class="col  " style="border:1px solid #ccc;">

	<h1 align="center">회원 가입</h1>
	<form action="${pageContext.request.contextPath }/sample2/member/signup" method="post">
		
		<div class="form-group">
			<label for="input1">아이디</label>
			<div class="input-group mb-3">
			<input id="input1" class="form-control" name="id" type="text">
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button" id="button1">중복확인</button>
			  </div>
			</div>
			<span class="form-text text-muted" id="span1"></span>
		</div>
		
		<div class="form-group">
			<label for="input2">패스워드</label>
			<input id="input2" type="password" name="password" class="form-control">
		</div>
		
		<div class="form-group">
			<label for="input3">이름</label>
			<input id="input3" class="form-control" type="text" name="name">
		</div>
		
		<div class="form-group">
			<label for="input4">생일</label>
			<input id="input4" class="form-control" type="date" name="birth">
		</div>
		
		<div align="center">
		<button class="btn btn-dark" type="submit"><i class="fas fa-user-plus"></i>  가입</button>
		<button class="btn btn-dark" type="reset"><i class="fas fa-redo"></i>  리셋</button>
		</div>
		
	</form>
</div>


<%-- <div class="container">
	<form action="${pageContext.request.contextPath }/sample2/member/signup" method="post">
		id : <br>
		<input type="text" name="id" id="input1" >
		<button id="button1" type="button">중복확인</button>
		<span id="span1"></span>
		 <br>
		pw : <br>
		<input type="password" name="password"> <br>
		name : <br>	
		<input type="text" name="name"> <br>
		birth day: <br>
		<input type="date" name="birth"> <br>
		
		<input type="submit" value="가입">
	</form> --%>
	
<%-- 	<c:if test="${not empty message }">
	<div>
		${message }
	</div>
	</c:if> --%>
	</div>
	</div>
<s2:message />	

</body>
</html>








