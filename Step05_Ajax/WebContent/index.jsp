<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<!-- emmet -> snippets 에서 cpath 저장 ${pageContext.request.contextPath } -->
	<!--
		웹브라우저에서 톰캣에 요청할때 사용되는 방식 구분
		1. link click => GET
		2. form submit! => method 지정에 따라 다름 / 둘다 가능
		3. javascript(ajax request / xml http request)
		   ( 페이지 전환없이 모든 작업을 처리함 ) 
	-->
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="test/ajax01.jsp">ajax 테스트1</a></li>
		<li><a href="promise/test01.jsp">promise 테스트1</a></li>
		<li><a href="user/signup_form.jsp">회원가입 양식</a></li>
	</ul>
</body>
</html>