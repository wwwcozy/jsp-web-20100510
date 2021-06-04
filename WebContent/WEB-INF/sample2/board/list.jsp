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
	
	<table class="table"> 
		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boards }" var="board" varStatus="status">
				<tr>
					<td>${board.id }</td>	
					<td>
						<a href="<%= request.getContextPath() %>/sample2/board/detail?id=${board.id}">
						${board.title }
						</a>
					</td>
					<td>${board.memberIdHidden }</td>
					<td>${board.timeAgo }</td>
	
				</tr>		
			</c:forEach>
		</tbody>
	
	</table>	
</div>
</body>
</html>