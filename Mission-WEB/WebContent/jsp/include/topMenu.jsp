<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function addFavorite() {
		try {
			window.external.AddFavorite('http://localhost:9999/Mission-WEB', '첫번째 나의 웹')
		} catch (e) {
			alert('현재 사용중인 브라우저에서는 사용할 수 없습니다.\n 크롬에서는 ctrl+d를 이용해주세요');
		}
	}
</script>
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="width:128px;">
			<a href="/Mission-WEB">
				<img src="/Mission-WEB/images/logo.png"  style="width:128px;">
			</a>
		</td>
		<td align="right">
			<%-- <a href="javascript:window.external.AddFavorite('http://localhost:9999/Mission-WEB', '첫번째 나의 웹')"> --%>
			<%-- <a href="javascript:addFavorite()"> --%>
			<a href="#" onclick="addFavorite()">
				즐겨찾기
			</a>
			<c:if test="${ not empty userVO }">
				[${ userVO.id } 님이 로그인 하였습니다.]
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<nav>
			<c:if test="${ userVO.type eq 's' or 'S' }">
				<a href="/Mission-WEB/jsp/member/memberList.jsp">회원관리 </a> | 
			</c:if>			
			<a href="/Mission-WEB/jsp/board/list.jsp">게시판</a> | 
			<c:choose>
				<c:when test="${ empty userVO }">
					<a href="/Mission-WEB/jsp/member/joinForm.jsp">회원가입</a> |
					<a href="/Mission-WEB/jsp/login/login.jsp">로그인</a> | 
				</c:when>
				<c:otherwise>
					<a href="/Mission-WEB/jsp/member/myPage.jsp">마이페이지</a> | 
					<a href="/Mission-WEB/jsp/login/logout.jsp">로그아웃</a> |
				</c:otherwise>
			</c:choose>
			</nav>
		</td>
	</tr>
</table>