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
		$("#balance").keyup(function(){
			console.log('1')
			var temp = $("#balance").val()
			trimDiff('#balance')
			let money = $('#balance').val()
			$.ajax({
				url : '<%=request.getContextPath()%>/jsp/account/insertAccount/checkAccount.jsp?money=' + money +'&type=d',
				success : function(data){
					$('#balance-result').html($.trim(data));
				}
			});
		});
 		$('#bankName').attr('value',$('select option:selected').val())
		$("#sel1").on('change', function(){
			$('#bankName').attr('value',$('select option:selected').val())
			console.log('2')
		});
		
		$('#accountNumberCheck').click(function(){
			console.log('3')
			var form = $('<form></form>');
		    form.attr('action', '<%=request.getContextPath()%>/transferProcess.do');
			form.attr('method', 'post');
			form.attr('id', 'test');
			var accountNo = $("#sel1 option:selected").attr("id");
			var balance = $('#balance').val();
			var bankName =  $('.select-bank').val();
			var accountNumber = $('#accountNumber').val();
			form.append('$<input/>', {
				type : 'hidden',
				name : 'accountNo',
				value : accountNo
			})
			form.append('$<input/>', {
				type : 'hidden',
				name : 'balance',
				value : balance
			})
			form.appendTo('body');
			form.submit();
			alert(accountNo + " , " + balance +", " +bankName + ", " + accountNumber)
			post_to_url("<%=request.getContextPath()%>/transferProcess.do", {
				"fromAccount" : accountNo,
				"balance" : balance,
				'toAccountBank' : bankName,
				'toAccountNumber' : accountNumber
			}, 'post')
		})
	});

	function post_to_url(path, params, method) {
		method = method || 'post'; // Set method to post by default, if not specified.
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);
		for ( var key in params) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);
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
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>입/출금</h2>
				<ol>
					<li><a href="#">입/출금</a></li>
					<li>계좌이체</li>
				</ol>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<h3 class="detail-title">계좌이체</h3>
			<hr width="20%">
		</div>
		<div class="container col-md-7 account">
			<form action="<%=request.getContextPath()%>/insertAccount.do" method="post" onsubmit="return accountSubmit()">
				<div class="input-group mt-3 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">계좌선택</span>
					</div>
					<select class="form-control account-select account-selected" id="sel1" name="bankName">
						<c:forEach items="${ list }" var="account" varStatus="vs">
							<option id="${ account.accountNo }">은행명 : ${ account.bankName } | 계좌 : ${ account.accountNumber } | 잔액 : ${ account.balance }</option>
						</c:forEach>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">금액</span>
					</div>
					<input type="text" class="form-control" id="balance" name="balance" placeholder="계좌이체는 1원 이상이어야 합니다." required>
					<div class="input-group-append">
						<span class="input-group-text">원</span>
					</div>
				</div>
				<div id='balance-result' class="float-right mb-1"></div>
				<div class="input-group mt-3 mb-3">
					<div class="input-group-prepend">
						<select class="form-control account-select select-bank" id="sel2">
							<option>하나은행</option>
							<option>신한은행</option>
							<option>국민은행</option>
							<option>우리은행</option>
							<option>기업은행</option>
						</select>
					</div>
					<input type="hidden" id="bankName" name="bankName">
					<input type="text" class="form-control" placeholder="원하시는 계좌번호를 입력해주세요." id="accountNumber" name="accountNumber" onkeyup="autoHypen(this)" required>
				</div>
				<div id="accountDupleCheckSpan" class="float-right mb-1"></div>
				<div class="float-right mt-5">
					<input type="button" class=" btn btn-outline-info" id="accountNumberCheck" value="이체하기">
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