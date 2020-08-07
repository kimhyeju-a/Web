<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${ not empty accountNumberCheck }">
		<c:choose>
			<c:when test="${ accountNumberCheck eq true}">
				<div class="noAccountNumber">이 계좌번호는 사용이 불가능합니다.</div>
		</c:when>
			<c:otherwise>
				<div class="okAccountNumber">이 계좌번호는 사용이 가능합니다.</div>
		</c:otherwise>
		</c:choose>
	</c:when>
	
</c:choose>