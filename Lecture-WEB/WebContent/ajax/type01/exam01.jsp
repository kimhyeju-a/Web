<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#msgView {
		border: 1px solid red;
		height: 200px;
		width: 500px;
	}
</style>
<script>
	function requestMsg(){
	    //요청 받아서 응답 하고 싶은, xmlHttpRequest객체가 필요하다. 
	    //1.XmlHttpRequest 객체 생성
	    let httpRequest =  null;
	    if(window.XMLHttpRequest){         
	    httpRequest =new XMLHttpRequest();
	    	httpRequest = new XMLHttpRequest()
	    }else if(window.ActiveXObject){
	    	httpRequest = new ActiveXObject("Microsoft.XMLHTTP")   
	    }
	    
	    //2. 콜백함수 설정
	    httpRequest.onreadystatechange = function(){
			//4. 서버에서 응답 완료/ 콜백함수가 한번 호출하는 것이 아니라, 4번 호출됨
	    	if(httpRequest.readyState == 4) {
	    		if(httpRequest.status == 200){
	    			// 5. 서버에서의 응답 결과 추출-> 서버 응답 결과를 화면에 출력
	    			let msgView = document.getElementById("msgView");
	    			msgView.innerHTML = httpRequest.responseText;
	    		}
	    	}
	    }
	    
	    // 3. 서버에 비동기 통신 요청 ==> open, send //초기화작업을함
	    /* httpRequest.open('get', 'hello.jsp', true); */
	    httpRequest.open('get', '/Lecture-WEB/HelloServlet',true);
	    httpRequest.send(null);//get방식이기 때문에 content자리에 null이 들어간다.
	 }
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>서버에서 받은 메시지</h2>
	<div id="msgView"></div>
	<input type="button" value ="서버에 자료 요청" onclick="requestMsg()">
</body>
</html>