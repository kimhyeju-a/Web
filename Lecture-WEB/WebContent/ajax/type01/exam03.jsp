<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#msgView {
		border: 1px solid red;
		height: 200px;
		width: 500px;
	}
</style>
<script>
	$(document).ready(function() {
		$(':button').click(function(){
			/*
				url		: 요청 주소(문자열)
				type	: 메소드(문자열) default : get방식
				data	: 파라미터(문자열, 객체)
				success : 수신성공(함수)
				error	: 수신실패(함수)
			*/
			$.ajax({
				url : 'hello.jsp',
				success : function(data) {
					$('#msgView').append(data);
				}
			})
		})
	})	
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>서버에서 받은 메시지</h2>
	<div id="msgView"></div>
	<input type="button" value ="서버에 자료 요청" onclick="requestMsg()">
</body>
</html>