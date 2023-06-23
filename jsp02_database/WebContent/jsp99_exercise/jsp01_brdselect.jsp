<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String bno = request.getParameter("bno");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<%
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url = "jdbc:mariadb://localhost:3306/jspstudy";
			String usr = "root";
			String pwd = "12345";
			String sql = "select * from board where bno = '" + bno + "'";
			
			try {
				conn = DriverManager.getConnection(url, usr, pwd);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
		%>
					<table class="table table-hover">
						<tr>
							<td>NO.</td>
							<td><%= rs.getString("bno") %></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><%= rs.getString("subject") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><%= rs.getString("writer") %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><%= rs.getString("content") %></td>
						</tr>
						<tr>
							<td>작성날짜</td>
							<td><%= rs.getString("crtdate") %></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><%= rs.getString("readcnt") %></td>
						</tr>
					</table>	
		<%				
				} else {
		%>
					<h3 class="bg-danger text-white">게시물을 찾지 못했습니다</h3>
		<%
				}
			} catch(Exception e) {
		%>
				에러 : <%= e.getMessage() %>
		<%			
			} finally {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch(Exception e) {
					// dummy
				}
			}
		%>
	</div>
</body>
</html>