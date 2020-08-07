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

	$(document).ready(function(){
		$('#idCheckBtn').click(function(){
			let id = $('#id').val();
			// id 는 4자 이상
			if(id.length < 4){
				alert('id는 4글자 이상입니다.')
			}else {
				$.post({
					url : '<%=request.getContextPath()%>/check.do',
						data : {
							id : id,
							type : "id"
						},
						success : function(data) {
							$('#idCheckSpan').text($.trim(data))
						},
						error : function(data) {
							alert(data)
						}
					})
				}
			});
		$('#juminCheckBtn').click(function(){
			let jumin = $('#jumin').val();
			$.post({
				url : '<%=request.getContextPath()%>/check.do',
				data : {
					jumin : jumin,
					type : "jumin"
				},
				success : function(data) {
					$('#juminCheckSpan').text($.trim(data))
				},
				error : function(data) {
					alert(data)
				}
			})
		});
	});
	//아이디 공백제거
	function idFormat(obj) {
		var temp = $(obj).val();
		$(obj).val($.trim(temp));
	}
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

	function joinSubmit() {
		if (($('#idCheckSpan').text() !== '이 아이디는 사용이 가능합니다.') && $('#id').val().startsWith('@k') == false) {
			alert('아이디를 확인해주세요')
			$('#id').focus();
			return false;
		}

		if ($('#passwordCheckText').text() != '일치합니다.' && $('#passwordText').text() != '올바른 비밀번호입니다.') {
			alert('비밀번호를 확인해주세요')
			$('#passwordText').focus();
			return false;
		}
		if (($('#juminCheckSpan').text() !== "이 주민번호는 사용이 가능합니다.")) {
			alert('주민번호를 확인해주세요')
			$('#jumin').focus();
			return false;
		}

		if ($('#jumin').val().length() != 14) {
			alert('주민번호를 확인해주세요')
			$('#jumin').focus();
			return false;
		}
		return true;
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

					<!-- Join Form -->
					<form action="<%=request.getContextPath()%>/joinProcess.do" method="post" onsubmit="return joinSubmit()">
						<h3 class="fadeIn second join_title">아이디</h3>
						<c:choose>
							<c:when test="${ not empty kakaoVO.id }">
								<input type="text" id="id" class="fadeIn second joinInput" name="id" value="${ kakaoVO.id }" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" id="id" class="fadeIn second joinInput" name="id" placeholder="id" onkeyup="idFormat(this)" required>
							</c:otherwise>
						</c:choose>
						<button type="button" id="idCheckBtn">중복체크</button>
						<span id="idCheckSpan"></span>
						<h3 class="fadeIn third join_title">비밀번호</h3>
						<input type="password" id="password" class="fadeIn third joinInput" name="password" placeholder="password" onkeyup="passwd(this)" required> <span id="passwordText"></span> <input type="password" id="passwordCheck" class="fadeIn third joinInput" placeholder="password check" onkeyup="passwdChk(this)" required> <span id="passwordCheckText"></span>

						<h3 class="fadeIn third join_title">이름</h3>
						<c:choose>
							<c:when test="${ not empty kakaoVO.name }">
								<input type="text" id="name" class="fadeIn third joinInput" name="name" value="${ kakaoVO.name }" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" id="name" class="fadeIn third joinInput" name="name" placeholder="name">
							</c:otherwise>
						</c:choose>
						<h3 class="fadeIn third join_title">주민번호</h3>
						<input type="text" id="jumin" class="fadeIn third joinInput" name="jumin" placeholder="Social Security Number" maxlength="13" onkeyup="autoHypenJumin(this)" required>
						<button type="button" id="juminCheckBtn">중복체크</button>
						<span id="juminCheckSpan"></span>
						<h3 class="fadeIn third join_title">이메일</h3>
						<c:choose>
							<c:when test="${ not empty kakaoVO.email }">
								<input type="text" id="email" class="fadeIn third joinInput" name="email" value="${ kakaoVO.email }" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" id="email" class="fadeIn third joinInput" name="email" placeholder="Email Enter">
							</c:otherwise>
						</c:choose>

						<h3 class="fadeIn third join_title">휴대전화</h3>
						<input type="text" id="tel" class="fadeIn third joinInput" name="tel" placeholder="Tel" maxlength="13" onkeyup="autoHypen(this)"> <input type="submit" class="fadeIn fourth" value="Log In">
					</form>

					<!-- Remind Passowrd -->
					<div id="formFooter">
						<a class="underlineHover" href="#">비밀번호찾기</a><span class="underlineHover">회원가입</span>
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