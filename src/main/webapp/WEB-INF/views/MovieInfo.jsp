<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/resources/css/MovieInfo.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://bootswatch.com/4/simplex/bootstrap.min.css"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/resources/js/MovieInfo.js"></script>
</head>
<body>
    <div id="load"></div>
    <div class="container">
        <div class="row">
            <div class="col-12" style="min-width: 720px;">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container" >
                                    <img src="http://placehold.it/150x150" id="imgProfile" style="width: 150px; height: 200px" class="img-thumbnail" />
                                    <div class="middle">
                                        <input type="file" style="display: none;" id="profilePicture" name="file" />
                                    </div>
                                </div>
                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);">레플리카</a></h2>
                                    <h6 class="d-block" style="border-bottom: 1px solid grey">Replica</h6>
                                    <h6 class="d-block">액션</h6>
                                    <h6 class="d-block">96분</h6>
                                    <h6 class="d-block">미국</h6>
                                    <h6 class="d-block">2019-09-25</h6>
                                    <h6 class="d-block">제작사</h6>
                                    <h6 class="d-block">배급사</h6>
                                </div>
                                <div class="ml-auto">
                                    <form>
                                    	<button type="submit" class="commentButt adminButt">수정</button>
                                    	<button type="submit" class="commentButt adminButt">삭제</button>
                                    </form>
                                </div>
                            </div>
                            <p> 
                                <i class="icon-calendar"></i> Sept 16th, 2012 at 4:20 pm | Admin
                            </p>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">줄거리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">평점</a>
                                    </li>
                                </ul>
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                        <div class="row">
                                            <div class="plotbox">
                                                <p>asdasdasdasd</p>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="commentCont">
                            <p style="text-align: right"> 
                                | <i class="icon-comment"></i> <a href="#">3 Comments</a>
                                | <i class="" style="margin-right: 10px;">39 View</i>
                            </p>
                            <div class="commentWrite">
                                <label>Your Comment</label><br>
                                <div class="star">
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                </div>
                                <form action="">
	                                <textarea id="comment"></textarea><br>
	                                <button type="submit" class="commentButt">저장</button>
                                </form>
                            </div>
                            <div class="commentList">
                                <div class="commentList-small">
                                    <div class="comment_profile">
                                        <img src="https://taegon.kim/wp-content/uploads/2018/05/image-5.png">
                                    </div>
                                    <div>
                                        <div class="commentleft">◀</div>
                                        <div class="comment">asdasdasdasdasdasasdasda</div>
                                    </div>
                                    <form>
                                    	<button type="submit" class="commentButt">수정</button>
                                    	<button type="submit" class="commentButt">삭제</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>