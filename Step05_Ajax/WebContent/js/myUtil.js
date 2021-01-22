 		function sel(a){
 			return document.querySelector(a);
 		}
 		
 		// 인자로 전달하는 object 를 이용해서 query 문자열을 만들어서 리턴하는 함수 만들기
		function toQueryString(obj){
			// 빈배열을 일단 만든다
			let arr=[];
			// 반복문 돌면서 obj 에 있는 정보를 "key=value" 형태로 만들어서 배열에 저장
			for(let key in obj){
				// value 는 인코딩도 해준다.
				let tmp=key+"="+encodeURIComponent(obj[key]);
				arr.push(tmp);
			}
			// query 문자열을 얻어낸다
			let queryString=arr.join("&");
			// 결과를 리턴해준다.
			return queryString;
		}
	
		// ajax 요청을 하고 Promise 객체를 리턴해준다.
		function ajaxPromise(url, method, data){
			if(method==undefined || method==null){
				method="GET";
			}
			if(data==undefined || data==null){
				data={};
			}
			// promise 객체 담을 변수 생성
			let promise;
			if(method=="GET"){ // 만약 GET 방식이라면
				//
				promise=fetch(url+"?"+toQueryString(data));
			}else if(method=="POST"){
				// fetch() 함수를 호출하고 리턴되는 promise
				promise=fetch(url,{
					method:"POST",
					headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
					body:toQueryString(data)
				})
			}
			return promise;
		}