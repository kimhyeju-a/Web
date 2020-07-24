<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="text"], input[type="password"] {
	width: 50%;
	height: 25px;
}

.join_title {
	font-size: 10pt;
	font-weight: bold;
	margin-bottom: 10px;
	margin-top: 10px;
	align: "left"
}
</style>
<script>
	window.onload = function () {
		let btnList = document.getElementById('btnList');
		btnList.onclick = function() {
			location.href = "list.jsp"
		}
	}
</script>
</head>
<body>
	<div align="center">
		<div style="width: 50%">
			<hr>
			<h2>회원가입</h2>
			<hr>
			<form action="list.jsp" method="post">
				<div class="join_title" >아이디</div>
				<input type="text" name="id" required>

				<div class="join_title">이름</div>
				<input type="text" name="name" required>

				<div class="join_title">비밀번호</div>
				<input type="password" name="password" required>

				<div class="join_title">email</div>
				<input type="text" name="email_id" style="width:25%">
				<span style="width:10%">@</span>
				<input type="text" name="email_domain" style="width:60%">
				
				<div class="join_title">핸드폰번호</div>
				<input type="text" name="tel1" style="width:22%">
				-				
				<input type="text" name="tel2" style="width:30%">
				-
				<input type="text" name="tel3" style="width:30%">
				
				<div class="join_title">주소</div>
				<input type="text" name="post" style="width:29%" placeholder="우편주소">
				<input type="text" name="basic_addr" style="width:29%" placeholder="기본주소">
				<input type="text" name="detail_addr" style="width:29%" placeholder="상세주소">
				
				<div class="join_title">어떤 유저십니까?</div>
				<span style="margin-right:80px"><input type="radio" name="type" value="s">슈퍼유저</span>
				<span><input type="radio" name="type" value="u" checked>일반유저</span> <br>
				<br>
				
				<input type="submit" value="회원가입하기">
				<input type="button" value="목록보기" id = "btnList">
			</form>
		</div>
	</div>
</body>
</html>