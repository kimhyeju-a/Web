<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
	<c:if test="${ not empty param.msg }">
		alert('${ param.msg }');
	</c:if>
	$(document).ready(function() {
		$('.modify-btn').click(function(){
			$.ajax({
				url : '<%=request.getContextPath()%>/jsp/qna/passwordCheck.jsp?no=${ board.boardNo }&type=m',
				success : function(data) {
					$('#modifyPasswordCheck').html(data);
				}
			})
		})
		$('.delete-btn').click(function(){
			$.ajax({
				url : '<%=request.getContextPath()%>/jsp/qna/passwordCheck.jsp?no=${ board.boardNo }&type=d',
				success : function(data) {
					$('#modifyPasswordCheck').html(data);
				}
			})
		})
	})	
</script>
</head>
<body>
	<header id="header" class="fixed-top ">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</header>
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>Q&A - 상세페이지</h2>
				<ol>
					<li><a href="#">고객관리</a></li>
					<li>Q&A</li>
				</ol>
			</div>

		</div>
	</section>
	<section>
		<div class="container">
			<h3 class="detail-title">${ board.title }</h3>
			<hr width="20%">
			<div class="row detail-form">
				<div class="col-sm-2 detail-info-title">No</div>
				<div class="col-sm-3 detail">${ board.boardNo }</div>
				<div class="col-sm-2 detail-info-title">Writer</div>
				<div class="col-sm-3 detail"><c:if test="${ empty board.writer }"><c:out value="${ board.writerId }"/></c:if><c:if test="${ not empty board.writer }"><c:out value="${ board.writerId }"/></c:if></div>
				<!-- 왜 if 태그 쓰고는 안되고 안쓰고는 되는지!!!!!!!!!!!!! -->
				<c:set var="writerNo" value="${ board.writerNo }"></c:set>
				<c:set var="check" value="${ userVO.memberNo eq writerNo }"></c:set>
			</div>
			<div class="row detail-form">
				<div class="col-sm-2 detail-info-title">Title</div>
				<div class="col-sm-10 detail">
					<c:if test="${ board.parentNo eq 0}">[원글삭제]</c:if>
					<c:if test="${ board.depth > 1 }">
						<c:forEach begin="2" end="${ board.depth }">
							<img src="<%=request.getContextPath()%>/assets/img/ico_re.gif">
						</c:forEach>
					</c:if>
					<c:out value="${ board.title }" />
					<c:if test="${ board.regDate >= nowday }">
						<img src="<%=request.getContextPath()%>/assets/img/ico_new.gif">
					</c:if>
				</div>
			</div>
			<div class="row detail-content">
				<div class="col-sm-2 detail-info-title">Content</div>
				<c:set var="contentBr" value="${ board.content }"></c:set>
				<div class="col-sm-10 detail-info">${ fn:replace(contentBr, newLine, '</br>') }</div>
			</div>
			<div class="row float-right">
				<c:if test="${ check }"><a href="#" class="float-right btn btn-outline-danger write-no-btn delete-btn">삭제</a></c:if>
				<c:if test="${ check }"><a href="#" class="float-right btn btn-outline-info write-no-btn modify-btn">수정</a></c:if>
				<a href="<%=request.getContextPath()%>/qnaList.do" class="float-right btn btn-outline-dark write-no-btn">목록</a>
				<a href="<%=request.getContextPath()%>/writeReply.do?no=${ board.boardNo }" class="float-right btn btn-outline-dark write-no-btn">답변</a>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row float-right">
			<div id="modifyPasswordCheck"></div>
		</div>
	</div>
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