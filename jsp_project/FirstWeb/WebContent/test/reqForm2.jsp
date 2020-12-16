<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>질문</h1>
	<hr>
	
	<form action="reqResult.jsp" method="get">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="userName" id="userName"></td>
		</tr>
		<tr>
			<td>국적</td>
			<td>
				<select name="country">
				<option value="한국">한국</option>
				<option value="미국">미국</option>
				<option value="중국">중국</option>
				<option value="일본">일본</option>
				</select>
			
			</td>
		</tr>
		<tr>
		<td>좋아하는 음식</td>
			<td>
				<input type="checkbox" name="food" value="불고기">불고기 <br>
				<input type="checkbox" name="food" value="치킨">치킨 <br>
				<input type="checkbox" name="food" value="갈비">갈비 <br>
				<input type="checkbox" name="food" value="김치">김치 
			</td>
			
		</tr>
		<tr>
			<td>
			<input type="submit" value="보내기"> <input type="reset" value="초기화">
			</td>
			<td>
			</td>
		</tr>
	</table>
	
</form>	

</body>
</html>