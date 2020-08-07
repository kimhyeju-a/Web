<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${ not empty check }">
		<c:choose>
			<c:when test="${ check eq true}">
			이 아이디는 사용이 불가능합니다.
		</c:when>
			<c:otherwise>
			이 아이디는 사용이 가능합니다.
		</c:otherwise>
		</c:choose>
	
	</c:when>
	<c:when test="${ not empty juminCheck }">
		<c:choose>
			<c:when test="${ juminCheck eq true}">
				이 주민번호는 사용이 불가능합니다.
			</c:when>
			<c:otherwise>
				이 주민번호는 사용이 가능합니다.
			</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>