<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

	request.setAttribute("now", new Date());

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fmt:timeZone value="Hongkong"> <!-- 전체 홍콩시간으로 바꿔줌 -->
	<br>
	${now} <!-- Wed Dec 23 11:08:50 KST 2020  -->
	<br>
	<!-- Dec 23, 2020  -->
	<fmt:formatDate value="${now}"/> 
	<br>
	<!-- Dec 23, 2020  -->
	<fmt:formatDate value="${now}" type="date"/> 
	<br>
	<!-- Wednesday, December 23, 2020 -->
	<fmt:formatDate value="${now}" type="date" dateStyle="full"/> 
	<br>
	<!-- 12/23/20 -->
	<fmt:formatDate value="${now}" type="date" dateStyle="short"/> 
	
	<br>
	<!-- 11:11:22 AM -->
	<fmt:formatDate value="${now}" type="time"/> 
	<br>
	<!-- 11:11:22 AM KST  -->
	<fmt:formatDate value="${now}" type="time" timeStyle="full"/> 
	<br>
	<!-- 11:11 AM -->
	<fmt:formatDate value="${now}" type="time" timeStyle="short"/> 
	<br>
	<!-- Dec 23, 2020 11:12:36 AM -->
	<fmt:formatDate value="${now}" type="both"/> 
	<br>
	<!-- Wednesday, December 23, 2020 11:13:31 AM KST -->
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> 
	
	<br>
	패턴 : 
	<!-- KST AM 11:14 -->
	<fmt:formatDate value="${now}" pattern="z a h:mm"/> 
	<br>
	<!-- 11:14 -->
	<fmt:formatDate value="${now}" pattern="hh:mm"/> 
	<br>
	<!-- 2020.12.23 11:16 -->
	<fmt:formatDate value="${now}" pattern="yyyy.MM.dd hh:mm"/> 
	
	<br>
	<!-- 2020.12.23 10:19 -->
	<fmt:formatDate value="${now}" pattern="yyyy.MM.dd hh:mm" timeZone="Hongkong"/> 
	</fmt:timeZone>
</body>
</html>