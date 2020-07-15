<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String str = request.getParameter("no");
	int paramNo = Integer.parseInt(str);

	Connection conn = new ConnectionFactory().getConnection();
	//select문 
	StringBuilder sql = new StringBuilder();
	sql.append("select no,title,writer,content,view_cnt,to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("  from t_board ");
	sql.append(" where no = ? ");

	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, paramNo);
	ResultSet rs = pstmt.executeQuery();

	
	//update문
	StringBuilder updateSql = new StringBuilder();
	updateSql.append("update t_board ");
	updateSql.append(" set view_cnt = ? ");
	updateSql.append(" where no = ? ");
	PreparedStatement updatePstmt = conn.prepareStatement(updateSql.toString());

	BoardVO board = null;
	//rs.next()를 한번만 실행한다 ==> no는 unique 이므로 
	if (rs.next()) {
		int no = rs.getInt("no");
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		String regDate = rs.getString("reg_date");
		String content = rs.getString("content");
		
		//실행이 되자마자 view_cnt + 1을 해준다.
		int viewCnt = rs.getInt("view_cnt") + 1;
		updatePstmt.setInt(1, viewCnt);
		updatePstmt.setInt(2, no);
		//BoardVO에 select한 값들을 넣어준다.
		board = new BoardVO(no, title, writer, content, viewCnt, regDate);
	}

	rs = updatePstmt.executeQuery();
	pageContext.setAttribute("board", board);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//버튼 클릭시 이동
	function goList() {
		location.href="/Mission-WEB/board/list.jsp";
	}
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시판 상세 페이지</h2>
		<hr width="80%">
		<table border="1" style="width: 80%">
			<tr>
				<th>번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${ board.content }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${ board.regDate }</td>
			</tr>
		</table>
		<button onClick="goList()">목록보기</button>
	</div>
	<script>
		
	</script>
</body>
</html>