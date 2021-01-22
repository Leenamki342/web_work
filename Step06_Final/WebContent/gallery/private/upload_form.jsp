<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form.jsp</title>
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
				<a href="${pageContext.request.contextPath }/gallery/list.jsp">갤러리 목록 보기</a>
			</li>
			<li class="breadcrumb-item active">이미지 업로드</li>
		</ul>
	</nav>
	<h1>이미지 업로드</h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="caption">설명</label>
			<input class="form-control" type="text" name="caption" id="caption" />
		</div>
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<button class="btn btn-success" type="submit">업로드</button>
	</form>
</div>
</body>
</html>