<%@page import="kr.ac.kopo.board.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/*
		작업순서
		1. no 파라미터값을 추출
		2. no에 해당하는 게시물을 db에서 얻어온다.
		3. 조회된 게시물을 화면에 출력
	*/
	// 파라미터 추출
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	
	//조회수 증가
	String type = request.getParameter("type");
	if(type != null && type.equals("list")){
		dao.incrementViewCnt(no);
	}
	
	// 게시판 번호에 의한 게시물 조회
	BoardVO board = dao.selectByNo(no);
	// 첨부파일 조회
	List<BoardFileVO> fileList = dao.selectFileByNo(no);
	
	//공유영역(pageContext)에 게시물 등록
	pageContext.setAttribute("board", board);
	pageContext.setAttribute("fileList", fileList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<style>
hr, table {
	width: 80%;
}
</style>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script>
	function doAction(type) {
		switch (type) {
			case 'U':
				break;
			case 'D':
				if (confirm('삭제하시겠습니까?')) {
					location.href = "delete.jsp?no=${ param.no }";
				}
				break;
			case 'L':
				location.href = "list.jsp";
				break;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>게시판 상세 페이지</h2>
			<hr>
			<br>
			<table border="1">
				<tr>
					<th width="25%">번호</th>
					<td>${ board.no }</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td><c:out value="${ board.title }" /></td>
				</tr>
				<tr>
					<th width="25%">글쓴이</th>
					<td><c:out value="${ board.writer }" /></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>${ board.content }</td>
				</tr>
				<tr>
					<th width="25%">조회수</th>
					<td>${ board.viewCnt }</td>
				</tr>
				<tr>
					<th width="25%">등록일</th>
					<td>${ board.regDate }</td>
				</tr>
				<c:if test="${ not empty fileList }">
						<tr>
							<th>첨부파일</th>
						<td>
							<c:forEach items="${ fileList }" var="file">
								<a href="/Mission-WEB/upload/${ file.fileSaveName }">
									${ file.fileOriName } 
								</a>
								(${ file.fileSize } bytes)<br>
							</c:forEach>
						</td>
					</tr>
					
				</c:if>
			</table>
			<br> <input type="button" value="수정" onclick="doAction('U')">&nbsp;&nbsp; 
			<input type="button" value="삭제" onclick="doAction('D')">&nbsp;&nbsp; 
			<input type="button" value="목록" onclick="doAction('L')">&nbsp;&nbsp;
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>