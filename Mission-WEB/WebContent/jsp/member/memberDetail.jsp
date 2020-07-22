<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.selectById(id);
	
	pageContext.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세정보</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script>
	function memberDetailAction(type){
		switch(type){
		case 'L' :
			location.href = "memberList.jsp";
			break;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>멤버 상세페이지</h2>
			<hr>
			<br>
			<table border="1" style="width: 100%">
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
				<tr>
					<td>${ member.id }</td>
					<td>${ member.name }</td>
					<td>${ member.password }</td>
					<td>${ member.emailId }@ ${ member.emailDomain }</td>
					<td>${ member.tel1 }- ${ member.tel2 } - ${ member.tel3 }</td>
					<td>${ member.basicAddr },${ member.detailAddr } (${ member.post })</td>
					<td>${ member.type }</td>
					<td>${ member.regDate }</td>
				</tr>
			</table>
			<br>
			<input type="button" value="목록" onclick="memberDetailAction('L')">
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>