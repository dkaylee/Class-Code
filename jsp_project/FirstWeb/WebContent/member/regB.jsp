<%@ page import="form.RegData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    
    RegData regData = new RegData();
    
    String userId = request.getParameter("userId");
    String pw = request.getParameter("pw");
    String userName = request.getParameter("userName");
    String userPhoto = request.getParameter("userPhoto");
    
    regData.setId(userId);
    regData.setPw(pw);
    regData.setName(userName);
    regData.setPhoto(userPhoto);
    
    request.setAttribute("data", regData);
    
 %>
 
 <jsp:forward page="regView.jsp"/>