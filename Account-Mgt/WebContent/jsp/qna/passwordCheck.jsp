<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="<%=request.getContextPath()%>/<c:if test="${ param.type eq 'm' }">modify.do</c:if><c:if test="${ param.type eq 'd' }">delete.do</c:if>" method="post">
	<div class="input-group mb-3">
	    <div class="input-group-prepend">
	      <span class="input-group-text modify-password-span">비밀번호를 입력하세요</span>
	    </div>
	    <input type="hidden" name="no" value="${ param.no }">
	    <input type="password" class="form-control" name="password">
	    <div class="input-group-append">
	      <button class="btn btn-outline-info" type="submit">입력완료</button>
	    </div>
  	</div>
</form>