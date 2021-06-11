<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<nav class="navbar navbar-expand-lg navbar-light bg-light">

  <a class="navbar-brand" href="#">
    <i class="fab fa-java"></i>
  </a>
  
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/main"><i class="fas fa-chess-queen"></i> COZY
        <span class="sr-only">(current)</span></a>
      </li>
      
		<c:if test="${empty sessionScope.userLogined }" > <!-- 로그아웃 상태 -->
			      <li class="nav-item">
			        <a class="nav-link" href="https://www-cozy.tistory.com/">TISTORY</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="https://blog.naver.com/wwwcozy">BLOG</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="https://www.instagram.com/www_cozy/">INSTA</a>
			      </li>
		      
  		 <li class="nav-item dropdown">
      		  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        	  메뉴
     		   </a>
	       	  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	       	  	  <a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/board/list">게시판</a>
	       	  	  <div class="dropdown-divider"></div>
	       	  	  <a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/member/login">로그인</a>
	       	  	  <a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/member/signup">회원가입</a>

	       	  </div>
  	 	</c:if>
   		
 
   		
   

 			<c:if test="${not empty sessionScope.userLogined }" > <!-- 로그인 되어 있을 때 -->
 			<li class="nav-item dropdown">
       		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         member
	        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		           <a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/member/info">회원정보</a>
		           <a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/member/list">회원목록</a>
		        <div class="dropdown-divider"></div> <!-- 드롭 다운내 줄선 추가 -->
		          <a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/member/logout">로그아웃</a>
			    </div>
	     	</li>
      
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          board
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        	<a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/board/list">게시판</a>
		          <div class="dropdown-divider"></div> <!-- 드롭 다운내 줄선 추가 -->
					<a class="dropdown-item" href="<%= request.getContextPath() %>/sample2/board/write">글쓰기</a>
		        </div>
		     </li>
	      
			</c:if>
	
	
      
    </ul>
    
    <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="게시글 검색" aria-label="Search">
    <button class="btn btn-outline-secondary" type="submit">검색</button>
  </form>
  </div>
  
 
</nav>



<%--     
 ★★★★★★★★최종본★★★★★★★    
 <nav class="navbar navbar-expand-lg navbar-light bg-light">

  <a class="navbar-brand" href="#">
    <i class="fab fa-java"></i>
  </a>
  
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/main"><i class="fas fa-home"></i>COZY
        <span class="sr-only">(current)</span></a>
      </li>
      
 	   <c:if test="${empty sessionScope.userLogined }" > 로그인 안되어 있을 때
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/signup">회원가입</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/login">로그인</a>
	      </li>
      </c:if>
 
 
      <c:if test="${not empty sessionScope.userLogined }" > 로그인 되어 있을 때

	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/info">정보보기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/logout">로그아웃</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/board/write">글쓰기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/list">회원목록보기</a>
	      </li>  
		</c:if>
		
		      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/board/list">글목록보기</a>
      </li>
    </ul>
    
    <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="게시글 검색" aria-label="Search">
    <button class="btn btn-outline-secondary" type="submit">검색</button>
  </form>
  </div>
  
 
</nav>
		
		
		 --%>

<%-- 초안 2
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/main"><i class="fas fa-home"></i>HOME <span class="sr-only">(current)</span></a>
      </li>
      <c:if test="${empty sessionScope.userLogined }" > 로그인 안되어 있을 때
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/signup"><i class="fas fa-user-plus"></i>회원가입</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/login"><i class="fas fa-sign-in-alt"></i>로그인</a>
	      </li>
      </c:if>
      
      <c:if test="${not empty sessionScope.userLogined }" > 로그인 되어 있을 때
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/info"><i class="fas fa-info"></i>정보보기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/logout"><i class="fas fa-sign-out-alt"></i>로그아웃</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/board/write"><i class="fas fa-pencil-alt"></i>글쓰기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/member/list"><i class="fas fa-users"></i>회원목록보기</a>
	      </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>/sample2/board/list"><i class="fas fa-list-ol"></i>글목록보기</a>
      </li>
    </ul>
  </div> 
  --%>




<%-- 초안 1
<div>
		<a href="<%= request.getContextPath() %>/sample2/member/main">메인</a>
		|
		<a href="<%= request.getContextPath() %>/sample2/member/signup">회원가입</a>
		|
		<!--  로그인X -->
	<c:if test="${empty sessionScope.userLogined }"> 
		<a href="<%= request.getContextPath() %>/sample2/member/login">로그인</a>
	</c:if>
	
		<!--  로그인O -->
	<c:if test="${not empty userLogined }">
		<a href="<%= request.getContextPath() %>/sample2/member/info">정보보기</a>
		|
		<a href="<%= request.getContextPath() %>/sample2/member/logout">로그아웃</a>
		|
		<a href="<%= request.getContextPath() %>/sample2/board/write">글쓰기</a>
		|
		<a href="<%= request.getContextPath() %>/sample2/member/list">회원 목록보기</a>
	</c:if>
		|
		<a href="<%= request.getContextPath() %>/sample2/board/list">글 목록보기</a>

</div> --%>

