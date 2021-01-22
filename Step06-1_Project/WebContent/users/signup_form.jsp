<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와보기
	String url=request.getParameter("url");
	// 만약 넘어오는 값이 없다면
	if(url==null){
		// 로그인 후에 index.jsp 페이지로 가도록 절대 경로를 구성
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* example 로그인 폼 만들기 위한 css*/
	html,
	body {
	  height: 100%;
	}
	
	body {
	  display: -ms-flexbox;
	  display: flex;
	  -ms-flex-align: center;
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: white;
	}
	
	.form-signin {
	  width: 100%;
	  max-width: 330px;
	  padding: 15px;
	  margin: auto;
	}
	
	.form-signin .form-control {
	  position: relative;
	  box-sizing: border-box;
	  height: auto;
	  padding: 10px;
	}
	
	.form-signin .form-control:focus {
	  z-index: 2;
	}
	
	.form-signin input[type="email"] {
	  margin-bottom: 10px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>

<form class="form-signin" action="signup.jsp" method="post" id="myForm" novalidate>
	<%-- 원래 가려던 목적지 정보를 url 이라는 파라미터명으로 전송될 수 있도록 한다. --%>
	<input type="hidden" name="url" value="<%=url %>"/>
  	<h1 class="h1 mb-3 font-weight-normal">회원가입</h1>
  	
	<label for="id">아이디</label>
	<input class="form-control" type="text" name="id" id="id" />
	<small class="form-text text-muted">영문자 소문자로 시작하고 5~10 글자 이내로 입력하세요!</small>
	<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
	
	<label for="pwd">비밀번호</label>
	<input class="form-control" type="password" name="pwd" id="pwd" />
	<small class="form-text text-muted">비밀번호는 5~10 글자 이내로 입력해야 합니다.</small>
	<div class="invalid-feedback">비밀번호를 확인하세요</div>
		
	<label for="pwd2">비밀번호 확인</label>
	<input class="form-control" type="password" name="pwd2" id="pwd2" />
		
	<label for="email">이메일</label>
	<input class="form-control" type="email" name="email" id="email" />
	<div class="invalid-feedback">이메일 형식을 확인하세요.</div>
	
 	<button class="btn btn-lg btn-outline-success btn-block" type="submit">가입</button>
 	<p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
</form>
<script>
	// [아이디를 검증할 정규 표현식]
	// 영문자 소문자로 시작하고 5~10 글자 이내인지 검증
	let reg_id=/^[a-z].{4,9}$/;
	
	// [비밀번호를 검증할 정규 표현식]
	// 5~10 글자 이내인지 검증
	let reg_pwd=/^.{5,10}$/;
	
	// [이메일을 검증할 정규 표현식] (정확히 검증하려면 javascript 이메일 정규 표현식 검색해서 사용!)
	// @ 가 포함되어 있는지 검증 
	let reg_email=/@/;
	
	// 정규 표현식을 문자열로 나타낸다면 => let reg = new RegExp("@");
	
	// 십진수 숫자만 찾는 정규 표현식을 나타낸다면 => [0-9] == [\d]     /     [^0-9] == [\D]
	
	// [a-zA-Z0-9] == [\w]   /   [^a-zA-Z0-9] == [\W]
	
	// 한글 한글자 찾는 정규 표현식 => [가-힁]
	
	// 이름을 찾는 정규 표현식 => /(kim | lee | park)[ ]chul/
	
	// 정규 표현식 뒤에 i 를 붙인다면 대문자, 소문자 가리지 않는다는 뜻. ex) /@/i;

	// 아이디 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isIdValid=false;
	// 비밀번호 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isPwdValid=false;
	// 이메일 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isEmailValid=false;
	// 폼 전체의 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isFormValid=false;

	
	// 폼에 submit 이벤트가 일어 났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
	// id 가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록
	$("#myForm").on("submit", function(){
		// 폼 전체의 유효성을 얻어낸다.
		isFormValid=isIdValid&&isPwdValid&&isEmailValid;
		// 만일 폼이 유효하지 않다면
		if(!isFormValid){
			return false; // 폼전송 막기
		}
	});
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 이메일을 입력했을때 실행할 함수 등록
	$("#email").on("input", function(){
		let inputEmail=$("#email").val();
		// 모든 검증 클래스 제거
		$("#email").removeClass("is-valid is-invalid");
		// 만일 이메일이 정규 표현식에 매칭되지 않으면
		if(!reg_email.test(inputEmail)){
			isEmailValid=false;
			$("#email").addClass("is-invalid");
		}else{
			isEmailValid=true;
			$("#email").addClass("is-valid");
		}
	});
	
	// id 가 pwd1 와 pwd2 인 요소에 input(입력) 이벤트가 일어났을때 실행할 함수 등록
	// document.querySelector("#pwd, #pwd2").addEventListener("input",function(){});
	$("#pwd, #pwd2").on("input", function(){ // 위의 코딩을 jquery 방식으로 변경
		// input 이벤트가 언제 일어났는지 확인 요망!
		// console.log("input!!");
		
		// document.querySelector("#pwd").value();
		// 입력한 두 비밀번호를 읽어온다.
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		
		// 일단 모든 검증 클래스를 제거하고
		$("#pwd").removeClass("is-valid is-invalid");
		
		// 비밀번호가 정규표현식에 매칭되지 않으면
		if(!reg_pwd.test(pwd)){
			// 비밀번호가 유효하지 않다고 표시
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			// 함수 종료
			return;
			
		}
		
		// 두 비밀번호가 같은지 확인해서
		if(pwd==pwd2){ // 만약 같으면
			// 유효하다는 클래스를 추가
			$("#pwd").addClass("is-valid");
			isPwdValid=true;
		}else{ // 다르면
			// 유효하지 않다는 클래스 추가
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
		}
	});
	
	// $.ajax({key:value}); 가 전체적인 구조이다.
	// 아이디 입력란에 입력했을때 실행할 함수 등록
	$("#id").on("input", function(){
		// 1. 입력한 아이디 읽어와서
		let inputId=$("#id").val();
		
		// 2. 서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
		// 일단 모든 검증 클래스를 제거하고
		$("#id").removeClass("is-valid is-invalid");
		
		// 입력한 문자열이 정규 표현식과 매칭되는지 테스트
		if(!reg_id.test(inputId)){ // 만약 매칭되지 않는다면
			// 아이디가 유효하지 않다고 표시
			$("#id").addClass("is-invalid");
			// 아이디가 유효하지 않으면 false
			isIdValid=false;
			// 함수 종료 ( 서버에 값이 넘어가지 않음 )
			return;
		}
		$.ajax({
			url:"checkid.jsp", // 요청 경로
			method:"GET", // 전달 방식
			data:"inputId="+inputId, // 어떤 파라미터명으로 어떤 값을 전달할지
			success:function(responseData){
				/*
					checkid.jsp 페이지에서 응답할때
					contentType="application/json" 이라고 설정하면
					함수의 인자로 전달되는 responseData 는 object 이다.
					{isExist:true} or {isExist:false}
					형식의 object 이기 때문에 바로 사용할 수 있다.
				*/
				console.log(responseData);
				if(responseData.isExist){ // 이미 존재하는 아이디인 경우
					$("#id").addClass("is-invalid");
					isIdValid=false;
				}else{ // 존재하지 않는 아이디 즉 사용가능한 아이디인 경우
					$("#id").addClass("is-valid");
					// 아이디가 4글자 이상이고 존재하지 않을 경우 유효하다고 표시한다.
					isIdValid=true;
				}
			}
		});
	});
</script>
</body>
</html>