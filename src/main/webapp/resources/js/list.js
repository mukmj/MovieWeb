function noCheck(no){
	$.ajax({
		url: "/Movie",
		data: {"no" : no},
		type: "get"
	}).done(function(){
		console.log("success");
		location.href = "/MovieInfo";
	});
}

$(document).ready(function(){
	$("#load").load("headline.html");
	
	$('#searchText li').click(function(){
		var i = $(this).index();
		console.log(i);
		
		var genre = document.getElementById('searchText').getElementsByTagName('li')[i].textContent;
		
		$.ajax({
			url:"/listGenre",
			data: {"genre":genre},
			type: "get"
		}).done(function(){
			console.log("success");
			location.reload();
		});
	});
	
	
});

