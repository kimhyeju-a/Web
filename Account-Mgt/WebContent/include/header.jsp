<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ======= Header ======= -->
<div class="container d-flex align-items-center justify-content-between">

	<div class="logo">
		<a href="/Account-Mgt">Account<span>mgt</span></a>
	</div>
	
	<nav class="nav-menu d-none d-lg-block">
		<ul>
			<li class="active"><a href="/Account-Mgt">Home</a></li>
			<li><a href="#about">계좌등록</a></li>
			<li><a href="#services">계좌조회</a></li>
			<li><a href="#portfolio">계좌관리</a></li>
			<li class="drop-down"><a href="">계좌업무</a>
				<ul>
					<li><a href="#">계좌이체</a></li>
					<li><a href="#">입금</a></li>
					<li><a href="#">출금</a></li>
				</ul></li>
			<li><a href="#">지점조회</a></li>

		</ul>
	</nav>
	<!-- .nav-menu -->

	<a href="<%=request.getContextPath() %>/login.do" class="get-started-btn">Login</a>

</div>
