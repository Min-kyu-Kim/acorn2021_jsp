<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#con{
		margin-top:5rem;
	}
	.form-group{
		width:20rem;
	}
</style>
</head>
<body>
<jsp:include page="../include/blogbasic.jsp"></jsp:include>
<div class="container" id="con">
	<!-- 
		
		[novalidate로 웹 브라우저 자체의 검증기능 사용하지 않기!]
	 	<input type="email"/> 같은 경우 웹브라우저가 직접 개입 하기도 한다.
	 	해당기능 사용하지 않기 위해서는 novalidate를 form에 명시해야 한다.
	 
	 -->
	<form action="signup.jsp" method="post" id="myForm" novalidate>
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text-muted">영문자 소문자로 시작하고 5~10글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">사용 할 수 없는 아이디 입니다.</div>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">5~10글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2"/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" name="email" id="email"/>
			<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
		</div>
		<div class="form-inline mb-5 justify-content-start">
			<button class="btn btn-info" type="submit">가입</button>
		</div>
	</form>
	<jsp:include page="../include/blogfooter.jsp"></jsp:include>
</div>
<script>
	//[아이디를 검증할 정규 표현식]
	//영문자 소문자로 시작하고 5~10글자 이내인지 검증
	let reg_id=/^[a-z].{4,9}$/;
	//[비밀번호를 검증할 정규 표현식]
	//5~10글자 이내 인지 검증
	let reg_pwd=/^.{5,10}$/;
	//[이메일을 검증할 정규 표현식](정확히 검증하려면 javascript 이메일 정규 표현식 검색해서 사용!)
	//@ 가 포함되어 있는지 검증
	let reg_email=/@/;
	
	//아이디 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isIdValid=false;
	//비밀번호 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isPwdValid=false;
	//이메일 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isEmailValid=false;
	//폼 전체의 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isFormValid=false;
	
	//폼에 submit 이벤트가 일어났을때 jquery를 활용해서 폼에 입력한 내용 검증하기
	
	//id가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록
	$("#myForm").on("submit",function(){
		//폼 전체의 유효성 여부를 얻어낸다.
		isFormValid=isIdValid&&isPwdValid&&isEmailValid;
		//만일 폼이 유효하지 않는다면
		if(!isFormValid){
			return false; //폼 전송 막기
		}
			
		/*
		//만일 아이디를 제대로 입력하지 않았으면 폼 전송을 막는다.
		if(!isIdValid){
			
			return false;
		}
		//만일 비밀번호를 제대로 입력하지 않았으면 폼 전송을 막는다
		if(!isPwdValid){
			return false;
		}
		//입력한 두 비밀번호를 읽어와서 다르게 입력했으면 폼 전송 막기
		let pwd1=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		if(pwd1!=pwd2){
			alert("비밀 번호를 확인 하세요!");
			return false; //폼 전송 막기 (jquery)
		}*/
		
	});
	
	// id가 pwd와 pwd2 인 요소에 input(입력) 이벤트가 일어 났을때 실행할 함수 등록
	$("#pwd, #pwd2").on("input", function(){
		//input 이벤트가 언제 일어나는지 확인 요망!
		//console.log("input!!");
		
		//입력한 두 비밀번호를 읽어온다.
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		//일단 모든 검증 클래스를 제거하고
		$("#pwd").removeClass("is-valid is-invalid");
		let result=reg_pwd.test(pwd);		
		//비밀번호가 정규표현식에 매칭되지 않으면
		if(!result){
			//비밀번호가 유효하지 않는다고 표시하고
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			//함수를 여기서 종료
			return;
		}
		//두 비밀번호가 같은지 확인해서
		if(pwd==pwd2){//만일 같으면
			//유효하다는 클래스 추가
			$("#pwd").addClass("is-valid");
			isPwdValid=true;
		}else{//다르면
			//유효하지 않다는 클래스 추가
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
		}
	
	});
	//이메일 입력란에 입력했을때 실행할 함수 등록
	$("#email").on("input",function(){
		//1.입력한 이메일 읽어와서
		let inputEmail=$("#email").val();
		let result=reg_email.test(inputEmail);
		//모든 검증 클래스 제거
		$("#email").removeClass("is-valid is-invalid");
		//만일 이메일이 정규표현식에 매칭되지 않는다면
		if(!result){
			//이메일이 유효하지 않다고 표시하고
			$("#email").addClass("is-invalid");
			isEmailValid=false;
		}else{
			//이메일이 유효하다고 표시하고
			$("#email").addClass("is-valid");
			isEmailValid=true;
		}
	});
	//아이디 입력란에 입력했을때 실행할 함수 등록
	$("#id").on("input",function(){
		//1.입력한 아이디 읽어와서
		let inputId=$("#id").val();
		let result=reg_id.test(inputId);
		//일단 모든 검증 클래스를 제거하고
		$("#id").removeClass("is-valid is-invalid");
		if(!result){
			//아이디가 유효하지 않다고 표시하고
			$("#id").addClass("is-invalid");
			isIdValid=false;
			//함수를 여기서 종료한다.
			return;
		
		}
		
		//2. 서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
		
		$.ajax({
			url:"checkid.jsp",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){
				//console.log(responseData.isExist);	
				/*
					checkid.jsp 페이지에서 응답할때
					contentType="application/json" 이라고 설정하면
					함수의 인자로 전달되는 responseData는 object 이다.
					{isExist:true} or {isExist:false}
					형식의 object 이기 떄문에 바로 사용 할 수 있다.
				
				*/
				if(responseData.isExist){//이미 존재하는 아이디인 경우
					$("#id").addClass("is-invalid");
					isIdValid=false;
				}else{//존재하지 않는 아이디 즉 사용가능한 아이디인 경우
					$("#id").addClass("is-valid");
					//아이디가 유효 하다고 표시한다.
					isIdValid=true;
				}
			}
		});	
	});
</script>
</body>
</html>