<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="CH07.page" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>

<%
page p = new page(3, 10);
request.setAttribute("page", p);

Object o = request.getAttribute("page");
//System.out.println(o == p);

page p2 = (page) o;

int s = p2.getStart();
int e = p2.getEnd();

System.out.println(s);
System.out.println(e);

%>

<div class="container">
	<jsp:include page="07request-attribute-sub.jsp"></jsp:include>
</div>
</body>
</html>






