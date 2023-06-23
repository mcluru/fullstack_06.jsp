<%@page import="com.lec.el.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%
		Thermometer thermometer = new Thermometer();
		request.setAttribute("t", thermometer);
	%>
	
	<h1>온도변환기(v1.0)</h1>
	${t.getInfo()} <br />
	${t.getXxx()} <br />
	${t.setCelsius("서울", 25.6)} <br />
	서울의 현재온도는 섭씨 ${t.getCelsius("서울") }도 입니다 <br />
	서울의 현재온도는 화씨 ${t.getFahrenheit("서울") }도 입니다 <br />
</body>
</html>