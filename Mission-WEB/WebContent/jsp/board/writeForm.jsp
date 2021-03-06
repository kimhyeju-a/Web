<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록폼</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script>
	function doWrite() {
		let f = document.wForm;

		if (f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus();
			return false;
		}
/* 		if (f.writer.value == '') {
			alert('글쓴이을 입력하세요')
			f.writer.focus();
			return false;
		} */
		if (f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus();
			return false;
		}
		
		
		//파일 확장자 체크
		if(checkExt(f.attachfile1)){
			return false;
		}
		
		if(checkExt(f.attachfile2)){
			return false;
		}
		return true;
	}

	function checkExt(obj) {
		let forbidName = ['exe', 'bat', 'java', 'js', 'class', 'jsp'];
		let fileName = obj.value;
		let ext = fileName.substring(fileName.lastIndexOf('.')+1);
		
		for(let i = 0; i < forbidName.length; i++){
			if(forbidName[i] == ext){
				alert('[' + ext + '] 확장자는 파일 업로드 정책에 위배됩니다.');
				return true;
			}
		}
		return false;
	}
	
	function doList() {
		location.href = "list.jsp"
	}

	window.onload = function() {
		let btn = document.getElementById('btnList');
		btn.onclick = function() {
			location.href = "list.jsp"
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
			<hr width="80%">
			<h2>게시물 등록폼</h2>
			<hr width="80%">
			<br>
			<form action="write.jsp" method="post" name="wForm" onsubmit="return doWrite()" enctype="multipart/form-data">
				<input type="hidden" name="writer" value="${ userVO.id }">
				<table border="1" style="width: 80%;">
					<tr>
						<th width="23%">제목</th>
						<!-- <td><input type="text" name="title" size=100 required="required"></td> -->
						<td><input type="text" name="title" size=100></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>${ userVO.id }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="7" cols="60" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="attachfile1"><br>
							<input type="file" name="attachfile2"><br>
						</td>
					</tr>
				</table>
				<br> <input type="submit" value=" 등록  ">
				<!-- <input type="button" value=" 목록 " onclick="doList()"> -->
				<input type="button" value=" 목록  " id="btnList">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>