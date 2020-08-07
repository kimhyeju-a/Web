<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${ param.type eq 'm' }">
		<c:if test="${ param.money lt 1000 }">
			<span class="less-money">금액이 작습니다. 1000원 이상을 입금해주세요</span>
		</c:if>
		<c:if test="${ param.money ge 1000 }">
			<span class="ok-money">확인</span>
		</c:if>
	</c:when>
	<c:when test="${ param.type eq 'd' }">
		<c:if test="${ param.money lt 1 }">
			<span class="less-money">금액이 작습니다. 1원 이상을 입금해주세요</span>
		</c:if>
		<c:if test="${ param.money ge 1 }">
			<span class="ok-money">확인</span>
		</c:if>
	</c:when>
</c:choose>