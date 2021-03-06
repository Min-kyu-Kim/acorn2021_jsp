<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/ajax01.jsp</title>
</head>
<body>
	<h1>ajax 테스트 페이지</h1>
	<p>페이지 전환 없이 javascript로 웹서버에 요청을 하는 방법이 있습니다.</p>
	<button id="getBtn">요청하기</button>
	<button id="getBtn2">요청하기2</button>
	<button id="getBtn3">요청하기3</button>
	<button id="getBtn4">요청하기4</button>
	<div id="result">
	
	</div>
	<script>
		document.querySelector("#getBtn").addEventListener("click",function(){
			//fetch()함수를 이용해서 get_data.jsp 페이지에 GET 방식 요청을 한다.
			fetch("get_data.jsp")
			.then(function(response){
				//단순 문자열인경우 .text()를 호출해서 리턴해주면
				//아래의 then() 안에 있는 함수의 인자로 해당문자열이 전달된다.
				return response.text();	
			})
			.then(function(data){
				//전달된 문자열(서버가 응답한)을 여기서 사용하면 된다.
				console.log(data);
			});
		});
		
		document.querySelector("#getBtn2").addEventListener("click",function(){
			//fetch()함수를 이용해서 get_data.jsp 페이지에 GET 방식 요청을 한다.
			fetch("get_data2.jsp")
			.then(function(response){
				
				return response.text();	
			})
			.then(function(data){
				console.log(data);
				//응답된 문자열을 아이디가 result인 요소에 HTML로 해석하라고 넣어주기
				document.querySelector("#result").innerHTML=data;
			});
		});
		
		document.querySelector("#getBtn3").addEventListener("click",function(){
			//fetch()함수를 이용해서 get_data.jsp 페이지에 GET 방식 요청을 한다.
			fetch("get_data3.jsp")
			.then(function(response){
				//JSON 문자열을 서버에서 응답했을때는 .json() 함수를 호출해서 리턴한다.
				return response.json();	
			})
			.then(function(data){
				//data는 {num:x , name:"xxx" } 형식의 object 이다.
				//let data=JSON.parse(data) data가 object가 아닐경우 바꿔주어야함.
				console.log(data);
				//p요소를 동적으로 만들어서
				let p1=document.createElement("p");
				//원하는 innerText 를 출력하고
				p1.innerText="번호:"+data.num+" 이름:"+data.name;
				//아이디가 result인 요소에 추가하기
				document.querySelector("#result").append(p1);	
			});
		});
		
		document.querySelector("#getBtn4").addEventListener("click",function(){
			//fetch()함수를 이용해서 get_data.jsp 페이지에 GET 방식 요청을 한다.
			fetch("get_data4.jsp")
			.then(function(response){
				//JSON 문자열을 서버에서 응답했을때는 .json() 함수를 호출해서 리턴한다.
				return response.json();	
			})
			.then(function(data){
				//data는 배열 이다.
				console.log(data);
				//ul 요소를 만들어서
				let ul=document.createElement("ul");
				// 반복문 돌면서
				for(let i=0; i<data.length; i++){
					//배열에 저장된 문자열을 하나씩 얻어내서
					let tmp=data[i];
					//li 요소를 만들고
					let li=document.createElement("li");
					//li 의 innerText 로 문자열을 추가하고
					li.innerText=tmp;
					//ul 요소에 누적 시키기
					ul.append(li);
				}
				//id가 result인 요소에 ul 추가하기
				document.querySelector("#result").append(ul);
			});
		});
	
	</script>
</body>
</html>