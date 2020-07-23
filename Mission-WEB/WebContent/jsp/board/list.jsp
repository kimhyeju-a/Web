<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAllBoard();
	pageContext.setAttribute("boardList", list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script>
	function goWriteForm() {
		//location.href = "writeForm.jsp";
		location.href = "/Mission-WEB/jsp/board/writeForm.jsp";
	}
	/* 
	function loginService(){
		if(confirm('로그인이 필요한 서비스입니다.\n로그인하시겠습니까?')){
			location.href = "/Mission-WEB/jsp/login/login.jsp";
		}
	}
	 */
	function doAction(boardNo){
		<c:choose>
			<c:when test="${ empty userVO }">
				if(confirm('로그인 후 사용 가능합니다\n로그인 페이지로 이동하시겠습니까?'))
					location.href = "/Mission-WEB/jsp/login/login.jsp"
			</c:when>
			<c:otherwise>
				location.href = "detail.jsp?no=" + boardNo + "&type=list";
			</c:otherwise>
		</c:choose>
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align="center">
			<hr width="100%">
			<h2>게시판 목록</h2>
			<hr width="100%">
			<table border="1" style="width: 100%;">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">글쓴이</th>
					<th width="20%">등록일</th>
				</tr>
	<%-- <%
				while(rs.next()){
					
			%>	
				<tr>
					<td><%= rs.getInt("no") %></td>
					<td><%= rs.getString("title")%></td>
					<td><%= rs.getString("writer")%></td>
					<td><%= rs.getString("reg_date")%></td>
				</tr>
			<%
				}
			%> --%>
				<c:forEach items="${ boardList }" var="board" varStatus="loop">
					<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
						<td>${ board.no }</td>
						<td>
						<a href="javascript:doAction(${ board.no })">
							<c:out value="${ board.title }" />
						</a>
						<%-- 
						<c:choose>
							<c:when test="${ not empty userVO }">
								<a href="detail.jsp?no=${ board.no }"><c:out value="${ board.title }" /></a>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="loginService()">
									<c:out value="${ board.title }" />
								</a>
							</c:otherwise>
						</c:choose>
						 --%>
						</td>
						<td>${ board.writer }</td>
						<td>${ board.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty userVO }">
				<button onClick="goWriteForm()">새글 등록</button>
			</c:if>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>