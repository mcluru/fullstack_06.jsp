<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 
	JSTL(JSP Standard Tag Library)
	
	JSP는 스크립트릿과 표현식 등 스크립트코드와 html tag들의 코드가 뒤섞여 사용하므로
	가독성이 떨어지고 코딩이 복잡해 개발하기 불편하다.
	JSP는 새로운 tag를 포함한 표준라이브러리 형태로 제공해서 보다 쉽고 가독성 좋게 코딩할 수 있도록
	제공하는 기능이 있는데, JSP페이지에서 많이 사용되는 논리적인 판단(if), 반복처리(for), 포맷처리 등을
	쉽게 할 수 있도록 표준으로 만들어 라이브러리 형태로 제공하는 게 JSTL이다.
	
	jstl-??-??.jar파일을 다운로드(https://mvnrepository.com//artifact/javax.servlet/jstl/1.2)
	WEB-INF/lib폴더에 저장하면 jstl 바로 사용가능.
	
	
	A. JSTL이 제공하는 Tag Library
	
		라이브러리	주요기능									접두어	관련uri
		---------- 	------------------------------------------	------ 	--------------------------------------
		core 		변수지원, 흐름제어(if, for), url처리		c 		http://java.sun.com/jsp/jstl/core
		XML 		xml코어, 흐름제어, 변환처리					x 		http://java.sun.com/jsp/jstl/xml
		국제화 		다국어지원, 지역, 메세지/숫자/날짜형식		fmt 	http://java.sun.com/jsp/jstl/fmt
		DB 			sql, 메세지형식								sql 	http://java.sun.com/jsp/jstl/sql
		함수		Collection처리, String처리					fn 		http://java.sun.com/jsp/jstl/function
		
		
	B. core 태그
		
		기능		태그		설명
		----------  ----------  --------------------------------------------------------------------
		변수지원	set 		JSP페이지에서 사용할 변수를 선언
					remove 		선언된 변수를 JSP페이지에서 삭제
		흐름제어	if 			조건에 따라 흐름제어, 단순 if문
					choose 		다중조건처리(if~else if~)
					forEach 	collection이나 map계열의 항목을 반복처리
					forTokens 	구분자로 분리되는 문자열(token)을 처리
		URL 		import 		url에 해당하는 resource를 JSP페이지에 로딩
					redirect 	지정한 경로로 redirect를 실행
					url 		url을 재작성
		기타태그 	catch 		exception처리
					out 		JspWriter에 지정한 내용을 처리
		
		
	C. 국제화 태그
		특정지역에 따라 알맞는 메세지를 출력할 때 사용.
		ex) 한글 브라우저로 접속하면 한글메세지를 출력, 영문브라우저로 접속하면 영문메세지로 출력할 경우
			국제화태그를 사용하면 쉽게 적용가능.
		
		기능		태그				설명
		----------  --------------- 	--------------------------------------------------------------------
		Locale 		setLocaler 			지역(Locale)을 설정
					requestEncoding 	요청파라미터의 문자셋의 인코딩을 지정
		Message 	bundle 				사용할 언어번들을 지정
					message 			지역에 해당하는 메세지 출력
					setBundle 			리소스번들을 로딩 후 특정 변수에 저장
		format 		formatNumber 		숫자형식을 지정
					formatDate 			날짜형식을 지정
					parseDate 			날짜형식의 문자열을 Date객체로 파싱
					parseNumber 		숫자형식의 문자열을 Number객체로 파싱
					setTimeZone 		시간대 정보를 특정변수에 저장
					timeZone 			시간대를 저장
		
					
		1. Locale지정태그
			fmt:setLocale 		: 국제화태그를 사용할 지역(Locale)을 설정
			fmt:requestEncoding : 요청파라미터를 인코딩할 문자셋을 설정
			
			웹브라우저는 Accept-Language헤더를 사용해서 수용가능한 언어목록을 전송하는데,
			JSTL국제화태그들은 이 헤더의 값을 이용해 언어별로 알맞은 언어처리를 한다.
			ex) 메세지를 출력해주는 message태그는 Accept-Language의 값이 'ko'인 경우 한글메세지 우선처리.
																		 'en'인 경우 영문메세지 우선처리.
			
			국제화 태그가 Accept-Language헤더에 지정한 언어가 아닌 경우 다른 언어를 사용하도록 지정할 때
			사용하는 태그가 fmt:setLocale태그다.
			
		2. Resource Bundle
			
			메세지태그에서 사용할 리소스번들파일을 작성할 때 메세지 번들파일은 classpath에 위치해야하므로
			WEB-INF/classes폴더나 WEB-INF/lib에 포함된 jar파일에 포함시켜야 한다.
			리소스번들파일은 기본적으로 java.util.Porperties클래스를 사용해 읽어오므로 번들파일의 확장자는
			properties다.
			
			리소스번들파일에서 중요한 점은 리로소번들파일의 이름을 정해진 규칙에 따라 작성해야 한다.
			"번들이름_국가코드.properties"의 형식으로 작성하는데 국가코드는 생략가능하다.
			
		3. Message 태그
			
			fmt:bundle 	  : 태그 body에서 사용할 리소스번들을 지정
			fmt:message   : 메세지출력
			fmt:setBundle : 특정메세지를 사용할 경우 번들파일을 설정
			
		4. format 태그
			
			숫자출력과 파싱 : fmt:formatNumber, fmt:parseNumber
			날짜출력과 파싱 : fmt:formatDate, fmt:parseDate
			시간대설정 		: fmt:setTimeZone, fmt:fmtZone
 -->
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
	if(false) {
	%>
		<h2>${"참입니다"}</h2>
	<%
	} else {
	%>
		<h2><%= "거짓입니다" %></h2>
	<%
	}
	%>
	<hr />
	
	<c:if test="true">
		<h2>${"참입니다"}</h2>
	</c:if>
	
</body>
</html>