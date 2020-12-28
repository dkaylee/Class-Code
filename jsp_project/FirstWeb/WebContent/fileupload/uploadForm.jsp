<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>

	<h1>파일 업로</h1>
	
	<!-- 
	method="post" enctype="multipart/form-data 반드시 넣기!  
	-->
	
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="title"><br>
		
		<!-- 업로드할 파일을 선택할 수 있는 input -->
		<input type="file" name="file"><br>
		<input type="submit">
	</form>


</body>
</html>