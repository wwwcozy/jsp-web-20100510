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
	<h1>${board.boardId }번째 글 보기</h1>
	<form id="form1" action="${pageContext.request.contextPath }/sample2/board/modify" method="post">

	제목 : <br>
	<input name="title" id="input1" type="text" value="${board.title }" readonly>
	<br>
	본문 : <br>
	<textarea name="body" id="textarea1" readonly>${board.body }</textarea>
	<br>
	작성자 : <br>
	<input type="text" value="${board.memberName }" readonly>
	<br>
	작성시간 : <br>
	<input type="text" value="${board.inserted }" readonly>
		
	<!-- 로그인 아이디가 작성한 글만 수정할 수 있는 버튼 -->
	<c:if test ="${sessionScope.userLogined.id == board.memberId }"> 
		<script>
			$(document).ready(function() {
				$("#button1").click(function () {
					$("#submit1, #submit2").removeAttr("hidden");
					$("#input1, #textarea1").removeAttr("readonly");
				});
				
				$("#submit2").click(function (e) {
					e.preventDefault(); // 아무일도 일어나지 않음
					
				
					 if (confirm("해당 글을 삭제 하시겠습니까?")) {
							var path = '${pageContext.request.contextPath }/sample2/board/remove';
							$("#form1").attr("action", path);
							$("#form1").submit();
					 } 
				});
				
			});
		
		</script>
		
		<input type="number" value="${board.boardId }" name="boardId" hidden>	
		<button id="button1" type="button">수정</button>
		<input id="submit1" hidden type="submit" value="전송">
		<input id="submit2" hidden type="submit" value="삭제">	
	</c:if>	
	</form>
	
	<s2:message />
</div>

</body>
</html>