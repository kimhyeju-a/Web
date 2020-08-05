<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${ param.type eq 'm' }">
		<c:if test="${ param.money+0 lt 1000+0 }">
			<span class="less-money">금액이 작습니다. 1000원 이상을 입금해주세요</span>
		</c:if>
		<c:if test="${ param.money+0 ge 1000+0 }">
			<span class="ok-money">확인</span>
		</c:if>
	</c:when>
<%-- 	<c:when test="${ param.type eq 'c' }">
	
	</c:when> --%>
</c:choose>