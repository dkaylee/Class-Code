<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 정보 출력</title>
</head>
<body>
<%
	if(result>0){
		out.println(<h1>데이터가 등록되었습니다</h1>);
	}

%>

	<h1>입력한 부서정보를 출력합니다.</h1>
	
	<table>
		<tr>
		<td>부서번호</td>
		<td><%=  %></td>
		</tr>
	</table>


</body>
</html>