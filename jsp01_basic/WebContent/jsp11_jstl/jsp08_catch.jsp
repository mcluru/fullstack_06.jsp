<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	c:catch var="exName"의 형태로 exception이 발생하면 해당 익셉션객체를 exName에 저장하는 태그.
	그 이후 exName객체가 있을 경우 익셉션처리 할 수 있다.
 -->
 
 <h1>c:catch</h1>
 
 <c:catch var="e">
 	name 파라미터의 값 = <%= request.getParameter("name") %> <br />
 	<%
 		if(request.getParameter("name").equals("hong")) {
 	%>
 			${param.name}회원의 이름은 홍길동입니다
 	<%
 		}
 	%>
 </c:catch>
 <hr />
 
 <c:if test="${e != null}">
 	에러가 발생했습니당<br />
 	${e}
 </c:if>