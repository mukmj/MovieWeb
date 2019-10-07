var check;
$(document).ready(function(){
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
    
    check = 0;
    //아이디, 닉네임 체크
    $('#idCheck').click(function(e){
    	var id = $('#id').val(); 
    	
    	if(id == ""){
    		alert("아이디를 입력해주세요.");
    		check = 1;
    	}
    	
    	$.ajax({
    		url:"/idCheck",
    		data: {"id": id},
    		type: "GET",
    		success : function(data){
    			if(data == "null"){
    				alert("사용 가능합니다.");
    				check = 2;
    			}else{
    				alert("사용할 수 없는 아이디입니다.");
    				$("#id").val("");
    			}
    		}
    	});
    });
    
    $('#nickNameCheck').click(function(){
    	var nickname = $('#nickname').val();
    	
    	if(nickname == ""){
    		alert("닉네임을 입력해주세요.");
    		check = 1;
    	}
    	
    	$.ajax({
    		url:"/idCheck",
    		data: {"nickname": nickname},
    		type: "GET",
    		success : function(data){
    			if(data == "null"){
    				alert("사용 가능합니다.");
    				check = 3;
    			}else{
    				alert("사용할 수 없는 닉네임입니다.");
    				$('#nickname').val("");
    			}
    		}
    	});
    });
    
    //이미지 미리보기
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
    
    $('#login').click(function (){
    	var id = $('#loginId').val();
    	var password = $('#loginPw').val();
    	
    	$.ajax({
    		url: "/loginCheck",
    		data: {"id": id, "password": password},
    		type: "post",
    		success: function(data){
    			if(data == "x"){
    				alert("존재하지 않는 아이디입니다.");
    			}else{
    				location.href = "/";
    			}			
    		}
    	});
    });
  
    
});

//중복체크
function subCheck(){
	if(check == 0){
		alert("아이디 중복확인을 해주세요.");
		return false;
	}else if(check == 1){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(document.getElementById('pass').value == ""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(check == 2){
		alert("닉네임 중복확인을 해주세요.");
		return false;
	}else{
		alert("가입완료!");
	}
}