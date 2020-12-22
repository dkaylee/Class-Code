<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서정보 입력</title>
</head>
<body>


	<h1>추가할 부서정보를 입력해주세요.</h1>

	<form action="insert.jsp" method="get">
		부서번호: <input type="number" id="dNum" name="dNum"> <br>
		부서이름: <input type="text" id="dName" name="dName"> <br>
		부서위치: <input type="text" id="loc" name="loc"> <br>
		<input type="submit" value="입력">
	</form>
	
	
</body>
</html>