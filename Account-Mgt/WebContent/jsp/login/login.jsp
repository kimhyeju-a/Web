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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	//msg가 있다면 띄워줌
	<c:if test="${ not empty param.msg }">
		alert('${ param.msg }');
	</c:if>
	// 카카오 로그인에서 받은 파라미터를 가지고 loginProcess.do로 간다.
	Kakao.init('-')
	function loginFormWithKakao() {
		Kakao.Auth.loginForm({
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						console.log(res);
						res.id = '@k' + res.id;
						var params = {
								id : res.id,
								email : res.kakao_account.email,
								name : res.properties.nickname
						}
						
						post_to_url("<%=request.getContextPath()%>/loginProcess.do", params, "post")
					}
				})
			}
		})
	}
	// 카카오 request에서 세팅한 params를 JSON 형태로 넘긴다. form을 이용해 값을 넘긴다.
	function post_to_url(path, params, method) {

		method = method || "post";
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);
		console.log(params)
		for (var key in params) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			console.log(key);
			hiddenField.setAttribute("value", params[key]);
			console.log(params[key]);
			form.appendChild(hiddenField);
		}
		document.body.appendChild(form);
		form.submit();
	}
</script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	<section id="hero" class="d-flex align-items-center justify-content-center">
		<div class="wrapper fadeInDown">
			<div id="formContent">
				<!-- Icon -->
				<div class="fadeIn first">
					<b>ACCOUNT</b><span> MGT</span>
				</div>

				<!-- Login Form -->
				<form action="<%=request.getContextPath()%>/loginProcess.do" method="post">
					<input type="text" id="id" class="fadeIn second" name="id" placeholder="id" value="user"> 
					<input type="password" id="password" class="fadeIn third" name="password" placeholder="password" value="123456789"> 
					<input type="submit" class="fadeIn fourth" value="Log In">
				</form>
				<a id="login-form-btn" href="javascript:loginFormWithKakao()"> <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" /></a>
				<!-- Remind Passowrd -->
				<div id="formFooter">
					<a class="underlineHover" href="#">비밀번호찾기</a><a class="underlineHover" href="<%=request.getContextPath()%>/join.do">회원가입</a>
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