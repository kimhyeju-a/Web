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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/account.js"></script>
<script>
	<c:if test="${ not empty param.msg }">
		alert('${ param.msg }');
	</c:if>
	$(document).ready(function(){
		$("#first-deposit").keyup(function(){
			var temp = $("#first-deposit").val()
			trimDiff('#first-deposit')
			let money = $('#first-deposit').val()
			$.ajax({
				url : '<%=request.getContextPath()%>/jsp/account/insertAccount/checkAccount.jsp?money=' + money +'&type=m',
				success : function(data){
					$('#first-deposit-result').html($.trim(data));
				}
			});
		});
		
		
		$('#bankName').attr('value',$('select option:selected').val())
		$("#sel1").on('change', function(){
			$('#bankName').attr('value',$('select option:selected').val())
		});
		
		$("#accountNumberCheck").click(function(){
			let accountNumber = $('#accountNumber').val();
			var number = accountNumber.replace(/[^0-9]/g, "");
			$.post({
				url : '<%=request.getContextPath()%>/accountCheck.do',
				data : {
					accountNumber : number,
					type : "accountNumber"
				},
				success : function(data) {
					$('#accountDupleCheckSpan').html($.trim(data))
				},
				error : function(data) {
					alert(data)
				}
			})
		})
	});
	function passwd(obj){
		var temp = $(obj).val();
		$(obj).val(temp.replace(/[^0-9 \-]*$/g, ""));
		var password = $(obj).val()
		var check = $('#passwordCheck').val()
		if (password.length < 4) {
			$('#passwordText').text('비밀번호는 4자리 숫자, 특수문자로 구성하여야 합니다.');
		} else {
			$('#passwordText').text('올바른 비밀번호입니다.');
		}
		if (password == check) {
			document.getElementById("passwordCheckText").innerText = '일치합니다.';
		} else {
			document.getElementById("passwordCheckText").innerText = '일치하지 않습니다.';
		}
	}
	function passwdCheck(obj){
		var temp = $(obj).val();
		$(obj).val(temp.replace(/[^0-9 \-]*$/g, ""));
		var password = document.getElementById("password").value
		var check = $(obj).val();
		
		if (password == check) {
			document.getElementById("passwordCheckText").innerText = '일치합니다.';
		} else {
			document.getElementById("passwordCheckText").innerText = '일치하지 않습니다.';
		}
	}
	function accountSubmit(){
		if($('#accountDupleCheckSpan').text() != "이 계좌번호는 사용이 가능합니다."){
			alert('계좌번호를 확인해주세요')
			$('#accountNumber').focus();
			return false;
		}
		if($('#first-deposit-result').text() != "확인"){
			alert('최초 입금액을 확인해주세요')
			$('#first-deposit').focus();
			return false;
		}
		if($('#first-deposit-result').text() != "확인"){
			alert('최초 입금액을 확인해주세요')
			$('#first-deposit').focus();
			return false;
		}
		if($('#passwordText').text() != '올바른 비밀번호입니다.' && $('#passwordCheckText').text() != '일치합니다.'){
			alert('비밀번호를 확인해주세요')
			$('#password').focus();
			return false;
		}
		return true;
	}
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
					<li>계좌등록</li>
				</ol>
			</div>

		</div>
	</section>
	<section>
		<div class="container">
			<h3 class="detail-title">계좌 등록</h3>
			<hr width="20%">
		</div>
		<div class="container col-md-7 account">
			<form action="<%=request.getContextPath()%>/insertAccount.do" method="post" onsubmit="return accountSubmit()">
				<div class="input-group mt-3 mb-3">
					<div class="input-group-prepend">
						<select class="form-control account-select select-bank" id="sel1">
							<option>하나은행</option>
							<option>신한은행</option>
							<option>국민은행</option>
							<option>우리은행</option>
							<option>기업은행</option>
						</select>
					</div>
					<input type="hidden" id="bankName" name="bankName">
					<input type="text" class="form-control" placeholder="원하시는 계좌번호를 입력해주세요." id="accountNumber" name="accountNumber" onkeyup="autoHypen(this)" required>
					<div class="input-group-append">
						<a href="#" class="btn btn-outline-info" id="accountNumberCheck">중복확인</a>
					</div>
				</div>
				<div id="accountDupleCheckSpan" class="float-right mb-1"></div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">최초 입금액</span>
					</div>
					<input type="text" class="form-control" id="first-deposit" name="firstDeposit" placeholder="최초 입금액은 1000원 이상이어야 합니다." required>
					<div class="input-group-append">
						<span class="input-group-text">원</span>
					</div>
				</div>
				<div id='first-deposit-result' class="float-right mb-1"></div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">별칭</span>
					</div>
					<input type="text" class="form-control" id="alias" name="alias" value="통장">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">소유주</span>
					</div>
					<input type="text" class="form-control" id="name" value="${ userVO.name }" readonly>
					<input type="hidden" value="${ userVO.memberNo }" name="userNo">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">계좌비밀번호</span>
					</div>
					<input type="password" class="form-control password " id="password" name="password" maxlength="4" placeholder="계좌비밀번호를 입력해주세요(숫자만 입력 가능)" onkeyup="passwd(this)" required>
				</div>
				<div id="passwordText" class="float-right mb-1"></div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">비밀번호확인</span>
					</div>
					<input type="password" class="form-control password" id="passwordCheck" name="passwordCheck" maxlength="4" placeholder="계좌비밀번호를 다시 입력해주세요(숫자만 입력 가능)" onkeyup="passwdCheck(this)" required>
				</div>
				<div class="float-right mb-1">
					<div id='passwordCheckText'></div>
				</div>
				<div class="row float-right mt-5">
					<input type="submit" class=" btn btn-outline-info" value="계좌 생성하기">
				</div>
			</form>
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