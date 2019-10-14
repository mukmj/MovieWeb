$(document).ready(function(){
    var tp;
    var index;
    var address = document.location.href.split('/')[3];
    var list = document.location.href.lastIndexOf('/') + 1;
    var listAddr = document.location.href.substr(list, 4);
    
    $('.nav-list li').eq(0).addClass('select');
    
    if(listAddr == "list" || address == "MovieInfo"){
    	 $('.nav-list li').eq(0).removeClass('select');
      	 $('.nav-list li').eq(1).addClass('select');
      	 index = 1;
    }else if(address == "admin"){
    	 $('.nav-list li').eq(index).removeClass('select');
    	 $('.nav-list li').eq(0).removeClass('select');
    	 $('.nav-list li').eq(2).addClass('select');
    	 index = 2;
    }
  
    $('#login').click(function(){
		location.href = "/login";
    });
    
    $('#home').click(function(){
    	location.href = "/";
    });
    
    $('#list').click(function(){
    	location.href = "/list";
    	var genre = "";
		$.ajax({
			url:"/listGenre",
			data: {"genre":genre},
			type: "get"
		}).done(function(){
			console.log("success");
			//location.reload();
		});
    });
    
    $('#admin').click(function(){
    	location.href = "/admin";
    });
    
    $('#logout').click(function(){
    	alert("로그아웃 완료!");
    	location.href = "/logout";
    });
});