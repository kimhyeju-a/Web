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
			let searchDate = $('#searchDate').val().split('-').join('');
			console.log(searchDate)
			$.ajax({
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				type : 'get',
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
	
	function callback(result) {
		let list = result.boxOfficeResult.dailyBoxOfficeList;
		for(var i = 0; i < list.length; i++){
			let movieInfo = list[i];
			let rank = movieInfo.rank;
			let name = movieInfo.movieNm;
			let audiCnt = movieInfo.audiCnt;
			let movieCd = movieInfo.movieCd;
			console.log(movieCd);
			
			$('#searchResult').append('<h4>' + rank + '위</h4>');
			$('#searchResult').append('<strong> ' + name + ' </strong>('+ audiCnt +')<br>');
			$('#searchResult').append('<button onclick="detailBtnClick('+movieCd+')" id="'+movieCd+'Btn">상세보기 </button>');
			$('#searchResult').append('<button onclick="closeDetail('+movieCd+')" id = "close'+movieCd+'Btn">닫기</button>');
			$('#close'+movieCd+'Btn').toggle();
			$('#searchResult').append('<div id="'+ movieCd +'"></div>');
			$('#searchResult').append('<hr>');
		}
	}
	
	function detailBtnClick(movieCd){
		$.ajax({
			url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json',
			type : 'get',
			data : {
				key : '5548c8ea5a98415f90860740fad38c90',
				movieCd : movieCd
			},
			datatype : 'jsonp',
			success : detailFunc,
			error : function(){
				alert('error')
			}
		})
	}
	//상세 화면 콜백함수
	function detailFunc(result){
		
		let msg = ''
		let detail = result.movieInfoResult.movieInfo;
		
		let movieCd = detail.movieCd;			//영화 pk 
		let openDt = detail.openDt;				//개봉일
		let directors = detail.directors;		//감독들 배열 형태
		let actors = detail.actors;				//배우들 배열 형태
		$('#'+movieCd+'Btn').toggle();
		$('#close'+movieCd+'Btn').toggle();
		//출력 부분
		msg += '개봉일 : ' + openDt +'<br>'
		msg += '감독명  : '
		for(let i = 0; i < directors.length ; i++){
			if(i != 0) {
				msg += ', ';
			}
			msg += directors[i].peopleNm;
		}
		msg += '<br>배우명 : ';
		for(let i = 0; i < actors.length ; i++){
			if(i != 0) {
				msg += ',';
			}
			msg += actors[i].peopleNm;
		}
		msg += '<br>';
		$('#'+movieCd).append(msg);
		let heightPlus =  $('#searchResult').height()+$('#'+movieCd).height();
 		$('#searchResult').css('height',heightPlus)
	}
	
	//닫기
	function closeDetail(movieCd){
		let heightMinus =  $('#searchResult').height()-$('#'+movieCd).height();
 		$('#searchResult').css('height',heightMinus)
		$('#'+movieCd).text('');
		$('#'+movieCd+'Btn').toggle();
		$('#close'+movieCd+'Btn').toggle();
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