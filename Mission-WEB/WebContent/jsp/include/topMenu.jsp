<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		</td>
	</tr>
	<tr>
		<td>회원관리 | 
			<a href="/Mission-WEB/jsp/board/list.jsp">게시판</a> | 로그인 | 마이페이지 | 로그아웃 |</td>
	</tr>
</table>