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
    <script>
        $(document).ready(function(){
            $('#login').click(function (){
            	location.href = "/";
            });
        });
    </script>
</head>
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
				<input type="text" placeholder="Email">
				<input type="password" placeholder="Password">
				<input type="button" id="login" value="Login">
				<a href="">아이디 찾기</a>
			</div>
			<form action="/signUp" method="post" enctype="multipart/form-data">
				<div class="register-show">
					<h2>Sign Up</h2>
					<input type="text" class="register-id" name="email" placeholder="Email">
	                <button type="button" id="idCheck-button">중복확인</button>
					<input type="password" class="register-text" name="password" placeholder="Password">
					<input type="text" class="register-id" name="nickname" placeholder="Nickname">
	                <button type="button" id="idCheck-button">중복확인</button>
	           		<div class="upload-Box">
	               		<div class="profile-Img-Box">
							<img src="https://taegon.kim/wp-content/uploads/2018/05/image-5.png">
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