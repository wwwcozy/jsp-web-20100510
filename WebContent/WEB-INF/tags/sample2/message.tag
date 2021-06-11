<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${not empty message }"  >
	<div class="alert alert-dark  alert-dismissable" role="alert">
	<a href="#" class="alert-link ">${message }</a>
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		
	</div>

	<c:remove var="message" />
</c:if> 