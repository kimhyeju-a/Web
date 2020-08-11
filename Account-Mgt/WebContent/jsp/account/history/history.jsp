<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<th>계좌번호</th>
		<th>입금액</th>
		<th>출금액</th>
		<th>잔액</th>
		<th>보낸/받는이</th>
		<th>날짜</th>
	</tr>
	<c:forEach items="${ list }" var="history">
		<tr>
			<td>${ history.accountNumber }</td>
			<td>${ history.deposit }</td>
			<td>${ history.withdraw }</td>
			<td>${ history.balance }</td>
			<td><c:if test="${ not empty history.senderName }">${ history.senderName }</c:if><c:if test="${ empty history.senderName }">${ history.senderId }</c:if></td>
			<td>${ history.sentDate }</td>
		</tr>
	</c:forEach>
</table>