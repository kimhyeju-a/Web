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
	<c:if test="${ empty param.type }">
		type파라미터가 전송되지 않았습니다.
	</c:if>
	
	<c:if test="${ param.type == 'S' }">
		관리자님 환영합니다.
	</c:if>
	
	<c:if test="${ param.type == 'U' }">
		일반사용자님 환영합니다.
	</c:if>
</body>
</html>