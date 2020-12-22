<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
	request.setCharacter 

	// data 받고 -> sql: insert -> insert_view
	String dNum = request.getParameter("dNum");
	String dName = request.getParameter("dName");
	String loc = request.getParameter("loc");
	
	PreparedStateMemt pstmt = conn.prepareStatement(sql_insert);
	
%>

<jsp:forward page="insert_view"/>