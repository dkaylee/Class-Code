<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- if 사용하기 -->
	<c:set var="msg" value="user1"/>
	msg : ${msg} <br>
	
	<c:if test="${msg=='user1'}" var="result">
		test 속성의 값이 true 일때 출력 : ${result}
	</c:if>
	
	<c:if test="${msg eq'user1'}" var="result1">
		test 속성의 값이 true 일때 출력 : ${result1}
	</c:if>
	
	<c:if test="${msg ne'user1'}" var="result2">
		test 속성의 값이 true 일때 출력 : ${result1}
	</c:if>
		${result2}
	<br>
	
	<!-- 여러가지 else if 대신 -->
	<c:set var="number" value="0"/>
	<c:choose>
		<c:when test="${ number > 0}">
			양수입니다.
		</c:when>
		<c:when test="${ number < 0 }">	
			음수입니다.
		</c:when>	
		<c:otherwise>
			0입니다.
		</c:otherwise>
	</c:choose>
	
	<br>
	
	<input type="checkbox" ${ msg 'user1' ? 'checked' : '' }>
	
	<br>
	
	<input type="checkbox" ${ cookie.uid ne null ? 'checked' : '' }>
	
	
	
</body>
</html>