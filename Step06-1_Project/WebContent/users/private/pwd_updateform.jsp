<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="info.jsp">개인정보</a>
			</li>
			<li class="breadcrumb-item active">비밀번호 수정 폼</li>
		</ul>
	</nav>
	<div>
		<div>
			<form action="pwd_update.jsp" method="post" id="myForm">
				<div class="form-group">
					<label for="pwd">기존 비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd" />
				</div>
				
				<div class="form-group">
					<label for="newPwd">새로운 비밀번호</label>
					<input class="form-control" type="password" name="newPwd" id="newPwd" />
					<div class="invalid-feedback">비밀번호를 확인하세요</div>
					<small class="form-text text-muted">비밀번호는 5~10 글자 이내로 입력해야 합니다.</small>
				</div>
				
				<div class="form-group">
					<label for="newPwd2">새로운 비밀번호 확인</label>
					<input class="form-control" type="password" id="newPwd2" />
					<div class="invalid-feedback">비밀번호가 다릅니다!</div>
				</div>
				
  				<button class="btn btn-primary" type="submit">수정</button>
			</form>
		</div>
	</div>	
</div>
<script>
	// [비밀번호를 검증할 정규 표현식]
	// 5~10 글자 이내인지 검증
	let reg_pwd=/^.{5,10}$/;
	
	// 비밀번호 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isPwdValid=false;

	$("#newPwd, #newPwd2").on("input", function(){ // 위의 코딩을 jquery 방식으로 변경
		// input 이벤트가 언제 일어났는지 확인 요망!
		// console.log("input!!");
		
		// document.querySelector("#pwd").value();
		// 입력한 두 비밀번호를 읽어온다.
		let newpwd=$("#newPwd").val();
		let newpwd2=$("#newPwd2").val();
		
		// 일단 모든 검증 클래스를 제거하고
		$("#newPwd").removeClass("is-valid is-invalid");
		
		// 비밀번호가 정규표현식에 매칭되지 않으면
		if(!reg_pwd.test(newpwd)){
			// 비밀번호가 유효하지 않다고 표시
			$("#newPwd").addClass("is-invalid");
			isPwdValid=false;
			// 함수 종료
			return;
			
		}
		// 두 비밀번호가 같은지 확인해서
		if(newpwd==newpwd2){ // 만약 같으면
			// 유효하다는 클래스를 추가
			$("#newPwd").addClass("is-valid");
			isPwdValid=true;
		}else{ // 다르면
			// 유효하지 않다는 클래스 추가
			$("#newPwd").addClass("is-invalid");
			isPwdValid=false;
		}
	});
</script>
</body>
</html>