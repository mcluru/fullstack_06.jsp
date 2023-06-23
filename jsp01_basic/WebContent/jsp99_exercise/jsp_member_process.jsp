<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.mytable {
		justify-content: center;
	}
</style>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	String tell = request.getParameter("usertell");
	String gender = request.getParameter("usergender");
	String[] hobbies = request.getParameterValues("hobbies");
	String greet = request.getParameter("joingreet");
%>
<div id="mytable">
	<table border="1">
	<thead>
	<tr>
	<td>  종류  </td>
	<td>  입력값  </td>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td>아이디</td>
	<td><% out.println(id); %></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><% out.println(pw); %></td>
	</tr>
	<tr>
	<td>전화번호</td>
	<td><% out.println(tell); %></td>
	</tr>
	<tr>
	<td>성별</td>
	<td><% out.println(gender); %></td>
	</tr>
	<tr>
	<td>취미</td>
	<td>
		<%
		if(hobbies != null) {
			for(String hobby:hobbies) {
		%>
			<%= hobby %> , 
		<%
				}
			}
		%>
	</td>
	</tr>
	<tr>
	<td>가입인사</td>
	<td><% out.println(greet); %></td>
	</tr>
	</tbody>
	</table>
</div>
</body>
</html>