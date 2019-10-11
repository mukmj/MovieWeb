function noCheck(no){
	location.href = "/MovieInfo/" + no;
}

$(document).ready(function(){
	$("#load").load("/headline");
	
	$('#searchText .nav-item').click(function(){
		var i = $(this).index();
		console.log(i);
		
		var genre = document.getElementById('searchText').getElementsByTagName('li')[i].textContent;
		
		$.ajax({
			url:"/listGenre",
			data: {"genre":genre},
			type: "get"
		}).done(function(){
			console.log("success");
			//location.reload();
		});
		
		location.href = "/list";
	});
});

