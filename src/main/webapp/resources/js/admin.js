$(document).ready(function(){
    $("#load").load("headline.html");
    $(".plusButt").click(function(){
        $('.genre2').slideToggle();
        $('.plus').toggle();
    });
    
    $('#userBox').hide();
    $('#insert').attr('style', 'background-color: #dddddd;');
    
    $('#insert').click(function(){
    	 $('#insertBox').show();
    	 $('#userBox').hide();
    	 $('#insert').attr('style', 'background-color: #dddddd;');
    	 $('#user').attr('style', 'background-color: white;');
    });
    
    $('#user').click(function(){
   	 $('#insertBox').hide();
   	 $('#userBox').show();
	 $('#insert').attr('style', 'background-color: white;');
   	 $('#user').attr('style', 'background-color: #dddddd;');
   });
});