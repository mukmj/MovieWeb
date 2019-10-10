$(document).ready(function(){
    var tp;
    var index;
    var address = document.location.href.split('/')[3];
    $('.nav-list li').eq(0).addClass('select');
    
    if(address == "list" || address == "MovieInfo"){
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
    	location.href = "/logout";
    });
});