<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request RegForm Result</title>
</head>
<body>

	<h1>회원가입이 완료되었습니다.</h1>
	<hr>
	
	<table>
		<tr>
			<td>아이디(이메일): </td>
			<td><%= request.getParameter("userId") %> </td>
		</tr>
		<tr>
			<td>비밀번호: </td>
			<td><%= request.getParameter("pw") %></td>
		</tr>
		<tr>
			<td>이름:  </td>
			<td><%= request.getParameter("userName") %></td>
		</tr>
		<tr>
			<td>사진:  </td>
			<td><%= request.getParameter("userPhoto") %></td>
		</tr>
	</table>


</body>
</html>