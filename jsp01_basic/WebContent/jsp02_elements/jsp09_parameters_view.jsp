<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 
	톰캣에서 get방식으로 전달되는 파라미터의 값을 읽어올 때 사용하는 문자셋은
	기본적으로 utf-8로 전달된다. 때문에 tomcat에선 별도로 문자셋을 설정하지 않아도
	utf-8문자셋을 사용한다. 하지만 utf-8이 아닌 문자셋을 get방식으로 전달하는 경우는
	server.xml에 <Connector>태그의 useBodyEncodingForURI속성을 true로 추가하면 된다.

	true로 설정할 경우엔 get방식으로 전달되는 파라미터값을 읽을 때 request객체의
	setCharacterEncoding("UTF-8")메서드를 호출해서 지정된 문자셋을 사용할 수 있게 한다.
 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp09_parameters_view.jsp</h1>
	<h2>요청된 파라미터 정보</h2>
	<h3><%= request %></h3>
	<hr />
	<h2>1. getParameter</h2>
	<h3><%= request.getParameter("name") %></h3>
	<h3><%= request.getParameter("addr") %></h3>
	<h3><%= request.getParameter("hobbies") %></h3>
	<hr />
	
	<h2>2. request.getParameterValues()</h2>
	<%
		String[] hobbies = request.getParameterValues("hobbies");
		if(hobbies != null) {
			for(String hobby:hobbies) {
	%>
				
				취미 = <%= hobby %> <br />
	<%
			}
		}
	%>
	<hr />
	<h2>3. request.getParameterNames()</h2>
	<%
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String param = params.nextElement();
	%>
			
			요청파라미터이름 = <%= param %> <br />
	<%
		}
	%>
	<hr />
	<h2>4. request.getParameterMap()</h2>
	<%
		Map<String, String[]> map = request.getParameterMap();
		String[] values = map.get("addr");
		if(values != null) {
			for(int i=0; i<values.length;i++) {
	%>
				요청파라미터(addr)의 값 = <%= values[i] %> <br />
	<%
			}
		}
	%>
	<hr />
	<%
		map = request.getParameterMap();
		values = map.get("hobbies");
		if(values != null) {
			for(int i=0; i<values.length;i++) {
	%>
				요청파라미터(hobbies)의 값 = <%= values[i] %> <br />
	<%
			}
		}
	%>
</body>
</html>