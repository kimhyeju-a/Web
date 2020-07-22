<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script>
	window.onload = function () {
		let joinBtn = document.getElementById('joinBtn');
		joinBtn.onclick = function() {
			location.href = "joinForm.jsp"
		}
	}
</script>
</head>
<body>
	<%
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.selectAllMember();
		pageContext.setAttribute("list", list);
	%>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align="center">
			<hr width="100%">
			<h2>회원 목록</h2>
			<hr width="100%">
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
				<c:forEach items="${ list }" var="member">
					<tr>
						<td><a href="memberDetail.jsp?id=${ member.id }"><c:out value="${ member.id }" /></a></td>
						<td>${ member.name }</td>
						<td>${ member.password }</td>
						<td>${ member.emailId }@ ${ member.emailDomain }</td>
						<td>${ member.tel1 }- ${ member.tel2 } - ${ member.tel3 }</td>
						<td>${ member.basicAddr },${ member.detailAddr } (${ member.post })</td>
						<td>${ member.type }</td>
						<td>${ member.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<!-- <input type="button" value="회원가입하기>" id="joinBtn"> -->
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>