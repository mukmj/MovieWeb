$(document).ready(function(){
    $("#load").load("headline.html");
    $(".plusButt").click(function(){
        $('.genre2').slideToggle();
        $('.plus').toggle();
    });
});