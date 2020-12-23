<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:set var="str1" value="Functions <tag>를 사용합니다."/>
	<c:set var="str2" value="사용"/>
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>
	
	length(str1) : ${fn:length(str1)}
	<br> toUpperCase(str1) = "${fn:toUpperCase(str1)}"
	<br> toLowerCase(str1) = "${fn:toLowerCase(str1)}"
	<br> substringAfter(str1, str2) = "${fn:substringAfter(str1,str2}"


</body>
</html>