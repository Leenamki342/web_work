<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼 전송되는 수정할 글의 번호, 내용을 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String caption=request.getParameter("caption");
	// 2. DB 에 수정 반영하고
	GalleryDto dto=new GalleryDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setCaption(caption);
	boolean isSuccess=GalleryDao.getInstance().update(dto);
	// 3. 응답한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("수정했습니다.");
			location.href="${pageContext.request.contextPath }/gallery/detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<h1>알림</h1>
		<p>
			글 수정 실패!
			<a href="updateform.jsp?num=<%=num%>">다시 시도</a>
		</p>
	<%} %>
</body>
</html>