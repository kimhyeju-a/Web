<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO b = new BoardVO();

	b.setNo(10);
	b.setTitle("hello");
	
	//공유역역에 객체 등록
	pageContext.setAttribute("board", b);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= b.getNo() %><br>
	
	no : <%= ((BoardVO)pageContext.getAttribute("board")).getNo() %><br>

	title : <%= b.getTitle() %><br>
	title : <%= ((BoardVO)pageContext.getAttribute("board")).getTitle() %><br>
	
	el no : ${ board.no }<br>
	el title : ${ board.title }<br>
	el viewCnt : ${ board.viewCnt }<br>
	
	el no : ${ board['no'] }<br>
	
	<%-- el aaa : ${ board.aaa } <br> --%>
</body>
</html>