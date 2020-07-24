<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	function sendProcess(param) {
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callbackFunc;

		param = encodeURIComponent(param);
		httpRequest.open('get', 'param.jsp?name=' + param , true)
		httpRequest.send(null);
	}

	function callbackFunc() {

		let debug = document.getElementById("debug");
		switch (httpRequest.readyState) {
			case 1:
				debug.value += "Loading...\n"
				break;
			case 2:
				debug.value += "Loaded....\n"
				break;
			case 3:
				debug.value += "Interactive... \n"
				break;
			case 4:
				debug.value += 'Complete...\n'
				// 서버 응답 후 상태코드 확인
				if (httpRequest.status == 200) {
					debug.value += '웹서버에서 정상적으로 수행 완료 \n';
					debug.value += '실행결과 : ' + httpRequest.responseText + '\n';
				} else {
					debug.value += '웹서버에서 오류 발생 ... \n';
					debug.value += '오류 코드 : ' + httpRequest.status + '\n'
					debug.value += '오류 내용 : ' + httpRequest.statusText + '\n'// tomcat 8.5 이후 부터는 안찍힘
				}
				break;
		}
	}
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea>
	<br>
	<input type="button" value="영문인자호출" onclick="sendProcess('hong,gil-dong')">
	<input type="button" value="한글인자호출" onclick="">
</body>
</html>