<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/play.jsp</title>
</head>
<body>
	<%
		// 로그인된 아이디 읽어오기
		String id=(String)session.getAttribute("id");
		if(id==null){ // 만약 로그인하지 않으면
			// 강제로 로그인 폼으로 리다일렉트 시킨다.
			String cPath=request.getContextPath();
			response.sendRedirect(cPath+"/test/loginform.jsp");
		}
	%>
	<p><strong><%=id %></strong> 님 신나게 놀죠~! </p>
	<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>