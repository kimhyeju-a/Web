<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="<%=request.getContextPath()%>/assets/css/login.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/assets/js/ajax.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendor/jquery/jquery.min.js"></script>
<script>
	//msg가 있다면 띄워줌
	<c:if test="${ not empty msg }">
	alert('${ msg }');
	</c:if>
	$(document).ready(function() {
		$('#myModal').click(function() {
			console.log('클릭')
			$('#hname').val($('#name').val())
			$('#hemail').val($('#email').val())
			$('#htel').val($('#tel').val())
			$('section .myModal').modal();
		})
		$('#deleteModal').click(function(){
			$('section .deleteModal').modal();
		})
	});

	// 핸드폰번호 입력란 자동 - 
	function autoHypen(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = ''

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}
	// 주민번호 자동 - 
	function autoHypenJumin(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var jumin = ''
		if (number.length < 6) {
			return number;
		} else {
			jumin += number.substr(0, 6);
			jumin += '-'
			jumin += number.substr(6);
		}
		obj.value = jumin;
	}

	// 비밀번호 확인 및 정규화를 이용하여 비밀번호 패턴 체크
	function passwd(obj) {
		var temp = $(obj).val();
		$(obj).val($.trim(temp));
		var password = $(obj).val()
		var check = $('#passwordCheck').val()
		// pattern을 사용하여 비밀번호
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;

		console.log(pattern1.test(password))
		if (!pattern1.test(password) || !pattern2.test(password) || !pattern3.test(password) || password.length < 8) {
			$('#passwordText').text('비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.');
		} else {
			$('#passwordText').text('올바른 비밀번호입니다.');
		}

		if (password == check) {
			document.getElementById("passwordCheckText").innerText = '일치합니다.';
		} else {
			document.getElementById("passwordCheckText").innerText = '일치하지 않습니다.';
		}
	}
	// 비밀번호 확인란
	function passwdChk(obj) {
		var password = document.getElementById("password").value
		var temp = $(obj).val();
		$(obj).val($.trim(temp));
		var check = $(obj).val();
		if (password == check) {
			document.getElementById("passwordCheckText").innerText = '일치합니다.';

		} else {
			document.getElementById("passwordCheckText").innerText = '일치하지 않습니다.';
		}
	}
</script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	<section>
		<div id="joinBackGround" class="d-flex align-items-center justify-content-center col-md-auto mt-7">
			<div class="wrapper fadeInDown">
				<div id="formContent">
					<!-- Icon -->
					<div class="fadeIn first">
						<b>ACCOUNT</b><span> MGT</span>
					</div>
					<h3 class="fadeIn second join_title">아이디</h3>
					<input type="text" id="id" class="fadeIn second joinInput" name="id" value="${ userVO.id }" disabled>

					<h3 class="fadeIn third join_title">이름</h3>
					<input type="text" id="name" class="fadeIn third joinInput" name="name" value="${ userVO.name }">

					<h3 class="fadeIn third join_title">이메일</h3>
					<input type="text" id="email" class="fadeIn third joinInput" name="email" value="${ userVO.email }">

					<h3 class="fadeIn third join_title">휴대전화</h3>
					<input type="text" id="tel" class="fadeIn third joinInput" name="tel" value="${ userVO.phoneNo }" maxlength="13" onkeyup="autoHypen(this)">
					<div id="btn-group">
						<button type="button" class="btn btn-outline-info" id="myModal" value="회원정보 수정">회원정보수정</button>
						<button type="button" class="btn btn-outline-info" value="비밀번호 변경">비밀번호변경</button>
						<button type="button" class="btn btn-outline-danger" id="deleteModal" value="회원탈퇴">회원탈퇴</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 회원정보 수정 Modal -->
		<div class="modal fade myModal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">회원정보 수정</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<form action="<%=request.getContextPath()%>/myPageModify.do" method="post">
						<div class="modal-body">
							<input type="hidden" name="name" id="hname"> 
							<input type="hidden" name="email" id="hemail"> 
							<input type="hidden" name="tel" id="htel"> 
							<h3 class="join_title">비밀번호를 입력해주세요.</h3>
							<input type="password" name="password" class="joinInput">
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-outline-info">회원정보수정</button>
						</div>
					</form>

				</div>
			</div>
		</div>
		<!-- The Modal -->
		<div class="modal fade deleteModal" id="deleteModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">회원탈퇴</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<form action="<%=request.getContextPath()%>/myPageDelete.do" method="post">
						<div class="modal-body">
							<h3 class="join_title">비밀번호를 입력해주세요.</h3>
							<input type="password" name="password" class="joinInput">
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-outline-info">회원탈퇴</button>
						</div>
					</form>

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