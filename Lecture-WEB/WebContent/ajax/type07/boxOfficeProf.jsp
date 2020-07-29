<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	#searchResult div {
		border: 1px solid blue;
		display: none;
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
			$.ajax({
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				type : 'get',
				//data : 'key=-&targetDt=20200727&itemPerPage=3',
				data : {
					key : '5548c8ea5a98415f90860740fad38c90',
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
	let movieCdList = [];
	function callback(result) {
		list = result.boxOfficeResult.dailyBoxOfficeList;
		for(var i = 0; i < list.length; i++){
			let movieInfo = list[i];
			let rank = movieInfo.rank;
			let name = movieInfo.movieNm;
			let audiCnt = movieInfo.audiCnt;
			
			$('#searchResult').append('<h4>' + rank + '위</h4>');
			$('#searchResult').append('<strong> ' + name + ' </strong>('+ audiCnt +'명)<br>');
			$('#searchResult').append('<button id=' + movieInfo.movieCd + '>상세보기 </button>');
			$('#searchResult').append('<div id="detail'+movieInfo.movieCd+'"></div>');
			$('#searchResult').append('<hr>');
		}
	}

	$(document).on('click','#searchResult button',function(){
		//console.log($(this).attr('id'))
		//console.log($(this).next().attr('id'))//detail이 나온다.
		let movieCd = $(this).attr('id');
		$('#detail' + movieCd).toggle()
		if($('#detail' + movieCd + ' *').size() == 0){
			$.ajax({
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json',
				data : {
					key : '5548c8ea5a98415f90860740fad38c90',
					movieCd : movieCd
				},
				success : detailMovie
			});
		}
	})
	
	function detailMovie(result) {
		let movieInfo = result.movieInfoResult.movieInfo;
		//감독
		let directors = '';
		movieInfo.directors.forEach(function(data){
			if(directors != '')
				directors += ', '
			directors += data.peopleNm;
		})
		//장르
		let genre = ''
		movieInfo.genres.forEach(function(data) {
			if(genre != ''){
				genre += ', '
			}
			genre += data.genreNm;
		});
		//배우
		let actors = ''
		movieInfo.actors.forEach(function(data){
			actors += data.peopleNm + '('+(data.cast==''?"-":data.cast)+'역)<br>'
		})
		//console.log(actors)
		detailDiv = '#detail' + movieInfo.movieCd;
		/* $(detailDiv).toggle() */		$(detailDiv).append('감독 : ' + directors + '<br>')
		$(detailDiv).append('장르 : ' + genre + '<br>')
		$(detailDiv).append('배우정보<br>')
		$(detailDiv).append(actors)
	}
	/* $('#searchResult button').click(function() {
		console.log(this)
	}); */
</script>
</head>
<body>
	<h2>일일 박스 오피스 조회서비스</h2>
	검색일 :
	<input type="date" id="searchDate">
	<button id="serachBtn">검색</button>
	<h4>검색 결과</h4>
	<div id="searchResult"></div>
</body>
</html>