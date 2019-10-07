	$(document).ready(function(){
	    $(".plusButt").click(function(){
	        $('.genre2').slideToggle();
	        $('.plus').toggle();
	    });
	    
	    if($('#file_route').val("")){
	    	$('#file_route').val("이미지 미등록시 '기존 이미지'로 등록됩니다.");
	    }
	    
	    $("#updateSubmit").click(function(){
	    	opener.location.reload(); 
	    	alert("수정완료!");
	    	window.close();
	    });
	});