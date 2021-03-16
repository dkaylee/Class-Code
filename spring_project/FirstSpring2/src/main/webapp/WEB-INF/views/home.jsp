<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/css/default.css" var="url_defaultCss" scope="application" />
<html>
<head>
	<title>Home</title>
	<%-- <link rel="styleSheet" href="${url_defaultCss}"> --%>
	<style>
	
	</style>
	
	
</head>
<body>
	<h1>Open Project</h1>
	
	<nav>
	<ul> 
		<li>
			<c:url value="/hello" var="hello"/>
			<a href="${hello}">Greeting</a>
		</li>
		<li>
			<c:url value="/member/login" var="login"/>
			<a href="${login}">로그인</a>
		</li>
		<li>
			<c:url value="/member/search" var="membersearch"/>
			<a href="${membersearch}">검색</a>
		</li>
		<li>
			<c:url value="/order/order" var="order"/>
			<a href="${order}">주문</a>
		</li>
		<li>
			<c:url value="/cookie/make" var="cookieMake"/>
			<a href="${cookieMake}">${cookieMake}</a>
		</li>
		<li>
			<c:url value="/cookie/view" var="cookieView"/>
			<a href="${cookieView}">쿠키</a>
		</li>
		<li>
			<c:url value="/header/header" var="header_url"/>
			<a href="${header_url}">${header_url}</a>
		</li>
		<li>
			<c:url value="/search/search" var="search"/>
			<a href="${search}">${search}</a>
		</li>
		<li>
			<c:url value="/upload/uploadForm" var="fileupload"/>
			<a href="${fileupload}">${fileupload}</a>
		</li>
	</ul>
	</nav>
	


</body>
</html>