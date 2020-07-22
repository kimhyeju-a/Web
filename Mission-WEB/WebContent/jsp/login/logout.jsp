<%@page import="kr.ac.kopo.login.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginVO userVO = (LoginVO)session.getAttribute("userVO");
	String msg = userVO.getId() + "님 로그아웃하셨습니다.";
	session.invalidate();
	
	pageContext.setAttribute("msg", msg);
%>
<script>
	alert("${ msg }");
	location.href = "/Mission-WEB/"
</script>