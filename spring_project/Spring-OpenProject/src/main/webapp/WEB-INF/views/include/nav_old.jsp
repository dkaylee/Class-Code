<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
		<%-- <ul><!-- /op --> 
			<li><a href="<%= request.getContextPath()%>">Home</a></li>
			<li><a href="<%= request.getContextPath()%>/member/memberRegForm.jsp">회원가입</a></li>
			<li><a href="<%= request.getContextPath()%>/member/loginForm.jsp">LOGIN</a></li>
			<li><a href="<%= request.getContextPath()%>/member/mypage/mypage1.jsp">mypage1</a></li>
			<li><a href="<%= request.getContextPath()%>/member/mypage/mypage2.jsp">mypage2</a></li>
			<li><a href="#">Home</a></li>
		</ul> --%>
		
		<ul><!--        /op --> 
			<li> <a href="<c:url value="/"/>">HOME</a>  </li>
			<li> <a href="<c:url value="/member/reg"/>">회원가입</a>  </li>
			<li>
				<%
					if(session.getAttribute("loginInfo")==null){
				%>		
			 <a href="<c:url value="/member/login"/>">LOGIN</a>  
			 <%
					} else {
			 %>
			 <a href="<c:url value="/member/logout"/>">LOGOUT</a>
			 <%
					}
			 %>			 
			 </li>
			<li> <a href="<c:url value="/mypage/mypage1"/>">mypage1</a>  </li>
			<li> <a href="<c:url value="/mypage/mypage2"/>">mypage2</a>  </li>
			<li> <a href="<c:url value="/mypage/mypage3"/>">mypage3</a>  </li>
			
			<li> <a href="<c:url value="/member/list"/>">회원정보</a></li>
			<li> <a href="#">방명록</a></li>
			
		</ul>
		
	</nav>