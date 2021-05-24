<%@ tag language="java" pageEncoding="UTF-8"%>

<!-- 태그 파일 내에서도 taglib 사용 가능하며, 경로 지정 필수 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- attribute 디렉티브를 이용해서 지정한 속성은
	태그 파일의 스크립트 요소나 EL에서 변수처럼 사용가능함  -->
<%@ attribute name="start" required="true" type="java.lang.Integer" %>
<%@ attribute name="end" required="true" type="java.lang.Integer" %>

<!-- attribute 디렉티브의 속성 -->
<!-- name : 속성의 이름, 태그 파일 내에서 스크립트나 EL 변수 이름으로 사용됨 -->
<!-- required : 필수 attribute 명시, true/false, 기본값은 false  -->
<!-- type : 속성값의 타입 명시, [ex] java.lang.Integer(래퍼 타입), 기본값은 String  -->


<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    
    <c:forEach begin="${start }" end="${end }" var="i">
    <li class="page-item"><a class="page-link" href="#">${i }</a></li>
   </c:forEach>
   
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>