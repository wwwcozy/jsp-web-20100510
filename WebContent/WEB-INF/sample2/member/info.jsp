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
	$(document).ready(function() {
		$("#button1").click(function() {
			$("#input2, #input3, #input4").removeAttr("readonly");
			$("#submit1").removeAttr("hidden");
		});
		
		$("#submit2").click(function(e) {
			e.preventDefault();
			console.log("submit2 clicked.....");
			
			var con = confirm("탈퇴 하시겠습니까??");
			
			console.log(con);
			
			if (con) {
				$("#form2").submit();
			}
		});
		
		
	});
</script>

</head>
<body>
<s2:navbar></s2:navbar>
<div class="container">
	
	<div class="row justify-content-center">
	<div class="col-6">
		<s2:message />
		<h1 align="center">회원정보</h1>
		
	<form id="form1" action="${pageContext.request.contextPath }/sample2/member/modify" method="post">

		
		<div class="form-group">
			<label for="input1">아이디</label>
			<input class="form-control" type="text" name="id" id="input1" value="${member.id }" readonly>
		</div>
	
		<div class="form-group">
			<label for="input2">패스워드</label>
			<input class="form-control" type="password" name="password" id="input2" value="${member.password}" readonly>
		</div>
		
		<div class="form-group">
			<label for="input3">이름</label>
			<input class="form-control" type="text" name="name" id="input3" value="${member.name}" readonly>
		</div>
		
		<div class="form-group">
			<label for="input4">생년월일</label>
			<input class="form-control" type="date" name="birth" id="input4" value="${member.birth}" readonly>
		</div>

		<hr class="my-4">
		
		<div class="form-group">
			<label>작성한 게시물</label>
			<input class="form-control" type="text" value="${member.numberOfBoard}개" readonly>
		</div>
		
		<div class="form-group">
			<label>작성한 댓글</label>
			<input class="form-control" type="text" value="${member.numberOfComment}개" readonly>
		</div>
		
		<hr class="my-4">
		
		<button id="button1" type="button" class="btn btn-dark" >회원정보 수정</button>
		<input type="submit" id="submit1" value="전송"  class="btn btn-dark" hidden>
	</form>
	
	
		</div>
	</div>	

</div>

<br>
<div class="container">
<div class="row justify-content-center">
	<div class="col-6">
	<form id="form2" action="${pageContext.request.contextPath}/sample2/member/remove" method="post">
		<input id="submit2" type="submit" value="회원탈퇴" class="btn btn-light">
	</form>
	</div>
	</div>
</div>



<%-- 
	<form id="form1" action="${pageContext.request.contextPath }/sample2/member/modify" method="post">
		아이디 <br>
		<input id="input1" type="text" name="id" value="${member.id }" readonly> <br>
		패스워드 <br>
		<input id="input2" type="password" name="password" value="${member.password }" readonly> <br>
		이름 <br>	
		<input id="input3" type="text" name="name" value="${member.name }" readonly> <br>
		생년월일 <br>
		<input id="input4" type="date" name="birth" value="${member.birth }" readonly> <br>
		<hr class="my-4">
		작성한 게시물<br>
		<input type="text" value="${member.numberOfBoard }개" readonly> <br>
		작성한 댓글<br>
		<input type="text" value="${member.numberOfComment }개" readonly> <br>
		<hr class="my-4">
		
		<button id="button1" type="button" class="btn btn-dark" >회원정보 수정</button>
		<input type="submit" id="submit1" value="전송" hidden class="btn btn-dark">
	</form>

 --%>

<%-- 
<div class="container">
작성한 게시물 : <span>${member.numberOfBoard }</span>개
<br>
작성한 댓글 : <span>${member.numberOfComment }</span>개
</div>
 --%>

</body>
</html>





