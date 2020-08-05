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
<script>
	console.log("id : ${ userVO.id }")
	console.log("name : ${ userVO.name }")
	console.log("name : ${ usrVO.memberNo}")
</script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>Q&A</h2>
				<ol>
					<li><a href="#">고객관리</a></li>
					<li>Q&A</li>
				</ol>
			</div>

		</div>
	</section>
	<section>
		<div class="container contact">
			<div class="row write_form">
				<div class="col-md-3">
					<div class="contact-info">
						<i class="ri-question-mark"></i>
						<h2>Q & A</h2>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact-form">
					<!-- 부모 no가 있으면 writeReplyProcess.do로 이동, 없으면 writeProcess.do로 이동 -->
						<form action="<c:if test="${ empty parentNo }"><%=request.getContextPath()%>/writeProcess.do</c:if><c:if test="${ not empty parentNo }"><%=request.getContextPath()%>/writeReplyProcess.do?no=${ parentNo }</c:if>" method="post">
							<div class="form-group">
								<label class="control-label col-sm-2" for="writer">작성자:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="writer" 
											value="<c:if test="${ empty userVO.name }"><c:out value="${ userVO.id }"/></c:if><c:if test="${ not empty userVO.name }"><c:out value="${ userVO.name }"/></c:if>" 
											name="writer" readonly>
									<input type="hidden" value="${ userVO.memberNo }" name="writerNo">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="title">제목:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title" placeholder="Enter Title" name="title" required>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="content">내용:</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="5" id="content" placeholder="Enter Content" name="content" required></textarea>
								</div>
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</form>
<!-- 						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
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