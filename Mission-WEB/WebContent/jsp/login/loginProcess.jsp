<%@page import="kr.ac.kopo.login.LoginDAO"%>
<%@page import="kr.ac.kopo.login.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	// VO 객체 생성 및 초기화
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);

	// DB에서 사용자 check
	LoginDAO dao = new LoginDAO();

	// 반환값이 null 이면 로그인 실패
	// 반환값이 LoginVO 객체라면 로그인 성공
	LoginVO userVO = dao.login(loginVO);
	String msg = "";
	String url = "";
	if (userVO == null) {
		msg = "아이디 또는 패스워드를 잘못입력했습니다.";
		url = "/Mission-WEB/jsp/login/login.jsp";
	} else {
		//세션 등록
		session.setAttribute("userVO", userVO);
		switch (userVO.getType()) {
			case "s" :
			case "S" :
				msg = "관리자님 환영합니다.";
				break;
			case "u" :
			case "U" :
				msg = userVO.getId() + "님 환영합니다.";
				break;
		}
		url = "/Mission-WEB/";
	}
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>
<script>
	alert("${ msg }");
	location.href = "${ url }";
</script>