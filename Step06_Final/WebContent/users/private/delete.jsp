<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 로그인된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//2. 해당 아이디를 이용해서 DB 에서 삭제
	UsersDao.getInstance().delete(id);
	// 3. 로그아웃 처리를 하고 응답한다.
	session.removeAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
<div class="contain">
	<h1>알림</h1>
	<p>
		<strong><%=id %></strong> 님 탈퇴되셨습니다.
		<a href="${pageContext.request.contextPath }/" >인덱스로가기</a>
	</p>
</div>
</body>
</html>