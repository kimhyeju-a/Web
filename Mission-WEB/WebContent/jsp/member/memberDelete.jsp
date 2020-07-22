<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	dao.deleteMember(id);
%>

<%--
	prompt 를 이용해서 비밀번호가 맞으면 회원탈퇴 진행한다.
--%>
<script>
	alert("[ ${ param.id } ] 회원탈퇴가 정상 처리되었습니다.");
	loaction.href = "list.jsp";
</script>