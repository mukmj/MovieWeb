<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화리스트</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/list.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/list.js"></script>
</head>
<body>
    <div id="load"></div>
    <div class="big-cont">
        <div class="genre-nav">
            <div class="left_bar">
                <ul class=" nav-tabs--vertical nav" role="navigation">
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">전체</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">코미디</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">SF/판타지</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link " data-toggle="tab">공포</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">스릴러</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">드라마</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">로맨스</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">스포츠</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link" data-toggle="tab">액션</a>
                    </li>
               </ul>
           </div>
        </div>
        <div class="list-cont">
            <div class="search-cont">
                <div class="search-cont-small">
                    <div class="namebox">
                        <label>영화명: </label>
                        <input type="text" id="nameSearch">
                    </div>
                    <div class="datebox">
                        <label>개봉년월: </label>
                        <input type="month" id="dateSearch">
                    </div>
                    <div class="searchButt">
                        <button type="button">검색</button>
                    </div>
                </div>
            </div>
            <div class="movieList-cont">
                <div class="row">
                    <div class="col-sm-4" id="test" style="width: 25%;">
                      <div class="panel panel-primary">
                        <div class="panel-heading">BLACK FRIDAY DEAL</div>
                        <div class="panel-body"><img src="http://www.kobis.or.kr/common/mast/movie/2019/09/18a502eedb5443bc9f9e40f17505f83a.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
                        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                      </div>
                    </div>
                    <div class="col-sm-4" style="width: 25%;"> 
                      <div class="panel panel-primary">
                        <div class="panel-heading">BLACK FRIDAY DEAL</div>
                        <div class="panel-body"><img src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/EpL2YRegeTQGGzHQgn5dgYF0pgI.png" style="width:100%" alt="Image"></div>
                        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                      </div>
                    </div>
                    <div class="col-sm-4" style="width: 25%;"> 
                      <div class="panel panel-primary"  >
                        <div class="panel-heading">BLACK FRIDAY DEAL</div>
                        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                      </div>
                    </div>
                    <div class="col-sm-4" style="width: 25%;"> 
                      <div class="panel panel-primary"  >
                        <div class="panel-heading">BLACK FRIDAY DEAL</div>
                        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                      </div>
                    </div>
                    <div class="col-sm-4" style="width: 25%;"> 
                      <div class="panel panel-primary"  >
                        <div class="panel-heading">BLACK FRIDAY DEAL</div>
                        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>