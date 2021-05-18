<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
Map<String, String> map = new HashMap<>();
map.put("java", "spring");
map.put("css","bootstrap");
map.put("js","jquery");
map.put("python", "django");
map.put("h-t-m-l", "html");
map.put("hello world!", "hello world!" );


pageContext.setAttribute("map", map );
pageContext.setAttribute("python", "python" );
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	java : ${map.java } <br>
	css : ${map.css } <br>
	js : ${map["js"] }<br>
	python : ${map[python] }<br>
	
	<hr>
	h-t-m-l : ${map.h-t-m-l }<br>
	h-t-m-l : ${map["h-t-m-l"] }<br>
	<%-- 특수기호가 있는 경우 대괄호를 이용해서 작성해야 함 --%>
	<%-- hello world! : ${map.hello world! }<br> --%>
	hello world! : ${map["hello world!"] }<br>
</div>
</body>
</html>