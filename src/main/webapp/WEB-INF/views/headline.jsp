<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>MovieWeb</title>
    <link rel="stylesheet" href="/resources/css/headline.css">
    <link href="https://fonts.googleapis.com/css?family=Mansalva&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/headline.js"></script>
</head>
<%String nickname = (String)session.getAttribute("nickname");%>
<script>
$(document).ready(function(){
	$('header').load('/resources/header.html');
	var nick = "<%=nickname%>";

	$('#admin').hide();
	
	if(nick != "null"){
		$('#login').hide();
		$('#user').show();
		$('#logout').show();
	}else{
		$('#logout').hide();
		$('#user').hide();
	}
	
	if(nick == "ADMIN"){
		$('#admin').show();
	}
});
</script>
<body>
    <header>
	
    </header>
    <nav>
        <ul class="nav-logo">
            <li>MovieWeb</li>
        </ul>
        
        <ul class="nav-list">
            <li id="home">Home</li>
            <li id="list">Movie</li>      
            <li id="admin">Admin</li>
        </ul>

        <ul class="nav-login">  
            <li id="login">로그인</li>
			<li id="logout">로그아웃</li>
            <li id="user"><%=nickname%> 님</li>
        </ul>
    </nav>
</body>
</html>