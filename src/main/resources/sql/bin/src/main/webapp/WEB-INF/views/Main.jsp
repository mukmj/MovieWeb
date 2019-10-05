<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	<link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script>
	    $(document).ready(function(){
	        $("#load").load("/headline");
	    });
    </script>
</head>
<body>
    <div id="load"></div>
    <div class="bs-example">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="cont">
                    <div class="img-box-large">
                        <div class="img-box">
                            <img src="http://www.kobis.or.kr/common/mast/movie/2019/09/18a502eedb5443bc9f9e40f17505f83a.jpg">
                        </div>
                    </div>
                    <div class="list-box-large">
                        <div class="list-box">
                            <div class="list-box-small">
                                <ul class="listTitle">
                                    <li class="lb1">순위</li>
                                    <li class="lbName">영화명</li>
                                    <li class="lbView">View</li>
                                </ul>
                                <ul class="listCont">
                                    <li class="lb1">1</li>
                                    <li class="lbName">asd</li>
                                    <li class="lbView">12</li>
                                </ul>
                                <ul class="listCont">
                                    <li class="lb1">2</li>
                                    <li class="lbName">ddd</li>
                                    <li class="lbView">1</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="cont">
                    <div class="img-box-large">
                        <div class="img-box">
                            <img src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/EpL2YRegeTQGGzHQgn5dgYF0pgI.png">
                        </div>
                    </div>
                    <div class="list-box-large">
                        <div class="list-box">
                            <div class="list-box-small">
                                <ul class="listTitle">
                                    <li class="lb1">순위</li>
                                    <li class="lbName">영화명</li>
                                    <li class="lbView">평점</li>
                                </ul>
                                <ul class="listCont">
                                    <li class="lb1">1</li>
                                    <li class="lbName">asd</li>
                                    <li class="lbView">12</li>
                                </ul>
                                <ul class="listCont">
                                    <li class="lb1">2</li>
                                    <li class="lbName">ddd</li>
                                    <li class="lbView">1</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
            </div>
        </div>
        <!-- Carousel controls -->
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>
    <div class="container">
        <div class="">

        </div>
    </div>
</body>
</html>