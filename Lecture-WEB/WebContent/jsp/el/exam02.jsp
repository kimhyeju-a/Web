<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies == null){
			hobbies = new String[]{"파라미터없음"};
		}
	%>
	java방식 : id = <%= id %><br>
	java방식 : id = <%= request.getParameter("id") %> <br>
	el방식 : id = ${ param.id }<br><br>
	
	java방식 : name = <%= request.getParameter("name") %><br>
	el방식 : name = ${ param.name }<br>
	
	
	<%-- http:// ~~~ ?hobby=music&hobby=movie&hobby=reading --%>
	hobby[0] : <%= hobbies[0] %><br>
	<%-- hobby[0] : <%= request.getParameterValues("id")[0] %> <br> --%>
	el방식 : hobby[0] : ${ paramValues.hobby[0] }
</body>
</html>