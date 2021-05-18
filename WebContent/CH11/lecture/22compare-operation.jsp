<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
pageContext.setAttribute("num1", 5);
pageContext.setAttribute("num2", 3);


%>



<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	\${num1 == num 2 } : ${num1 == num2 } <br>
	\${num1 != num 2 } : ${num1 != num2 } <br>
	\${num1 > num 2 } : ${num1 > num2 } <br>
	\${num1 < num 2 } : ${num1 < num2 } <br>
	\${num1 >= num 2 } : ${num1 >= num2 } <br>
	\${num1 <= num 2 } : ${num1 <= num2 } <br>
	
	<hr>
	
	\${num1 eq num 2 } : ${num1 eq num2 } <br>
	\${num1 ne num 2 } : ${num1 ne num2 } <br>
	\${num1 gt num 2 } : ${num1 gt num2 } <br>
	\${num1 lt num 2 } : ${num1 lt num2 } <br>
	\${num1 ge num 2 } : ${num1 ge num2 } <br>
	\${num1 le num 2 } : ${num1 le num2 } <br>
</div>
</body>
</html>