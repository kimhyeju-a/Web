<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = new ConnectionFactory().getConnection();

		StringBuilder sql = new StringBuilder();
		sql.append("select id,name,password,email_id,email_domain,tel1,tel2,tel3,post,basic_addr,detail_addr, type,reg_date ");
		sql.append("   from t_member ");

		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();
	%>
	<div align="center">
		<hr width="80%">
		<h2>회원 목록</h2>
		<hr width="80%">
		<table border="1">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>Email</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>type</th>
				<th>가입일</th>
			</tr>
			<%
				while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString("id") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("password") %></td>
					<td><%=rs.getString("email_id") %> @ <%=rs.getString("email_domain") %></td>
					<td><%=rs.getString("tel1") %> - <%=rs.getString("tel2") %> - <%=rs.getString("tel3") %></td>
					<td><%=rs.getString("basic_addr") %> , <%=rs.getString("detail_addr") %> (<%= rs.getString("post") %>)</td>
					<td><%=rs.getString("type") %></td>
					<td><%=rs.getString("reg_date") %></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>