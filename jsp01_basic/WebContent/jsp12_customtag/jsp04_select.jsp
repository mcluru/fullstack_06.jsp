<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
	<h1>select tag를 동적으로 사용하기</h1>
	<hr />
	
	<my:select xxx="color" rgb="컬러모드" wb="흑백모드" zzz="기타모드"/> <br />
	<my:select xxx="genre" comedy="코미디" action="액션" horror="호러" sf="SF"/> <br />
	<hr />
	
	<h1>jsp액션태그 - attribute속성을 이용하기</h1>
	<my:header level="1">
		<jsp:attribute name="title">JSP 액션태그로 attribute전달</jsp:attribute>
	</my:header>
	
</body>
</html>