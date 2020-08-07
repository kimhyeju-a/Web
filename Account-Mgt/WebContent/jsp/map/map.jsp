<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>통합계좌관리시스템</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/assets/img/favicon.png" rel="icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6efec64f19194a184a55d1902a6d6e99"></script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>고객지원</h2>
				<ol>
					<li><a href="#">고객지원</a></li>
					<li>지점찾기</li>
				</ol>
			</div>

		</div>
	</section>
	<section>
		<div class="row justify-content-md-center">
			<div class="col-md-8">
				<div id="map" style="width: 100%; height: 350px;"></div>
				<p>
					<button onclick="hideMarkers()">마커 감추기</button>
					<button onclick="showMarkers()">마커 보이기</button>
				</p>
			</div>
		</div>
	</section>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.4772952, 126.8603928), // 지도의 중심좌표
			level : 3
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [{
			title : '혜주은행본점',
			latlng : new kakao.maps.LatLng(37.4772952, 126.8603928),
			loaction : 953493342
		}, {
			title : '혜주은행 광명시장점',
			latlng : new kakao.maps.LatLng(37.4804043, 126.8551228),
			loation : 8132097
		}, {
			title : '혜주은행 철산점',
			latlng : new kakao.maps.LatLng(37.4756828, 126.8658219),
			loation : 10865611
		}, {
			title : '혜주은행 광명사거리점',
			latlng : new kakao.maps.LatLng(37.5221854, 126.857697),
			loation : 10865611
		}
		];

		//var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
		var imageSrc = 'https://i.pinimg.com/originals/d9/7f/ea/d97feac57bebf6007994f6a6286d005b.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		imageOption = {
			offset : new kakao.maps.Point(27, 69)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption), markerPosition = new kakao.maps.LatLng(37.4772952, 126.8603928); // 마커가 표시될 위치입니다

		for (var i = 0; i < positions.length; i++) {

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});
			var content = '<div class="customoverlay">' + '  <a href="https://map.kakao.com/link/map/'+positions[i].location+'" target="_blank">' + '    <span class="title">혜주은행</span>' + '  </a>' + '</div>';
			var position = new kakao.maps.LatLng(positions[i].latlng);
			var customOverlay = new kakao.maps.CustomOverlay({
				map : map,
				position : positions[i].latlng,
				content : content,
				yAnchor : 1
			});
		}
	</script>
	<!-- Vendor JS Files -->
	<script src="<%=request.getContextPath()%>/assets/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/php-email-form/validate.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/venobox/venobox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/counterup/counterup.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
</body>
</html>