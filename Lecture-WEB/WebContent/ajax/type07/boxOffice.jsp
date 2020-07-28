<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult {
		width: 70%;
		height: 600px;
		border: 1px solid red;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		$('#serachBtn').click(function(){
			//let date = $('#searchDate').val().replace(/-/g,'');
			//let date = $('#searchDate').val().replace(/-/g,"");
			//console.log(date);
			
			var searchDate = $('#searchDate').val().split('-').join('');
			console.log(searchDate)
			$.ajax({
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				type : 'get',
				//data : 'key=-&targetDt=20200727&itemPerPage=3',
				data : {
					key : '-',
					targetDt : searchDate,
					itemPerPage : 5
				},
				datatype : 'jsonp',
				success : callback, 
				error : function(){
					alert('error')
				}
				
			})
		})
	})
	function callback(result) {
		list = result.boxOfficeResult.dailyBoxOfficeList;
		for(var i = 0; i < list.length; i++){
			let movieInfo = list[i];
			let rank = movieInfo.rank;
			let name = movieInfo.movieNm;
			let audiCnt = movieInfo.audiCnt;
			
			$('#searchResult').append('<h4>' + rank + '위</h4>');
			$('#searchResult').append('<strong> ' + name + ' </strong>('+ audiCnt +')<br>');
			$('#searchResult').append('<hr>');
		}
	}
</script>
</head>
<body>
	<h2>일일 박스 오피스 조회서비스</h2>
	검색일 : <input type="date" id="searchDate">
	<button id="serachBtn"> 검색 </button>
	<h4>검색 결과</h4>
	<div id ="searchResult"></div>
</body>
</html>