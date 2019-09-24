<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="../resources/css/test.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.login-info-box').fadeOut();
            $('.login-show').addClass('show-log-panel');

            $('.login-reg-panel input[type="radio"]').on('change', function() {
                if($('#log-login-show').is(':checked')) {
                    $('.register-info-box').fadeOut(); 
                    $('.login-info-box').fadeIn();

                    $('.white-panel').addClass('right-log');
                    $('.register-show').addClass('show-log-panel');
                    $('.login-show').removeClass('show-log-panel');
                } else if($('#log-reg-show').is(':checked')) {
                $('.register-info-box').fadeIn();
                $('.login-info-box').fadeOut();

                $('.white-panel').removeClass('right-log');

                $('.login-show').addClass('show-log-panel');
                $('.register-show').removeClass('show-log-panel');
                }
            });
            
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
			<div class="register-show">
				<h2>Sign Up</h2>
				<input type="text" class="register-id" placeholder="Id">
                <button type="button" id="idCheck-button">중복확인</button>
				<input type="password" class="register-text" placeholder="Password">
				<input type="text" class="register-text" placeholder="Email">
				<input type="button" value="가입">
			</div>
		</div>
	</div>
</body>
</html>