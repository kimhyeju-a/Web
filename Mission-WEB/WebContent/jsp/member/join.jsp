<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String emailId = request.getParameter("emailId");
	String emailDomain = request.getParameter("emailDomain");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String post = request.getParameter("post");
	String basicAddr = request.getParameter("basicAddr");
	String detailAddr = request.getParameter("detailAddr");
	String type = request.getParameter("type");
	
	MemberVO member = new MemberVO(id, name, password, emailId, emailDomain, tel1, tel2, tel3, post, basicAddr, detailAddr, type);
	
	MemberDAO dao = new MemberDAO();
	dao.insertMember(member);
%>

<script>
	location.href="memberList.jsp";
</script>