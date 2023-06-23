<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파일의 절대경로를 이용해 파일읽기</h1>
	<%
		// java.io, java.nio패키지
		char[] cbuf = new char[256000];
		int len = -1;
		String path = "D:/백장미/full-stack/06.jsp/jsp01_basic/WebContent/jsp04_object/jsp01_out.jsp";
		try(InputStreamReader isr = new InputStreamReader(new FileInputStream(path), "utf-8")) {
			while((len=isr.read(cbuf)) != -1) {
				out.println(new String(cbuf, 0, len));
			}
		} catch(Exception e) {
			out.println("에러 : " + e.getLocalizedMessage());
		}
	
	%>
</body>
</html>