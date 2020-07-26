<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	boolean check =  dao.idCheck(id);
	
	pageContext.setAttribute("check", check);
%>
<c:choose>
	<c:when test="${ check eq true }">
		${ param.id }는 존재합니다. 다시 입력해주세요.
	</c:when>
	<c:otherwise>
		등록가능한 id입니다.
	</c:otherwise>
</c:choose>
<script>
	alert(id)
</script>