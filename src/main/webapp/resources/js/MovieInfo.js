 $(document).ready(function(){
            $("#load").load("/headline");
            $('#score').val(0);
            $('#listBack').click(function(){
            	location.href = "/list";
            });
            
            $imgSrc = $('#imgProfile').attr('src');
            
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imgProfile').attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
            
            $('#btnChangePicture').on('click', function () {
                // document.getElementById('profilePicture').click();
                if (!$('#btnChangePicture').hasClass('changing')) {
                    $('#profilePicture').click();
                }
                else {
                    // change
                }
            });
            $('#profilePicture').on('change', function () {
                readURL(this);
                $('#btnChangePicture').addClass('changing');
                $('#btnChangePicture').attr('value', 'Confirm');
                $('#btnDiscard').removeClass('d-none');s
                // $('#imgProfile').attr('src', '');
            });
            $('#btnDiscard').on('click', function () {
                // if ($('#btnDiscard').hasClass('d-none')) {
                $('#btnChangePicture').removeClass('changing');
                $('#btnChangePicture').attr('value', 'Change');
                $('#btnDiscard').addClass('d-none');
                $('#imgProfile').attr('src', $imgSrc);
                $('#profilePicture').val('');
                // }
            });
    
            $('.star span').click(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                
                var score = $(this).index() + 1;
                $('#score').val(score);
                console.log(score);
            });
            
            $('#movieDelete').click(function(){
                location.href="/movieDelete";
            });
                        
            $('#movieUpdate').click(function(){
            	location.href="/update";
            });
            
    		$('#commentSub').show();
    		$('#commentUpSub').hide();
    		
        	$('#commentUpdate').click(function(){
        		var comment = $('#commentUpdate').parent().parent().children('div').children('.comment').text();
        		var score = $('#commentUpdate').parent().parent().children('.commentInfo').children('.on').length;
        		
        		$('#scoreInsert').show();
        		$('#comment').val(comment);
        		
        		$('.star').children('.a').eq(score - 1).addClass('on').prevAll('span').addClass('on');
        		
        		$('#commentSub').hide();
        		$('#commentUpSub').show();
        	});
        	
        	$('#commentUpSub').click(function(){
        		alert("수정 완료!");
        		$('#commentSub').show();
        		$('#commentUpSub').hide();
        	});
        });

function scoreCheck(){
	if($('#score').val() == 0){
		alert("점수를 선택해주세요.");
		return false;
	}
}