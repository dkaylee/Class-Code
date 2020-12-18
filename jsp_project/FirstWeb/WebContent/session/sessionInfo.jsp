<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Date time = new Date();

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>세션정</h1>
	<h3>
		세션ID : <%= session.getId() %> <br>
		세션 생성 시간 : <%= session.getCreationTime() %>, <%= format.format(session.getCreationTime()) %>><br>
		세션 생성 시간 : <%= session.getLastAccessedTime() %>, <%= format.format(session.getLastAccessedTime()) %>><br>
	</h3>


</body>
</html>