<%@page import="kr.ac.kopo.login.LoginVO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//1단계
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	/* String writer = ((LoginVO)session.getAttribute("userVO")).getId(); */
	
	String content = request.getParameter("content");
	
	//2단계
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);
	
%>
<%-- 3단계 --%>
<script>
	alert('게시판에 등록되었습니다.');
	location.href="list.jsp";
</script>