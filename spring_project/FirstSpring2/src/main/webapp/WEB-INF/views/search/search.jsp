<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>검색</h1>
	<h3>최근 관심 검색어:
	${searchTypeList}

	<c:forEach items="${queryList}" var="query">
		${query} ,	
	</c:forEach>
	</h3>
	
	<select>	
		<c:forEach items="${searchTypeList}" var="searchType">
			<option value="${searchType.value}">${searchType.label}</option>
		</c:forEach>
	</select>
	
	
	
	
</body>
</html>