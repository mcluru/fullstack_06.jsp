<%@page import="com.lec.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!
	Connection conn = null; //DBMS와 JAVA연결 객체
	PreparedStatement pstmt = null;	//SQL구문을 실행
	ResultSet rs = null;	//실행결과를 저장
	ArrayList<BoardVO> boards = new ArrayList<>();

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String usr = "scott";
	String pwd = "tiger";
	String sql = "SELECT * FROM board";
%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    conn = DriverManager.getConnection(url, usr, pwd);
    try {
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            BoardVO board = new BoardVO();
            board.setSubject(rs.getString("subject"));
            board.setWriter(rs.getString("writer"));
            board.setContent(rs.getString("content"));
            boards.add(board);
        }
        request.setAttribute("boards", boards);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
 <table width="400" border="1">
        <tr>
            <th>제목</td>
            <th>작성자</td>
            <th>글내용</td>
        </tr>
        <c:forEach var="board" items="${boards}">
            <tr>
                <td>${board.getSubject()}</td>
                <td>${board.getWriter()}</td>
                <td>${board.getContent()}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>