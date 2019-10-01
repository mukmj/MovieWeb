$(document).ready(function(){
	var check = 0;
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
    
    $('#profileUp').click(function(e){
    	$('#profileImg').click();
    	e.preventDefault();
    });
    
    $('#idCheck').click(function(e){
    	var id = $('#id').val(); 
    	if(id == ""){
    		alert("아이디를 입력해주세요.");
    	}
    	
    	$.ajax({
    		url:"/idCheck",
    		data: {"id": id},
    		type: "GET",
    		success : function(data){
    			if(data == "null"){
    				alert("사용 가능합니다.");
    			}else{
    				alert("사용할 수 없는 아이디입니다.");
    				check = 1;
    			}
    		}
    	});
    });
    
    $('#nickNameCheck').click(function(){
    	var nickname = $('#nickname').val(); 
    	console.log(nickname);
    	$.ajax({
    		url:"/idCheck",
    		data: {"nickname": nickname},
    		type: "GET",
    		success : function(data){
    			if(data == "null"){
    				alert("사용 가능합니다.");
    			}else{
    				alert("사용할 수 없는 닉네임입니다.");
    			}
    		}
    	});
    });
    
    var upload = document.querySelector('#profileImg');
    var preview = document.querySelector('#ProImg');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var reader = new FileReader();
 
        reader.onload = (function (aImg) {
 
            return function (e) {
                aImg.src = e.target.result
            }
        })(preview)
 
        if(get_file){
            reader.readAsDataURL(get_file[0]);
        }
 
        preview.src = e.target.result;
    })
});