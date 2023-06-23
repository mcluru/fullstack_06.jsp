<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	session객체 사용하기
	
	cookie는 웹브라우저에 정보를 보관할때 사용한다면
	session은 웹서버(웹컨테이너)에 정보를 보관할 때 사용한다. session은 오직 웹서버에만 생성된다.
	
	웹컨테이너는 기본적으로 한 웹브라우저마다 한 개의 session을 생성한다. 웹브라우저마다 session이
	별도로 존재하므로 session은 웹브라우저와 관련된 정보를 저장하는데 주로 사용한다.
	즉, cookie가 클라이언트측의 데이터 저장소라면 session은 서버측의 저장소다.
	
	session을 생성하면 session기본객체를 이용해서 session을 사용할 수 있게 된다.
	jsp에서 session을 생성하려면 page디렉티브의 session속성을 true(기본값)로 지정한다.
	
	A. session 기본객체
		session객체는 request객체와 마찬가지로 속성을 제공하고 setAttribute, getAttribute메서드를
		사용해 session의 속성값을 저장하거나 읽을 수 있다.
		단, session객체는 session만의 고유정보를 제어할 수 있는 메서드가 추가로 제공된다.
		
		1. getId() : session id(session마다 고유의 id값)를 리턴
		2. getCreateTime() : session이 생성된 시간을 리턴
		3. getLastAccessedTime() : 웹브라우저가 session에 마지막으로 접근한 시간을 리턴
		
	B. session객체의 속성
		한 번 생성된 session은 지정한 유효시간동안 유지되므로 웹애플리케이션을 실행하는 동안
		지속적으로 사용해야 하는 데이터를 저장하는 저장소로 session을 사용한다.
		request객체는 하나의 요청만 처리하는데 사용한다면 session객체는 웹브라우저의 여러 요청을
		처리하는 jsp페이지에서 공유된다.
		로그인한 회원정보 등 웹브라우저와 일대일로 관련된 값을 저장할 땐 cookie보다 session을 사용하는 게 좋다.
		
	C. cookie vs session
		cookie대신 session을 사용하는 가장 큰 이유는 session이 cookie보다 보안에 더 안정적이기 때문이다.
		cookie의 이름/값은 network를 통해 전달되므로 http프로토콜을 사용하는 경우 중간에 cookie값을
		해킹할 수 있지만 session은 오직 웹서버에만 저장되므로 중요한 자료를 보관할 때 알맞은 저장소가 된다.
		
		session을 사용하는 두번째 이유는 웹브라우저가 cookie를 지원하지 않을 경우 or 강제로 cookie를
		사용하지 못하게 할 경우 session은 cookie설정여부와 상관없이 사용가능하다
	
		1. session종료
			session을 유지할 필요가 없다면 session.invalidate()메서드를 사용해 session을 종료한다.
			session을 종료하려면 사용중인 session객체를 삭제하고 session객체에 저장되었던 속성정보도 삭제된다.
			
		2. session유효시간
			session은 최종 접속시간을 가지고 있는데 session객체를 사용할 때마다 최종 접속시간이 갱신된다.
			마지막 접근이후 일정시간 내에 다시 session에 접근하지 않을 경우엔 자동으로 session을 종료하는
			기능이 있다.
			
			session유효시간 설정
			a. web.xml에 <session-config>태그를 사용해 분단위로 지정
			b. setMaxInactivateInterval()메서드를 사용해 초단위로 지정
			
		3. request.getSession()메서드를 이용한 세션생성
			HttpSession(session객체)을 생성하는 또 다른 방법은 request객체의 getSession메서드를 이용하는 것이다.
			이 메서드는 현재의 요청과 관련된 session객체를 리턴하는데 session이 존재하면 해당 session을 리턴하고
			없으면 새로운 session을 생성해 리턴한다.
			
			session이 생성된 경우에만 session객체를 구하고 싶을 때 매개값으로 false를 지정하면
			session이 존재할땐 리턴하고 없을땐 null을 리턴한다
 -->
 <%
 	Date now = new Date();
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
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
	<div class="container" align="center">
		<h3>session 정보 읽기</h3>
		
		<h4>session id = <%= session.getId() %></h4>
		<h4>session 생성시간 = <%= session.getCreationTime() %></h4>
		<h4>session 최종접속시간 = <%= session.getLastAccessedTime() %></h4>
		<hr />
		
		<% now.setTime(session.getCreationTime()); %>
		<h4>session 생성시간 = <%= sdf.format(now) %></h4>
		
		<% now.setTime(session.getLastAccessedTime()); %>
		<h4>session 최종접속시간 = <%= sdf.format(now) %></h4>
	</div>
</body>
</html>





















