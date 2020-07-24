<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
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
}
</style>
<script>
	let httpRequest = null;
	function getXMLHttpRequest(){
		if(window.XMLHttpRequest){
			return new XMLHttpRequest()
		}
		if(window.ActiveXObject){
			return new ActiveXOject("Microsoft.XMLHTTP");
		}
		return null;
	}
	
	function sendProcess() {
		httpRequest = getXMLHttpRequest();
		let id = document.getElementById("id");
		id = id.value;
		httpRequest.onreadystatechange = callbackFunc;
		httpRequest.open('get', 'idCheck.jsp?id='+id, true);
		httpRequest.send(null);
	}
	
	function callbackFunc(){
		let idCheckInput = document.getElementById("idCheckInput");
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				idCheckInput.innerHTML = httpRequest.responseText;
			}
		}
	}
	
	window.onload = function () {
		let btnList = document.getElementById('btnList');
		btnList.onclick = function() {
			location.href = "memberList.jsp"
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
			<h2>회원가입</h2>
			<hr>
			<form action="join.jsp" method="post">
				<div class="join_title">아이디</div>
				<input type="text" name="id" style="width: 40%" id="id" required>&nbsp;&nbsp;<input type="button" value="중복체크" onclick="sendProcess()">
				<div style="height: 20px" id="idCheckInput"></div>
				<div class="join_title">이름</div>
				<input type="text" name="name" required>

				<div class="join_title">비밀번호</div>
				<input type="password" name="password" required>

				<div class="join_title">email</div>
				<input type="text" name="email_id" style="width: 10%"> @ <input type="text" name="email_domain" style="width: 30%">

				<div class="join_title">핸드폰번호</div>
				<input type="text" name="tel1" style="width: 15%"> - <input type="text" name="tel2" style="width: 15%"> - <input type="text" name="tel3" style="width: 15%">

				<div class="join_title">주소</div>
				<input type="text" name="post" style="width: 15%" placeholder="우편주소"> <input type="text" name="basic_addr" style="width: 15%" placeholder="기본주소"> <input type="text" name="detail_addr" style="width: 15%" placeholder="상세주소">

				<div class="join_title">어떤 유저십니까?</div>
				<span style="margin-right: 80px"><input type="radio" name="type" value="s">슈퍼유저</span>
				<span><input type="radio" name="type" value="u" checked>일반유저</span> <br> <br> 
				
				<input type="submit" value="회원가입하기"> 
				<input type="button" value="목록보기" id="btnList">
				<br>
				<br>
				<br>
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>