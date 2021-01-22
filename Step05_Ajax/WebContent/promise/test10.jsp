<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test09.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
/*
 *  Promise 는
 	언제 끝날지 모르는 불확실한 비동기 작업을
 	콜백지옥에 빠지지 않고
 	순서대로 수행할때 사용한다.
 	- 특히 작업이 실패했을때 처리가 훨씬 수월함.
 */
	function openDoor(){
		return new Promise(function(resolve){
			setTimeout(function(){
				console.log("문을 여는데 1초 걸렸습니다.");
				resolve();
			}, 1000);
		});
	}
	function putElephant(){
		return new Promise(function(resolve, reject){
			setTimeout(function(){
				// 테스트로 랜덤하게 실패 되도록 한다.
				let ranNum=parseInt(Math.random()*2);// 0 또는 1 랜덤한 정수 발생
				// 코끼리를 넣다가 때로는 넣을수없는 상황일때
				if(ranNum==1){
					console.log("코끼리를 집어넣는데 3초 걸렸습니다.");
					resolve();
				}else{
					// reject 함수 호출하면서 전달한 데이터는 .catch() 안에 있는 함수의
					// 인자로 전달된다.
					reject("코끼리가 너무 커!!");
				};
			}, 3000);
		});
	}
	function closeDoor(){
		return new Promise(function(resolve){
			setTimeout(function(){
				console.log("문 닫는데 2초 걸렸습니다.");
				resolve();
			}, 2000);
		});
	}
	
	openDoor()
	.then(function(){
		return putElephant();
	})
	.then(function(){
		return closeDoor();
	})
	.catch(function(err){
		console.log(err);
	});
</script>
</body>
</html>