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
			<li class="breadcrumb-item active">비밀번호 수정 폼</li>
		</ul>
	</nav>	
	<form action="pwd_update.jsp" method="post" id="myForm">
		<div class="form-group">
			<label for="pwd">기존 비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" />
		</div>
		<div class="form-group">
			<label for="newPwd">새로운 비밀번호</label>
			<input class="form-control" type="password" name="newPwd" id="newPwd" />
			<div class="invalid-feedback">사용가능한 비밀번호입니다.</div>
			<small class="form-text text-muted">비밀번호는 4글자 이상 입력해야 합니다.</small>
		</div>
		<div class="form-group">
			<label for="newPwd2">새로운 비밀번호 확인</label>
			<input class="form-control" type="password" id="newPwd2" />
			<div class="invalid-feedback">비밀번호가 다릅니다!</div>
		</div>
		<button class="btn btn-success" type="submit">수정하기</button>
		<button class="btn btn-danger" type="reset">리셋</button>
	</form>
</div>
<script>
	// 폼에 submit 이벤트가 일어났을 때 실행할 함수를 등록하고
	document.querySelector("#myForm")
	.addEventListener("submit", function(event){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		// 새로운 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1!=pwd2){
			alert("비밀번호를 확인하세요!");
			event.preventDefault(); // 폼 전송 막기
		}
		
	});
	// 비밀번호 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isPwdValid=false;
	
	// document.querySelector("#pwd, #pwd2").addEventListener("input",function(){});
	$("#newPwd, #newPwd2").on("input", function(){ // 위의 코딩을 jquery 방식으로 변경
		// input 이벤트가 언제 일어났는지 확인 요망!
		// console.log("input!!");
		
		// document.querySelector("#pwd").value();
		// 입력한 두 비밀번호를 읽어온다.
		let newPwd=$("#newPwd").val();
		let newPwd2=$("#newPwd2").val();
		
		// 일단 모든 검증 클래스를 제거하고
		$("#newPwd").removeClass("is-valid is-invalid");
		
		// 만약 비밀번호를 4글자 이상 입력하지 않았다면
		if(newPwd.length<4){ 
			// 비밀번호가 유효하지 않다고 표시
			$("#newPwd").addClass("is-invalid");
			isPwdValid=false;
			// 함수 종료
			return;
		}
		
		// 두 비밀번호가 같은지 확인해서
		if(newPwd==newPwd2){ // 만약 같으면
			// 유효하다는 클래스를 추가
			$("#newPwd").addClass("is-valid");
			console.log("사용가능합니다.")
			isPwdValid=true;
		}else{ // 다르면
			// 유효하지 않다는 클래스 추가
			$("#newPwd").addClass("is-invalid");
			console.log("비밀번호가 다릅니다.")
			isPwdValid=false;
		}
	});
</script>
</body>
</html>