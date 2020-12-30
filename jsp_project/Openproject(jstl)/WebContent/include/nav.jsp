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
			<li> <a href="<c:url value="/member/memberRegForm.jsp"/>">회원가입</a>  </li>
			<li>
				<%
					if(session.getAttribute("loginInfo")==null){
				%>		
			 <a href="<c:url value="/member/loginForm.jsp"/>">LOGIN</a>  
			 <%
					} else {
			 %>
			 <a href="<c:url value="/member/logout.jsp"/>">LOGOUT</a>
			 <%
					}
			 %>			 
			 </li>
			<li> <a href="<c:url value="/member/mypage/mypage1.jsp"/>">mypage1</a>  </li>
			<li> <a href="<c:url value="/member/mypage/mypage2.jsp"/>">mypage2</a>  </li>
			<li> <a href="<c:url value="/member/manager/memberList_view.jsp"/>">회원정보</a>  </li>
			<li> <a href="<c:url value="#"/>">방명록</a>  </li>
			
		</ul>
		
	</nav>