<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. GET 방식 파라미터로 전달되는 수정할 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. 글 번호를 이용해서 수정할 글 정보를 DB 에서 읽어온다.
	GalleryDto dto=GalleryDao.getInstance().getData(num);
	// 3. 글 수정 폼을 응답한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/cafe/list.jsp">갤러리 목록</a>
			</li>
			<li class="breadcrumb-item active">갤러리 수정 폼</li>
		</ul>
	</nav>	
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<div class="form-group">
			<label>작성자</label>
			<input class="form-control" type="text" value="<%=dto.getWriter() %>" disabled />
		</div>
		<div class="form-group">
			<label for="caption">내용</label>
			<input class="form-control" type="text" name="caption" id="caption" value="<%=dto.getCaption() %>" />
		</div>
		<div>
			<label>사진</label>
			<img src="${pageContext.request.contextPath }<%=dto.getImagePath() %>" />
		</div>
		<button class="btn btn-success" type="submit" onclick="submitContents(this);">수정확인</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
</div>
</body>
</html>