<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] names = {"홍길동", "윤길동", "박길동","이길동" };
	
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("namesLength", names.length-1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${ names }" var="name">
		${ name }
	</c:forEach>
	<br>

<%-- 	<c:forEach begin="0" end="${ namesLength }" var="i">
		${ names[i] }<br>
	</c:forEach> --%>
<%-- 	
	<c:forEach begin="0" end="3" var="i">
		${ names[i] }<br>
	</c:forEach>
 --%>	
	1 ~ 10 사이의 정수 출력<br>
	<c:forEach begin="1" end="10" var="i">
		 ${ i }
	</c:forEach>
	<br>
	년도선택 : <select>
				<c:forEach begin="1980" end="2020" var="year" step="10">
					<option>${ year }</option>
				</c:forEach>
			</select>
	
</body>
</html>