<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function api(code){
		var grant_type ="authorization_code";
		var client_id = "-";
		var redirect_uri = "http://localhost:9999/Account-Mgt/testKakao.jsp";
		var code = code;
		
		$.post({
			url: "https://kauth.kakao.com/oauth/token", 
			data : {
					grant_type: grant_type,
					client_id: client_id,
					redirect_uri: redirect_uri,
					code : code
			},success : function(data){
				alert('test');
				var access_token = data['access_token']
				$('body').append(access_token + '<br>');
				
			},error :function(){
				alert(data)
			}
		});
	}
</script>
<%
	String code = request.getParameter("code");
%>
</head>
<body onload="api('<%=code%>')">

</body>
</html>