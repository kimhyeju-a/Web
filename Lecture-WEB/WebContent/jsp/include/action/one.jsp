<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<hr>
id : <%= request.getAttribute("id") %><br>
id : ${ id }<br>
날라온 파라미터<br>
name : ${ param.name }<br>
age : ${ param.age }<br>
<%-- name : <%= request.getParameter("name") %> <br> --%>
<%-- age : <%= request.getParameter("age") %> <br> --%>
<h2>include된 내용입니다.</h2>
<h2>include된 내용입니다.</h2>
<h2>include된 내용입니다.</h2>
<h2>include된 내용입니다.</h2>
<h2>include된 내용입니다.</h2>
<h2>include된 내용입니다.</h2>
<h2>include된 내용입니다.</h2>
<hr>
<c:set var="phone" value="010-1111-2222" scope="request"/>