<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. GET 방식 파라미터로 전달되는 삭제할 글 번호를 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. DB 에서 삭제
	boolean isSuccess=CafeDao.getInstance().delete(num);
	// 3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
	<%if(isSuccess){ %>
		<script>
			alert("삭제 했습니다.");
			location.href="${pageContext.request.contextPath }/cafe/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("삭제 실패!");
			location.href="detail.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>