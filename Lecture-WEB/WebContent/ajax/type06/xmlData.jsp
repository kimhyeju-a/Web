<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script>
	function sendOnClick() {
		sendProcess('get', 'sample.xml', null, callback)
	}

	function callback() {
		let msg = '';
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				let xmlDoc = httpRequest.responseXML;
				memberList = xmlDoc.getElementsByTagName("member"); 
				msg += '회원수 ' + memberList.length + '명\n';
				
				for(let i = 0; i < memberList.length; i++){
					let mem = memberList[i];
					console.log(mem);
					let id = mem.getElementsByTagName("id")[0].innerHTML;
					console.log(id);
					let name = mem.getElementsByTagNam("name")[0].innerHTML;
					
					msg += id + '(' + name +')\n';
				}
				debugTrace(msg);
			}
		}
	}
	function debugTrace(msg) {
		let debug = document.getElementById("debug");
		debug.value += msg;
	}
</script>
</head>
<body>
	<h2>XML DATA 응답예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea>
	<br>
	<input type="button" value="서버에 자료요청" onclick="sendOnClick()">
</body>
</html>