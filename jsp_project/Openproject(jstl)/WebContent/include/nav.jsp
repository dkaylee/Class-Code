<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""http://java.sun.com/jsp/jstl/core" %>
<nav>
		<%-- <ul><!-- /op --> 
			<li><a href="<%= request.getContextPath()%>">Home</a></li>
			<li><a href="<%= request.getContextPath()%>/member/memberRegForm.jsp">회원가입</a></li>
			<li><a href="<%= request.getContextPath()%>/member/loginForm.jsp">LOGIN</a></li>
			<li><a href="<%= request.getContextPath()%>/member/mypage/mypage1.jsp">mypage1</a></li>
			<li><a href="<%= request.getContextPath()%>/member/mypage/mypage2.jsp">mypage2</a></li>
			<li><a href="#">Home</a></li>
		</ul> --%>
		
		<ul><!-- /op -->   ->/op/
			<li> <a href="<c:url value="/"/>">HOME</a>  </li>
			<li> <a href="<c:url value="/member/memberRegForm.jsp"/>"/>회원가입</a>  </li>
			<li>
				<%
					if(session.getAttribute("loginInfo")==null){
				%>		
			 <a href="${pageContext.request.contextPath}/member/loginForm.jsp">LOGIN</a>  
			 <%
					} else {
			 %>
			 <a href="${pageContext.request.contextPath}/member/logout.jsp">LOGOUT</a>
			 <%
					}
			 %>			 
			 </li>
			<li> <a href="${pageContext.request.contextPath}/member/mypage/mypage1.jsp">mypage1</a>  </li>
			<li> <a href="${pageContext.request.contextPath}/member/mypage/mypage2.jsp">mypage2</a>  </li>
			<li> <a href="#">HOME</a>  </li>
		</ul>
	</nav>