<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>응답</h1>
	<hr>
	
	<table>
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("userName") %></td>
		</tr>
		
		<tr>
			<td>국적</td>
			<td><%= request.getParameter("country") %></td>
		</tr>
		
		<tr>
			<td>좋아하는 음식</td>
			<td><%
				String[] foods = request.getParameterValues("food");
				
				for(int i=0; i<foods.length; i++){
					out.println(foods[i]+"<br>");
				}
			%></td>
		</tr>
		
	
	</table>
	
	
</body>
</html>