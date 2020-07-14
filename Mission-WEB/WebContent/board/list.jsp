<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goWriteForm(){
		//location.href = "writeForm.jsp";
		location.href = "/Mission-WEB/board/writeForm.jsp";
	}
</script>
</head>
<body>
	<%
		String url = "jdbc:oracle:thin:@172.16.88.132:1521:xe";
		String user = "hr";
		String password = "hr";
		Connection conn= new ConnectionFactory().getConnection(url, user, password);
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("   from t_board ");
		sql.append(" order by no ");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();
		
	%>
	<div align="center">
		<hr width="80%">
		<h2>게시판 목록</h2>
		<hr width="80%">
		<table border="1" style="width : 80%;">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">글쓴이</th>
				<th width="20%">등록일</th>
			</tr>
			<%
				while(rs.next()){
					
			%>	
				<tr>
					<td><%= rs.getInt("no") %></td>
					<td><%= rs.getString("title")%></td>
					<td><%= rs.getString("writer")%></td>
					<td><%= rs.getString("reg_date")%></td>
				</tr>
			<%
				}
			%>
		</table>
		<br>
		<button onClick="goWriteForm()">새글 등록</button>
	</div>
	<%
		JDBCClose.close(conn, pstmt);
	%>
</body>
</html>