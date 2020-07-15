<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("cnt", 1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1값을 가지는 변수 cnt를 공유영역(page)에 설정<br>
	<c:set var="cnt" value="1" scope="page" />
	<%-- 교수님한테 --%>
	<c:set var="test" value="1" scope="request" />
	request : ${ pageScope.test } <br>
	
	
	
	
	공유영역에 설정된 cnt값 출력<br>
	${ cnt }<br>
	<c:set var="cnt" value="${ cnt + 1 }" scope="request"/>
	${ cnt }<br>
	${ requestScope.cnt }<br>
</body>
</html>


