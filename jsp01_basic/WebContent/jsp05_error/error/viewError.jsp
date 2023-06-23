<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="background-color: red; color : white">
		<p>요청처리과정에서 에러가 발생했습니다</p>
		<p>고객님 불편을 드려 유감입니다만</p>
		<p>견디십쇼</p>
	</div>
	<hr />
	
	에러타입   : <%= exception.getClass().getName() %> <br />
	에러메세지 : <%= exception.getMessage() %> <br />
	에러메세지 : <%= exception.getLocalizedMessage() %> <br />
</body>
</html>