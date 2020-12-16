
<%@ page import="form.LoginData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    LoginData loginData = new LoginData();
  	

	//사용자로부터 데이터 받아오기
	String userId = request.getParameter("userId");
	String pw = request.getParameter("pw");
	
	//beans에 데이터 저장
	loginData.setId(userId);
	loginData.setPw(pw);

	
	//view.js로 beans객체 전달
	request.setAttribute("data", loginData);

%>  

 <jsp:forward page="loginView.jsp"/>