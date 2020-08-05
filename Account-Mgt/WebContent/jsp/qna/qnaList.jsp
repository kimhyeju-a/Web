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
<script>
	function doAction(boardNo){
		<c:choose>
			<c:when test="${ empty userVO }">
				if(confirm('로그인 후 사용 가능합니다\n로그인 페이지로 이동하시겠습니까?'))
					location.href = "<%=request.getContextPath()%>/login.do"
			</c:when>
			<c:otherwise>
				location.href = "<%=request.getContextPath()%>/detail.do?no=" + boardNo + "&type=list";
			</c:otherwise>
		</c:choose>
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
				<h2>Q&A</h2>
				<ol>
					<li><a href="#">고객관리</a></li>
					<li>Q&A</li>
				</ol>
			</div>

		</div>
	</section>
	<section>
		<div class="container" align="center">
			<h3 class="detail-title">Q & A</h3>
			<hr width="20%">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="7%">번호</th>
						<th>제목</th>
						<th width="16%">글쓴이</th>
						<th width="20%">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="board">
						<tr>
							<td>${ board.boardNo }</td>
							<td>
								<a href="javascript:doAction(${ board.boardNo })"> 
									<c:if test="${ board.depth > 1 }">
										<c:forEach begin="2" end="${ board.depth }">
											<img src="<%=request.getContextPath()%>/assets/img/ico_re.gif">
										</c:forEach>
									</c:if>
									<c:out value="${ board.title }" />
									<c:if test="${ board.regDate >= nowday }">
										<img src="<%=request.getContextPath()%>/assets/img/ico_new.gif">
									</c:if>
								</a>
							</td>
							<td>${ board.writer }</td>
							<td>
								${ board.formatRegDate }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div class="row float-right">
				<c:if test="${ not empty userVO }">
					<a href="<%=request.getContextPath()%>/write.do" class="float-right btn btn-outline-dark write-no-btn">새글 등록</a>
				</c:if>
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