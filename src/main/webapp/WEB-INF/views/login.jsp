<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="/resources/css/login.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/login.js"></script>
</head>
<script>
$(document).ready(function(){
    $('#login').click(function (){
    	var id = $('#loginId').val();
    	var password = $('#loginPw').val();	
    	$.ajax({
    		url: "/loginCheck",
    		data: {"id": id, "password": password},
    		type: "post",
    		success: function(data){
    			if($('#loginId').val() == ""){
    				alert("아이디를 입력하세요.");
    			}else if($('#loginPw').val() == ""){
    				alert("비밀번호를 입력하세요.");
    			}else if(data == "x"){
    				alert("존재하지 않는 아이디입니다.");
    			}else if(data != null){
    				//location.href="/";
    				location.href = document.referrer;    				
    			}			
    		}
    	});
    });
});
</script>
<body>
<div class="login-reg-panel">
		<div class="login-info-box">
            <h2>Have an account?</h2><br>
			<label id="label-register" for="log-reg-show">Login</label>
			<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
		</div>
							
		<div class="register-info-box">
			<h2>Don't have an account?</h2><br>
			<label id="label-login" for="log-login-show">회원가입</label>
			<input type="radio" name="active-log-panel" id="log-login-show">
		</div>
							
		<div class="white-panel">
			<div class="login-show">
				<h2>LOGIN</h2>
				<input type="text" name="loginId" id="loginId" placeholder="id">
				<input type="password" name="loginPw" id="loginPw" placeholder="Password">
				<input type="button" id="login" value="Login">
			</div>
			<form action="/signUp" method="post" enctype="multipart/form-data" onsubmit="return subCheck();">
				<div class="register-show">
					<h2>Sign Up</h2>
					<input type="text" class="register-id" name="id" id="id" placeholder="id">
	                <button type="button" class="idCheck-button" id="idCheck">중복확인</button>
					<input type="password" class="register-text" name="password" id="pass" placeholder="Password">
					<input type="text" class="register-id" name="nickname" id="nickname" placeholder="Nickname">
	                <button type="button" class="idCheck-button" id="nickNameCheck">중복확인</button>
	           		<div class="upload-Box">
	               		<div class="profile-Img-Box">
							<img id="ProImg">
					   	</div>
						<input type="file" id="profileImg" name="profileImg" style="display: none;">	
						<button type="button" id="profileUp">업로드</button>           
					</div>
					<input type="submit" value="가입" style="margin-top: 20px;">
				</div>
			</form>
		</div>
	</div>
</body>
</html>