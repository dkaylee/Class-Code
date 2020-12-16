<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in Form Result</title>
</head>


<body>
	<h1>Log-in Form Result</h1>
	<hr>
	<table>
	<tr>
		<td>ID: </td>
		<td><%= request.getParameter("userId") %></td>
	</tr>
	<tr>
		<td>Password: </td>
		<td><%= request.getParameter("pw") %></td>
	</tr>
	</table>

</body>
</html>