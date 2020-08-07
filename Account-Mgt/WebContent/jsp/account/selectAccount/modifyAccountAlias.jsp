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
	<section>
		<div class="container contact">
			<div class="row write_form">
				<div class="col-md-3">
					<div class="contact-info">
						<i class="ri-question-mark"></i>
						<h2>Modify</h2>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact-form">
						<form action="<%=request.getContextPath() %>/modifyAccountProcess.do" method="post">
							<div class="form-group">
								<label class="control-label col-sm-2" for="userNo">소유자:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="userNo" value="${ account.userNo }" name="userNo" readonly>
									<input type="hidden" id="accountNo" value="${ account.accountNo }" name="accountNo" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="bankName">은행명:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="bankName" value="${ account.bankName }" name="bankName" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="accountNumber">계좌번호 :</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="accountNumber" value="${ account.accountNumber }" name="accountNumber" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="alias">별칭 :</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="alias" value="${ account.alias }" name="alias">
								</div>
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</form>
					</div>
				</div>
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