<%@ page import="util.CookieBox" %>
<%@ page import="form.LoginData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//사용자로부터 데이터 받아오기
	String userId = request.getParameter("userId");
	String pw = request.getParameter("pw");
	
	String chk = request.getParameter("chk");
	
	if(chk!=null && chk.equals("on") && userId != null && !userId.isEmpty()){
		// 쿠키 생성 저장
		// uid=userId
		response.addCookie(CookieBox.createCookie("uid", userId, "/", 60*60*24*365));
	}else {
		response.addCookie(CookieBox.createCookie("uid", userId, "/", 0));
	}
	
	
	// beans 생성
    LoginData loginData = new LoginData();
	
	//beans에 데이터 저장
	loginData.setId(userId);
	loginData.setPw(pw);

	
	//view.js로 beans객체 전달
	request.setAttribute("login", loginData);
%>  

 <jsp:forward page="loginView.jsp"/>
 
 