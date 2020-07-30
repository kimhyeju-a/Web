<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=request.getContextPath() %>/list.do">게시판 </a><br>
	<a href="<%=request.getContextPath() %>/write.do">새글등록 </a><br>
	<c:choose>
		<c:when test="${ empty userVO }">
			<a href="<%=request.getContextPath() %>/login.do">로그인 </a><br>
		</c:when>
		<c:otherwise>
			<a href="<%=request.getContextPath() %>/logout.do">로그아웃 </a><br>
		</c:otherwise>
	</c:choose>
</body>
</html>