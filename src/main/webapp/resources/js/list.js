function noCheck(no){
	location.href = "/MovieInfo/" + no;
}

$(document).ready(function(){
	$("#load").load("/headline");
	
	$('#searchText .nav-item').click(function(){
		var i = $(this).index();
		
		var genre = document.getElementById('searchText').getElementsByTagName('li')[i].textContent;
		
		$.ajax({
			url:"/listGenre",
			data: {"genre":genre},
			type: "get"
		});
		
		location.href = "/list";
	});
	
	$(window).scroll(function(){ 
	       var num = $(this).scrollTop();  
	       if( num > 356 ){  
	           $(".left_bar").css("position","fixed");
	           $(".left_bar").css("top","10px");
	           $(".left_bar").css("width","200px");
	        }else if( num < 356){
	           $(".left_bar").css("position","unset");
	        }
	 });
});

