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
	공유영역에 설정된 cnt값 출력<br>
	${ cnt }<br>
	<c:set var="cnt" value="${ cnt + 1 }" scope="request"/>
	cnt : ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
	
	request영역의 cnt 삭제 <br>
	<%-- <c:remove var="cnt" scope="request"/> --%>
	<c:remove var="cnt"/>
	cnt : ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
	
</body>
</html>


