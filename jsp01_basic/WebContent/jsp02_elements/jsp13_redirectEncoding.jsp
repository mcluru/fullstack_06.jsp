<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String value = "안녕하세요?";
	// sendRedirect할 경우 한글이 포함되어잇으면 인코딩해서 전달해야한다.
	// jsp09_parameters.jsp?hello=안녕하세요? 형태로 전달되면 에러가 발생한다
	value = URLEncoder.encode(value, "utf-8");
	// 안녕하세요? 인코딩 -> 안녕하세요%3F
	// URLDecoder
	// value = URLDecoder.decode(value,"utf-8");
	// decode 안녕하세요%3F -> 안녕하세요?
	response.sendRedirect("jsp09_parameters.jsp?name=" + value);
%>