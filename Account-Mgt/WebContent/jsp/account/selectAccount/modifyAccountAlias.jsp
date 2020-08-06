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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#myInput").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#myList li").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});

	});
</script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>계좌업무</h2>
				<ol>
					<li><a href="#">계좌업무</a></li>
					<li>계좌수정</li>
				</ol>
			</div>
		</div>
	</section>
	<section id="services" class="services">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>계좌수정</h2>
				<p>
					<c:if test="${ empty userVO.name }">
						<c:out value="${ userVO.id }" />
					</c:if>
					<c:if test="${ not empty userVO.name }">
						<c:out value="${ userVO.name }" />
					</c:if>
					님의 계좌 - 수정하실 계좌를 선택해주세요.
				</p>
			</div>
			<div id="myBtnContainer" class="row">
				<button class="btn active" onclick="filterSelection('all')">전체계좌</button>
				<button class="btn" onclick="filterSelection('하나은행')">하나은행</button>
				<button class="btn" onclick="filterSelection('국민은행')">국민은행</button>
				<button class="btn" onclick="filterSelection('기업은행')">기업은행</button>
				<button class="btn" onclick="filterSelection('신한은행')">신한은행</button>
				<button class="btn" onclick="filterSelection('우리은행')">우리은행</button>
			</div>
			<div class="row container test">
				<c:if test="${ not empty list }">
					<c:forEach items="${ list }" var="account" varStatus="vs">
						<div class="filterDiv ${ account.bankName } col-lg-4 col-md-6 d-flex align-items-stretch mb-4" data-aos="zoom-in" data-aos-delay="100">
							<div class="icon-box" onclick="location.href="<%=request.getContextPath() %>/modifyAccountProcess.do?accountNo=${ account.accountNo }">
								<div class="icon">
									<c:choose>
										<c:when test="${ account.bankName eq '하나은행' }">
											<img src='<%=request.getContextPath()%>/assets/img/logo/accountHana.png' alt="${ account.bankName }">
										</c:when>
										<c:when test="${ account.bankName eq '국민은행' }">
											<img src='<%=request.getContextPath()%>/assets/img/logo/accountKb.png' alt="${ account.bankName }">
										</c:when>
										<c:when test="${ account.bankName eq '기업은행' }">
											<img src='<%=request.getContextPath()%>/assets/img/logo/accountIBK.png' alt="${ account.bankName }">
										</c:when>
										<c:when test="${ account.bankName eq '신한은행' }">
											<img src='<%=request.getContextPath()%>/assets/img/logo/accountSinhan.png' alt="${ account.bankName }">
										</c:when>
										<c:when test="${ account.bankName eq '우리은행' }">
											<img src='<%=request.getContextPath()%>/assets/img/logo/accountWoori.png' alt="${ account.bankName }">
										</c:when>
									</c:choose>
								</div>
								<h4>
									<a href="" class="bankName">${ account.bankName }</a>
								</h4>
								<p>계좌번호 : ${ account.accountNumber }</p>
								<p>별칭 : ${ account.alias }</p>
								<p>잔액 : ${ account.balance }</p>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</section>
	<script>
		filterSelection("all")

		function filterSelection(c) {
			var x, i;
			x = document.getElementsByClassName("filterDiv");
			if (c == "all")
				c = "";
			for (i = 0; i < x.length; i++) {
				w3RemoveClass(x[i], "show");
				if (x[i].className.indexOf(c) > -1)
					w3AddClass(x[i], "show");
			}
		}

		function w3AddClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				if (arr1.indexOf(arr2[i]) == -1) {
					element.className += " " + arr2[i];
				}
			}
		}

		function w3RemoveClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				while (arr1.indexOf(arr2[i]) > -1) {
					arr1.splice(arr1.indexOf(arr2[i]), 1);
				}
			}
			element.className = arr1.join(" ");
		}

		// Add active class to the current button (highlight it)
		var btnContainer = document.getElementById("myBtnContainer");
		var btns = btnContainer.getElementsByClassName("btn");
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener("click", function() {
				var current = document.getElementsByClassName("active");
				current[0].className = current[0].className.replace(" active", "");
				this.className += " active";
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