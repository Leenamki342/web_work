<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/logout.jsp</title>
</head>
<body>
	<%
		// 1. 세션 영역에 "id" 이라는 키값으로 저장된 값 삭제하기
		session.removeAttribute("id");
		// 2. 응답하기 (특정 페이지(index.jsp)로 요청을 다시 하라고 리다일렉트 응답)
		String cPath=request.getContextPath();
		response.sendRedirect(cPath+"/index.jsp");
	%>
	<p> 로그아웃 하셨습니다. </p>
	<a href="${pageContext.request.contextPath }/index.jsp">인덱스로 가기</a>
</body>
</html>