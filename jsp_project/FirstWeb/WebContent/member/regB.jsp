<%@ page import="form.RegData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	//사용자가 입력한 데이터의 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 데이터를 받고 name에 맞춰야함
	String userId = request.getParameter("userId");
    String pw = request.getParameter("pw");
    String userName = request.getParameter("userName");
    String userPhoto = request.getParameter("userPhoto");
    
	// beans 생성
	RegData regData = new RegData();
	
	
	// beans에 데이터 바인딩
    regData.setId(userId);
    regData.setPw(pw);
    regData.setName(userName);
    regData.setPhoto(userPhoto);
    
 	// beans를 request 내장 객체의 속성에 저장 -> view 페이지에 데이터 공유(전달)
    request.setAttribute("memberInfo", regData);
 	
    
 %>
	// view 페이지로 forwarding
	<jsp:forward page="regView.jsp"/>
	
	
	
	