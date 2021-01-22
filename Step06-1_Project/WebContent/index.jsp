<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope 에 "id" 라는 키값으로 저장된 문자열이 있는지 읽어온다.
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	#back{
		background-color: #FFC079;
		font-size: 2.3rem;
  		color: blue;
	}
	h1{
		font-family: fantasy;
		color: orange;
	}
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<%-- 만일 id 가 null 이 아니면 로그인을 한 상태이다. --%>
	<%if(id!=null){ %>
		<p>
			<a href="users/private/info.jsp"><%=id %></a> 님 로그인중...
			<a href="users/logout.jsp">로그아웃</a>
		</p>
	<%}%>
	<div class="row justify-content-center shadow-sm p-3 mb-5 bg-white rounded">
		<div class="col-8">
			<h1 class="display-1"><img style="width:120px;height:120px" src="${pageContext.request.contextPath }/images/Pikachu.png"/>Pikachu's Cafe</h1>
		</div>
	</div>
	<div style="text-align:center" class="shadow-md p-3 mb-5 rounded" id="back" >
		<div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item list-group-item-warning"><a href="cafe/list.jsp"><strong>게시판</strong></a></li>
			</ul>
		</div>
		<div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item list-group-item-light"><a href="file/list.jsp"><strong>자료실</strong></a></li>
			</ul>
		</div>
		<div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item list-group-item-warning"><a href="gallery/list.jsp"><strong>사진첩</strong></a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>