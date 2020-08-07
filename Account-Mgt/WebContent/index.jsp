<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>통합계좌관리시스템</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<script>
	<c:if test="${ not empty param.msg }">
		alert('${ param.msg }');
	</c:if>
	<c:if test="${ not empty msg }">
		alert('${ msg }');
	</c:if>
</script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center justify-content-center">
		<div class="container" data-aos="fade-up">

			<div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
				<div class="col-xl-6 col-lg-8">
					<h1>
						통합계좌관리시스템<span>.</span>
					</h1>
					<h2>내 금융계좌정보 및 업무를 한눈에! <span>Account MGT</span></h2>
				</div>
			</div>

			<div class="row mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
				<div class="col-xl-2 col-md-4 col-6">
					<div class="icon-box">
						<i class="ri-store-line"></i>

						<h3>
							<a href="#">계좌업무</a>
						</h3>
					</div>
				</div>
				<div class="col-xl-2 col-md-4 col-6 ">
					<div class="icon-box">
						<i class="ri-database-2-line"></i>
						<h3>
							<a href="#">입/출금</a>
						</h3>
					</div>
				</div>
				<div class="col-xl-2 col-md-4 col-6 mt-4 mt-md-0">
					<div class="icon-box">
						<i class="ri-customer-service-2-line"></i>
						<h3>
							<a href="<%=request.getContextPath()%>/qnaList.do">고객지원</a>
						</h3>
					</div>
				</div>
				<div class="col-xl-2 col-md-4 col-6 mt-4 mt-xl-0">
					<div class="icon-box">
						<i class="ri-account-pin-box-line"></i>
						<h3>
							<a href="#">마이페이지</a>
						</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>