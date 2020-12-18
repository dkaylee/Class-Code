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
	
	//12.18 session을 이용해서 로그인 처리
	//id, pw 비교해서 같으면 로그인 성공, 다르면 실패
	//로그인 여부 체크
	boolean loginChk = false;
	
	if(userId.equals(pw)){
		//로그인 처리
		
		// beans 생성
	    LoginData loginData = new LoginData();
		
		//beans에 데이터 저장
		loginData.setId(userId);
		loginData.setPw(pw);

		
		//view.jsp로 beans객체 전달
		request.setAttribute("login", loginData);
		
		//session 전달
		session.setAttribute("loginInfo", loginData);
		
		loginChk = true;
		
	} // login_view.jsp로 포워딩
	if(loginChk){
%>
	<jsp:forward page="loginView.jsp"/>
<%
	} else {
%>
	<script>
		alert("아이디 또는 비밀번호가 틀립니다. 다시 로그인해주세요.");
		history.go(-1);
	</script>
<%
	}
%>

