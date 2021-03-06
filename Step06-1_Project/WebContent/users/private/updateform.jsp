<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width: 300px;
		height: 300px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	/* 프로필 업로드 폼을 화면에 안보이게 숨긴다. */
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<%
	// 세션 영역에 저장된 아이디를 이용해서
	String id=(String)session.getAttribute("id");
	// DB 에 저장된 가입정보를 읽어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="info.jsp">개인 정보</a>
			</li>
			<li class="breadcrumb-item active">개인정보 수정</li>
		</ul>
	</nav>
	<h1>개인정보 수정</h1>
	<p><strong>프로필 이미지</strong></p>
	<a id="profileLink" href="javascript:">
		<%if(dto.getProfile() == null){ %>
			<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-person" viewBox="0 0 60 60">
				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
			</svg>
		<%}else{%>
			<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>" 
				id="profileImage"/>
		<%} %>
	</a>
	<br />
	<small>프로필 이미지를 선택하시면 변경 가능합니다.</small>
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="id"><strong>아이디</strong></label>
			<input class="form-control" type="text" id="id" value="<%=dto.getId() %>" disabled />
		</div>
		<div class="form-group">
			<label for="email"><strong>이메일</strong></label>
			<input class="form-control" type="text" id="email" name="email" value="<%=dto.getEmail() %>" />
		</div>
		<br />
		<button class="btn btn-success" type="submit">수정</button>
	</form>
	<br />
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
		<label for="image">프로필 이미지 선택</label>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" />
		<button class="btn btn-success" type="submit">업로드</button>
	</form>
</div>
<script>
	// 다시 확인하기!!!!!
	// 프로필 링크를 클릭했을때 실행할 함수 등록
	$("#profileLink").on("click", function(){
		// 아이디가 image 인 요소를 강제 클릭하기
		$("#image").click();
	});
	// 이미지를 선택했을때 실행할 함수 등록
	$("#image").on("change", function(){
		// 폼을 강제 제출해서 선택된 이미지가 업로드 되도록한다.
		$("#profileForm").submit();
	});
	
</script>
</body>
</html>