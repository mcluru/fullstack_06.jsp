<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
textarea {
        width: 25%;
        height: 100px;
      }
</style>
<body>
	<form action="jsp_member_process.jsp" method="post">
		아이디 : <input type="text" name="userid"/><br />
		비밀번호 : <input type="password" name="userpw"/><br />
		연락처 : <input type="text" name="usertell"/><br />
		<!-- 성별 : <input type="text" name="usergender"/><br /> -->
		성별 : 남자<input type="radio" name="usergender" value="남자"/> 
			   여자<input type="radio" name="usergender" value="여자"/><br />
		취미 : <input type="checkbox" name="hobbies" value="독서" /> 독서
			  <input type="checkbox" name="hobbies" value="음악" /> 음악
			  <input type="checkbox" name="hobbies" value="운동" /> 운동
			  <input type="checkbox" name="hobbies" value="등산" /> 게임<br />
		가입인사 <textarea name="joingreet" placeholder="안녕하세요"></textarea><br />
		<input type="submit" value="가입하기" />
		<input type="reset" value="새로고침" />
	</form>
</body>
</html>