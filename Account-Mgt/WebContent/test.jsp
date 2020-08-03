<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<a id="login-form-btn" href="javascript:loginFormWithKakao()"> <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
	</a>
	<p id="login-form-result"></p>
	<script type="text/javascript">
		// 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
		// 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
		Kakao.init('-')
		function loginFormWithKakao() {
			Kakao.Auth.loginForm({
				success : function(authObj) {
					if(authObj == null){
						Kakao.API.request({
							url : '/v2/user/me',
							success : function(res) {
								console.log(res);
								location.href="/Account-Mgt/join/joinForm.jsp";
							}
						})
					}else {
						location.href="/Account-Mgt/login.do";
					}
					
				},
				fail : function(err) {
				},
			})

		}
		function showResult(result) {
			document.getElementById('login-form-result').innerText = result
		}
	</script>
</body>
</html>