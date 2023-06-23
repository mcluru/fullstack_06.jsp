<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	파일전송방식
	
	게시판이나 자료실등에서 제품이미지 등의 파일을 업로드할 경우 request기본객체등에서 제공하는
	기능으로 파일업로드 가능하다
	
	일반 파라미터로 전송할 대 사용하는 인코딩자료와 파일을 업로드할 떄 사용하는 인코딩자료의 형식이 다르다.
	파일을 업로드할 경우는 스트림기반의 전송방식에는 인코딩방식에 따라 전송하는 데이터형식이 달라진다.
	
	파일을 업로드하기 위해 "multipart/form-data"인코딩방식을 사용해야하는데, 데이터를 전송할 때
	"multipart/form-data"방식으로 전송해야한다.
	
	이 방법으로 전송하기 위해선 form태그의 enctype속성값을 "multiprat/form-data"으로 지정해야한다.
	또한 "multipart/form-data"인코딩방식은 post방식의 한 종류이기 때문에 method속성도 post로 설정해야한다.
 -->
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
		<form action="jsp02_multipart_data.jsp" method="post" enctype="multipart/form-data">
			<input type="text" class="mb-sm-2" placeholder="이름을 입력하세요..."><br>
			<input type="file" class="mb-sm-2" name="file1"><br>
			<input type="file" class="mb-sm-2" name="file2"><br>
			<input type="file" class="mb-sm-2" name="file3"><br>
			<input type="submit" class="btn btn-success" value="파일업로드">
		</form>
	</div>
</body>
</html>