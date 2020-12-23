<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="styleSheet" href="${pageContext.request.contextPath}/css/default.css">

<style>
</style>




</head>


<body>

	<%@ include file="/include/header.jsp" %>
	
	<%@ include file="/include/nav.jsp" %>
	
	<div class= "contens">
		<h2 class= "content_title">회원 가입 Form </h2>
		<hr>
		<div class = "content">
		<form action="memberReg.jsp" method="post">
        <table>
            <tr>
                <th><label for="userId">아이디(email)</label></th>
                <td>
                    <input type="email" id="userId" name="userId">
                </td>
            </tr>
            <tr>
                <th><label for="pw">비밀번호</label></th>
                <td>
                    <input type="password" id="pw" name="pw"> 
                </td>
            </tr>
            <tr>
                <th><label for="userName">이름</label></th>
                <td>
                    <input type="text" id="userName" name="userName">
                </td>
            </tr>
            <tr>
                <th><label for="userPhoto">사진</label></th>
                <td>
                    <input type="file" id="userPhoto" name="userPhoto">
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <input type="submit" value="회원가입">
                </td>
            </tr>
        </table>
    </form>
		</div>
		<hr>
	</div>
	
	
	<%@ include file="/include/footer.jsp" %>
	
	


</body>
</html>