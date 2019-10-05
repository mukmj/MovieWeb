$(document).ready(function(){
    var tp;
    var index;
    var address = document.location.href.split('/')[3];
    $('.nav-list li').eq(0).addClass('select');
    
    if(address == "list" || address == "MovieInfo"){
    	 $('.nav-list li').eq(0).removeClass('select');
      	 $('.nav-list li').eq(1).addClass('select');
      	 index = 1;
    }else if(address == "insert"){
    	 $('.nav-list li').eq(index).removeClass('select');
    	 $('.nav-list li').eq(0).removeClass('select');
    	 $('.nav-list li').eq(3).addClass('select');
    	 index = 3;
    }
  
    $('#login').click(function(){
    	location.href = "/login";
    });
    
    $('#home').click(function(){
    	location.href = "/";
    });
    
    $('#list').click(function(){
    	location.href = "/list";
    });
    
    $('#insert').click(function(){
    	location.href = "/insert";
    });
});