<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
	header>h1{
		text-align: center;
	}
	
	header{
		padding: 5px;
	}

	nav>ul {		
		overflow : hidden;	
		list-style: none;
		border-bottom: 1px solid #DDD;
		
	}
	
	nav>ul>li {
		float: left;
		padding : 5px 40px;		
	}

</style>

</head>


<header>
<h1 id="logo">DKAY WORLD</h1>
</header>
<body>
<nav>
<ul>
	<li>
	<c:url value="/hello" var="hello"/>
	<a href="${home}">Home</a>
	</li>
	
	<li>
	<c:url value="/members/join" var="join"/>
	<a href="${join}">Join</a>
	</li>
	
	<li>
	<c:url value="/members/login" var="login"/>
	<a href="${login}">Login</a>
	</li>
	
	<li>
	<c:url value="/members/logout" var="logout"/>
	<a href="${logout}">Logout</a>
	</li>
	<li>
	<c:url value="/members/mypage" var="mypage"/>
	<a href="${mypage}">Mypage</a>
	</li>
	<li>
	<c:url value="/orders/order" var="order"/>
	<a href="${order}">Order</a>
	</li>
	<li>
	<c:url value="/guestbook/guestBook" var="guestBook"/>
	<a href="${guestBook}">Guestbook</a>
	</li>
	
</ul>
</nav>

</body>
</html>

