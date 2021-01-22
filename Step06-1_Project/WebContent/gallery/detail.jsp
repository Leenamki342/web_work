<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 자세히 보여줄 갤러리 item 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 글 번호를 이용해서 갤러리 item 정보를 얻어온다.
	GalleryDto dto=GalleryDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/gallery/list.jsp">피카츄 사진첩</a>
			</li>
			<li class="breadcrumb-item active">상세 보기</li>
		</ul>
	</nav>
	<div class="col-6 col-md-4 text-center">
		<img src="${pageContext.request.contextPath }<%=dto.getImagePath()%>"/>
		<div class="card-body">
			<p class="card-text"><%=dto.getCaption() %></p>
			<p class="card-text">by <strong><%=dto.getWriter() %></strong></p>
			<p class="card-text"><small><%=dto.getRegdate() %></small></p>
		</div>
	</div>
	<%
		// session scope 에서 로그인된 아이디를 읽어온다.(null 일수도 있음)
		String id=(String)session.getAttribute("id");
	%>
	<div>
		<a href="list.jsp" class="btn btn-success" role="button">목록보기</a>
		<%if(dto.getWriter().equals(id)){ %>
			<a href="private/updateform.jsp?num=<%=dto.getNum()%>" class="btn btn-warning" role="button">수정</a>
			<a href="javascript:deleteConfirm()" class="btn btn-danger" role="button">삭제</a>
		<%} %>
	</div>
	<nav>
		<ul class="pagination justify-content-center">
			<%if(dto.getPrevNum() != 0){ %>
				<li class="page-item mr-3">
					<a class="page-link" href="detail.jsp?num=<%=dto.getPrevNum()%>">&larr; Prev</a>
				</li>
			<%}else{ %>
				<li class="page-item disabled mr-3">
					<a class="page-link" href="javascript:">Prev</a>
				</li>	
			<%} %>
			<%if(dto.getNextNum() != 0){ %>
				<li class="page-item">
					<a class="page-link" href="detail.jsp?num=<%=dto.getNextNum()%>">Next &rarr;</a>
				</li>
			<%}else{ %>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">Next</a>
				</li>	
			<%} %>
		</ul>
	</nav>
</div>
<script>
	function deleteConfirm(){
		let isDelete=confirm("갤러리를 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num=<%=dto.getNum()%>";
		}
	}
</script>
</body>
</html>