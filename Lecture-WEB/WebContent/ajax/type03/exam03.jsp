<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
// param3.jsp?name=hong&age=25
	$(document).ready(function() {
		$('button').click(function(){
			
			let name = $("#name").val()
			let age = $("#age").val()
			/* 
			$.post('param3.jsp', {name: '홍길동', age: 29}, function(result) {
				$('#debug').val(result)
			})
 			*/	
			/* 
			$.post('param3.jsp',"name=hong&age=30",function(result){
				$('#debug').val(result)
			})
			 */
			/* $.post('param3.jsp', function(result) {
				$('#debug').val(result)
			}) */
			/* $.ajax({
				url : 'param3.jsp',
				type : 'post',
				//data : 'name=hong&age=25',
				//data : 'name=' + name + '&age=' + age
				data : {
					name : name,
					age : age
				},
				success : function(result){
					$('#debug').val(result)
				}, error : function(error){
					$('#debug').val('오류코드 : ' + error.status + '\n')
				}
			}) */
		})
	})
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	이름 : <input type="text" name="name" id="name"><br>
	나이 : <input type="text" name="age" id="age"><br>
	<button>호출</button>
</body>
</html>