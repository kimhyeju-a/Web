<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let httpRequest = null;
	function getXMLHttpRequest() {
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}
		if (window.ActiveXObject) {
			return new ActiveXObject("Micreosoft.XMLHTTP");
		}
		return null;
	}
		
	function callbackFunc() {
		let msg = '';
		switch (httpRequest.readyState) {
			case 1:
				msg += "Loading...\n"
				break;
			case 2:
				msg += "Loaded....\n"
				break;
			case 3:
				msg += "Interactive... \n"
				break;
			case 4:
				msg += 'Complete...\n'
				// 서버 응답 후 상태코드 확인
				if (httpRequest.status == 200) {
					msg += '웹서버에서 정상적으로 수행 완료 \n';
					msg += '실행결과 : ' + httpRequest.responseText + '\n';
				} else {
					msg += '웹서버에서 오류 발생 ... \n';
					msg += '오류 코드 : ' + httpRequest.status + '\n'
					msg += '오류 내용 : ' + httpRequest.statusText + '\n'// tomcat 8.5 이후 부터는 안찍힘
				}
				break;
		}
		debugTrace(msg);
	}
	
	function debugTrace(msg) {
		let debug = document.getElementById("debug");
		debug.value += msg;
	}
	
	function sendProcess(method, param) {
		let msg = "================================================\n";
		msg += method + " /Lecture-WEB/ajax/type03/param2.jsp?name=" + param +"\n";
		debugTrace(msg);
		
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callbackFunc;
		
		let url = 'param2.jsp';
		param = encodeURIComponent(param);
		let args = 'name=' + param;
		if(method =='GET'){
			httpRequest.open(method, url +"?" +args , true);
			httpRequest.send(null);
		} else if(method == 'POST'){
			httpRequest.open(method, url , true);
			httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded')
			httpRequest.send(args);
		}
	}
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<input type="button" value="GET영문인자 호출" onclick="sendProcess('GET', 'honggildong')">
	<input type="button" value="GET한글인자 호출" onclick="sendProcess('GET', '홍길동')">
	<input type="button" value="POST영문인자 호출" onclick="sendProcess('POST', 'honggildong')">
	<input type="button" value="POST한글인자 호출" onclick="sendProcess('POST', '홍길동')">
</body>
</html>