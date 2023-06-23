<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>게시글 목록</h1>
	<div class="container" align="center">
		<h1>게시글 목록조회</h1>
		<div class="row">
			<table class="table table-bordered table-hover">
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>조회수</th>
					<th>삭제</th>
				</tr>
				<%
					Class.forName("org.mariadb.jdbc.Driver");
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					
					String url = "jdbc:mariadb://localhost:3306/jspstudy";
					String usr = "root";
					String pwd = "12345";
					String sql = "select * from board order by bno desc";
					
					try {
						conn = DriverManager.getConnection(url, usr, pwd);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							int bno = rs.getInt("bno");
							String subject = rs.getString("subject");
							String writer = rs.getString("writer");
							String content = rs.getString("content");
							Date crtdate = rs.getDate("crtdate");
							int readcnt = rs.getInt("readcnt");
				%>
							<tr>
							<td><a href="jsp02_brdupdateForm.jsp?bno=<%= bno %>"><%= bno %></a></td>
							<td><%= subject %></td>
							<td><%= writer %></td>
							<td><%= content %></td>
							<td><%= crtdate %></td>
							<td><%= readcnt %></td>
							<td><a href="jsp04_brddeleteForm.jsp?bno=<%= bno %>" class="btn btn-danger">삭제</a></td>
							</tr>				
				<%
						}
						
					} catch(Exception e) {
						out.println("<h3 class='bg-danger text-white'>DB접속실패</h3><br />" + e.getMessage());
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
			</table>
			<a href="jsp03_brdinsertForm.jsp" class="btn btn-primary mt-sm-2">게시글등록</a>
		</div>
	</div>
</body>
</html>