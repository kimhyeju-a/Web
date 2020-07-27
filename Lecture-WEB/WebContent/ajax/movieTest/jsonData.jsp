<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Lecture-WEB/ajax/movieTest/httpRequest.js"></script>
<script>
	function sendOnClick() {
		sendProcess('get', 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=512fc3699c96753631d0112d155412e0&targetDt=20200501', null, callback)
	}
	
	function callback(){
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				/* console.log(httpRequest.responseText); */
				data = httpRequest.responseText;
				let movieList = JSON.parse(data).boxOfficeResult.dailyBoxOfficeList
				
				console.log(data)
				
				let msg = ' 20200501 일별 박스오피스: ' + movieList.length + '개\n'
				for(let i = 0; i < movieList.length; i++) {
					let movie = movieList[i];
					let movieNm = movie.movieNm;
					let openDt = movie.openDt;
					let rnum = movie.rnum;
					msg += '\t영화명 : ' + movieNm + ', 오픈일 : ' + openDt + ', 순위 : '+ rnum +'\n';
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
	<h2>JSON DATA 예제</h2>
	<br>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<input type="button" value="서버에 자료요청" onclick="sendOnClick()">
</body>
</html>