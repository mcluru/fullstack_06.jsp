<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	String subject = "";
	String writer = "";
	String content = "";
	Date crtdate = null;
	int readcnt = 0;
	
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
			subject = rs.getString("subject");
			writer = rs.getString("writer");
			content = rs.getString("content");
			crtdate = rs.getDate("crtdate");
			readcnt = rs.getInt("readcnt");
		} else {
			out.println("<h3 class='bg-danger text-white'>" + bno+ "번 게시글을 찾지 못했습니다!!</h3>");
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
		<h1>게시글 삭제하기</h1>
		
		<form action="jsp04_brddeleteBoard.jsp" method="post">
			<table class="table table-bordered table-dark table-hover">
				<tr>
					<td width="20%">NO</td>
					<td><input type="number" name="bno" class="form-control" size="30" disabled value="<%=bno%>"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" class="form-control" size="30" disabled value="<%=subject%>"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" class="form-control" size="30" disabled value="<%=writer%>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" class="form-control" size="30" disabled value="<%=content%>"></td>
				</tr>
				<tr>
					<td>작성날짜</td>
					<td><input type="date" name="crtdate" class="form-control" size="30" disabled value="<%=crtdate%>"></td>
				</tr>
				<tr>
					<td>조회수</td>
					<td><input type="number" name="readcnt" class="form-control" size="30" disabled value="<%=readcnt%>"></td>
				</tr>
			</table>
			<input type="hidden" name="bno" value="<%=bno%>")/>
			<input type="submit" class="btn btn-info mt-sm-2" value="게시글 삭제하기"/>
			<a href="jsp05_brdlistBoard.jsp" class="btn btn-primary mt-sm-2">게시글 목록</a>
		</form>
	</div>
</body>
</html>