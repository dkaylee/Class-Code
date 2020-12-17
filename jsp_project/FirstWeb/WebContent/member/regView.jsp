
<%@ page import="form.RegData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 
 	RegData data = (RegData) request.getAttribute("memberInfo");
 
 %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원이 작성 데이터 출력</title>
</head>
<body>

	<h1>회원가입이 완료되었습니다.</h1>
	
	<h3>
		ID : <%=data.getId() %>, <br>
		PW : <%=data.getPw() %>, <br>
		Name : <%=data.getName() %>, <br>
		Photo : <%=data.getPhoto() %>
	</h3>

</body>
</html>