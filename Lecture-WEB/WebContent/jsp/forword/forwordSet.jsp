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
<%-- 	<%
		request.setAttribute("id", request.getParameter("id"));
	%> --%>
	<h2>결과화면</h2>
	<c:set var="id" value="${ param.id }" scope="request"/>
	<c:if test="${ param.id eq 'admin' }">
		<jsp:forward page="admin.jsp"/>
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<jsp:forward page="user.jsp">
			<jsp:param value="${ param.id }" name="id"/>
		</jsp:forward>
		<%-- <jsp:forward page="user.jsp"/> --%>
	</c:if>
</body>
</html>