<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/ajax05.jsp</title>
</head>
<body>
	<h1>ajax POST 전송 예제</h1>
	<input type="text" id="inputName" placeholder="이름입력..." />
	<input type="text" id="inputAddr" placeholder="주소입력..." />
	<button id=sendBtn>전송</button>
	<script>
		document.querySelector("#sendBtn")
		.addEventListener("click", function(){
			// 입력한 문자열 읽어오기
			let name=document.querySelector("#inputName").value;
			let addr=document.querySelector("#inputAddr").value;
			// query 문자열 구성하기 ( 특수기호를 encoding 해서 보낸다. )
			let queryString="name="+encodeURIComponent(name)
				+"&addr="+encodeURIComponent(addr);
			/*
				[ POST ] 방식으로  전송하기 위해
				1. method 를 "POST"
				2. 정확한 요청 헤더 정보 제공
				3. 전송할 데이터를 query 문자열로 구성해서 요청의 몸통(body) 에 전달하기
			*/
			// fetch() 함수를 이용해서 ajax POST 전송하기
			fetch("add.jsp", {
				method:"POST",
				headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
				body:queryString
			})
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
		});
	</script>
</body>
</html>