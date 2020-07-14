<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록폼</title>
<script>
	function doWrite(){
		let f = document.wForm;
		
		if(f.title.value ==''){
			alert('제목을 입력하세요')
			f.title.focus();
			return false;
		}
		if(f.writer.value ==''){
			alert('글쓴이을 입력하세요')
			f.writer.focus();
			return false;
		}
		if(f.content.value == ''){
			alert('내용을 입력하세요')
			f.content.focus();
			return false;
		}
		return true;
	}
	
	function doList(){
		location.href  = "list.jsp"
	}
	
	window.onload = function(){
		let btn = document.getElementById('btnList');
		btn.onclick = function(){
			location.href = "list.jsp"
		}
	}
	
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시물 등록폼</h2>
		<hr width="80%">
		<br>
		<form action="write.jsp" method="post" name="wForm" onsubmit="return doWrite()">
			<table border="1" style="width:80%;">
				<tr>
					<th width="23%">제목</th>
					<!-- <td><input type="text" name="title" size=100 required="required"></td> -->
					<td><input type="text" name="title" size=100></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><input type="text" name="writer" size=100></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="7" cols="60" name="content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value=" 등록  ">
			<!-- <input type="button" value=" 목록 " onclick="doList()"> -->
			<input type="button" value=" 목록  " id="btnList">
		</form>
	</div>
</body>
</html>