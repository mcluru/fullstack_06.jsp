<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	url관련태그는 url생성기능과 redirect처리기능을 제공한다.
 -->
 <!-- https://www.google.com/search?q=%EC%95%84%EC%9D%B4%EB%93%A4&oq=%EC%95%84%EC%9D%B4%EB%93%A4&aqs=chrome.0.69i59j46i131i340i433i512j0i131i433i512l6j46i199i465i512.6320j0j7&sourceid=chrome&ie=UTF-8 -->
 <c:url var="search" value="https://www.google.com/search">
 	<c:param name="q" value="아이들"/>
 	<c:param name="oq" value="아이들"/>
 </c:url>
 
 <ul>
 	<li><a href="${ search }">구글에서 아이들 검색하기</a></li>
 	<li><c:url value="jsp02_if.jsp"></c:url></li>
 	<li><c:url value="./jsp02_if.jsp"></c:url></li>
 </ul>
 
 <c:redirect url="http://www.google.com"/>