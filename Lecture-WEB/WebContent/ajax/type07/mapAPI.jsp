<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=-"></script>
<script>
	window.onload = function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	}
	function setCenter() {
		var moveLatLon = new kakao.maps.LatLng(37.4772952, 126.8603928);
		map.setCenter(moveLatLon);
	}
</script>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<button onclick="setCenter()">광명융합기술교육원으로 이동</button>
</body>
</html>
