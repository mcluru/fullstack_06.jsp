<%@page import="com.lec.board.vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardBean board = (BoardBean) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>댓글쓰기</title>
	<style>
  		.login-btn {
  			clear: black;
  			/* background-color: #FFC312; */
  			width: 100px;
  		}
  		.login-btn:hover {
  			clear: white;
  			background-color: black;  		
  		}
  		.input-group-prepend span {
  			color: black;
  			border-left-color: #FFC312;
  			width: 40px;
  			border: 0 !important;
  		}
  	</style>
</head>
<body>
	<div class="container" align="center">
		<div class="jumbotron">
			<h3>게시글 댓글쓰기</h3>
			<p>게시판글쓰기 페이지입니다. 댓글을 작성해주세요.</p>
		</div>
		
		<form action="boardReply.bo" method="post" class="form-group input-group">
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" class="form-control" name="writer" id="writer" placeholder="작성자를 입력하세요" required >
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" class="form-control" name="pass" id="pass" placeholder="비밀번호를 입력하세요" required>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
				<input type="text" class="form-control" name="subject" id="subject" placeholder="글제목을 입력하세요" required>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
				<textarea class="form-control" name="content" id="content" rows="15" cols="40" placeholder="글내용을 입력하세요" required></textarea>
			</div>
			
			<div class="form-group input-group">
				<input type="hidden" name="bno" value="${board.getBno()}" />
				<input type="hidden" name="re_ref" value="${board.getRe_ref()}" />
				<input type="hidden" name="re_lev" value="${board.getRe_lev()}" />
				<input type="hidden" name="re_seq" value="${board.getRe_seq()}" />
				<input type="submit" class="btn btn-success float-right login-btn mr-sm-2" value="댓글쓰기"/>
				<input type="reset" class="btn btn-success float-right" value="새로고침"/>
			</div>
		
		</form>
	</div>
	
	
</body>
</html>