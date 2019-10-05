var index;


function noCheck(no){
	index = no;

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
});

