<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ======= Header ======= -->
<div class="container d-flex align-items-center justify-content-between">

	<div class="logo">
		<a href="/Account-Mgt">Account<span>mgt</span></a>
	</div>
	
	<nav class="nav-menu d-none d-lg-block">
		<ul>
			<li class="active"><a href="/Account-Mgt">Home</a></li>
			<li class="drop-down"><a href="#">계좌업무</a>
				<ul>
					<li><a href="<%=request.getContextPath()%>/insertAccountForm.do">계좌등록</a></li>
					<li><a href="<%=request.getContextPath()%>/selectAccount.do?userNo=${ userVO.memberNo }">계좌조회</a></li>
					<li><a href="#">계좌관리</a></li>
				</ul>
			</li>
			<li class="drop-down"><a href="#">입/출금</a>
				<ul>
					<li><a href="#">입금</a></li>
					<li><a href="#">출금</a></li>
					<li><a href="#">계좌이체</a></li>
				</ul>
			</li>
			<li class="drop-down"><a href="#">고객지원</a>
				<ul>
					<li><a href="#">지점조회</a></li>
					<li><a href="<%=request.getContextPath()%>/qnaList.do">Q&A</a></li>
				</ul>
			</li>
			<c:if test="${ not empty userVO }">
				<li><a href="#">내정보</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- .nav-menu -->
	<c:choose>
		<c:when test="${ empty userVO }">
			<a href="<%=request.getContextPath()%>/login.do" class="get-started-btn">Login</a>
		</c:when>
		<c:otherwise>
			<span>${ userVO.id }님</span>
			<span><a href="#" class="get-started-btn">Logout</a></span>
		</c:otherwise>
	</c:choose>

	<%-- <a href="<%=request.getContextPath() %>/login.do" class="get-started-btn">Login</a> --%>

</div>
