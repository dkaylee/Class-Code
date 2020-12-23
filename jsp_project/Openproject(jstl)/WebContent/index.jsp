<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/ccs/default.css" var="url_defaultCss"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link rel="styleSheet" href="${pageContext.request.contextPath}/css/default.css"> --%>
	
	<link rel="styleSheet" href="${url_defaultCss}"/>
	
<style>
</style>
</head>
<body >

	<%@ include file="/include/header.jsp"  %>
		
	<%@ include file="/include/nav.jsp"  %>
	
	<div class="contents">
		<h2 class="content_title">index</h2>
		<hr>
		<div class="content">
		인텍스 페이지 입니다.
		</div>
	</div>
	
	<%@ include file="/include/footer.jsp" %>


</body>
</html>
