<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2"%>


<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<script>

$(document).ready(function(){



//하루에 한 번 팝업 설정 코드
function setCookie(name, value, expiredays){
    var today = new Date();
    today.setDate(today.getDate() + expiredays);
    document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
}

function getCookie(name) {
    var cookie = document.cookie;
    if (document.cookie != "") {
        var cookie_array = cookie.split("; ");
        for ( var index in cookie_array) {
            var cookie_name = cookie_array[index].split("=");
            if (cookie_name[0] == "mycookie") {
                return cookie_name[1];
            }
        }
    }
    return;
}
$("#modal-today-close").click(function() {
    $("#myModal").modal("hide");
    setCookie("mycookie", 'popupEnd', 1);
})

var checkCookie = getCookie("mycookie");

if(checkCookie == 'popupEnd') {
    $("#myModal").modal("hide");
} else {
    $('#myModal').modal("show");
}

});
</script>


<title>Insert title here</title>
</head>
<body>
	<s2:navbar />
	<s2:message></s2:message>
	<img src="${pageContext.request.contextPath }/res/img/hello.jpg"
		class="img-fluid">

<!-- Modal -->
<c:if test="${empty userLogined }">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title" id="myModalLabel">환영합니다.</h1>
	      </div>
	      <div class="modal-body">
	     	 <p class="text-muted">
	     	 기본 Servlet/JSP로 만든 회원, 게시판 어플리케이션입니다.
	     	 </p>
	     	 <hr class="my-4">
	     	 <p class="text-muted">
	     	 프로그래밍을 처음 배워서 만들어 본 게시판 입니다.<br>
	     	 회원가입부터 시작해보세요.
	     	 
	     	 </p>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-dark" 
	        onClick="location.href='<%=request.getContextPath()%>/sample2/member/login'">로그인</button>
	        <button type="button" class="btn btn-dark" 
	        onClick="location.href='<%=request.getContextPath()%>/sample2/member/signup'">회원가입</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="modal-today-close" >닫기1</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

</c:if>

<c:if test="${not empty userLogined }">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title" id="myModalLabel">환영합니다.</h1>
	      </div>
	      <div class="modal-body">
	     	 <p class="text-muted">
	     	 ${sessionScope.userLogined.id }님 반갑습니다.
	     	 </p>
	     	 <hr class="my-4">
	     	 <p class="text-muted">
	     	 www_cozy에 오신 걸 환영합니다.<br>
	     	 이곳은 기본 Servlet/JSP로 만든 어플리케이션입니다.<br>
	     	 기본적인 회원가입과 회원정보를 보실 수 있고,<br>
	     	 게시판에서 글과 댓글을 남기고 열람이 가능합니다.
	     	 </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-dark" 
	        onClick="location.href='<%=request.getContextPath()%>/sample2/board/list'">게시판</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>


</c:if>

<%-- 	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">환영합니다.</h1>
			<p class="lead">기본 Servlet/JSP로 만든 회원, 게시판 어플리케이션입니다.</p>
			<hr class="my-4">
			<p>프로그래밍을 처음 배워서 만들어 본 게시판 입니다. 회원가입부터 시작해보세요.</p>
			<a class="btn btn-primary btn-lg"
				href="<%=request.getContextPath()%>/sample2/member/signup"
				role="button">회원 가입</a>
		</div>
	</div> --%>
</body>
</html>