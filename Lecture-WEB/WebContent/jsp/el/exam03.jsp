<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("msg","page영역에 객체등록");

	//request영역에 "id"라는 이릅에 "홍길동"등록
	request.setAttribute("id", "홍길동");
	request.setAttribute("msg","request영역에 객체등록");
	
	String message = (String)pageContext.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	empty msg : ${ empty msg } <br>
	msg : ${ msg }<br>
	id : ${ id }<br>
	
	request msg : ${ requestScope.msg }<br>
	
	message : <%= message %>
	message : <%= pageContext.getAttribute("msg") %>
	request message : <%= request.getAttribute("msg") %>
	request message length : <%= ((String)request.getAttribute("msg")).length() %>
</body>
</html>