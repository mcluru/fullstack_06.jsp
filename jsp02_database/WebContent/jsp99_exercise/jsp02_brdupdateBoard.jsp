<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	int bno = Integer.parseInt(request.getParameter("bno"));
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	Date crtdate = dateFormat.parse(request.getParameter("crtdate"));
	int readcnt = Integer.parseInt(request.getParameter("readcnt"));
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mariadb://localhost:3306/jspstudy";
	String usr = "root";
	String pwd = "12345";
	String sql = "update board set subject=?, content=? where bno=?";
	
	int updateCount = 0;
	boolean isConn = true;
	
	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setInt(3, bno);
		updateCount = pstmt.executeUpdate();
		
	} catch(Exception e) {
		isConn = false;
			out.println("<h3 class='bg-danger text-white'>DB접속실패</h3><br />" + e.getMessage());
	} finally {
		try {
			if(pstmt != null) pstmt.close();
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
		<h1>게시물수정</h1>
		<hr />
		
		<%
			if(updateCount > 0) {
		%>
				<h3 class="bg-info text-white"><%=bno%>번 게시글이 성공적으로 수정되었습니다</h3>
		<%
			} else {
		%>
				<h3 class="bg-danger text-white"><%=bno%>게시글의 수정이 실패했습니다. <%=bno %>번 게시글을 찾지 못했습니다</h3>
		<%
			}
		%>
		<a href="jsp05_brdlistBoard.jsp" class="btn btn-primary">게시글 목록</a>
	</div>
</body>
</html>