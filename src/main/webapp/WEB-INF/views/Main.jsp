<%@page import="com.movie.project.bean.ScoreRankBean"%>
<%@page import="com.movie.project.bean.ViewRankBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
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
	    
	    $('.viewList').click(function(){
	    	var index = $(this).index() - 1;
	    	var title = $('.viewList').eq(index).children('.lbName').text();
	    	$.ajax({
	    		url: "/titleCheck",
	    		data: {"title": title}
	    	}).done(function(no){
	    		location.href = "/MovieInfo/" + no
	    	});
	    });
	    
	    $('.scoreList').click(function(){
	    	var index = $(this).index() - 1;
	    	var title = $('.scoreList').eq(index).children('.lbName').text();
	    	$.ajax({
	    		url: "/titleCheck",
	    		data: {"title": title}
	    	}).done(function(no){
	    		location.href = "/MovieInfo/" + no
	    	});
	    });
	});
    </script>
</head>
<body>
<%
	HashMap<String, Object> rankMap = (HashMap<String, Object>)request.getAttribute("rankMap");
	List<ViewRankBean> viewList = (List<ViewRankBean>)rankMap.get("viewList");
	List<ScoreRankBean> scoreList = (List<ScoreRankBean>)rankMap.get("scoreList");
	String viewImg = (String)rankMap.get("viewImg");
	String scoreImg =(String)rankMap.get("scoreImg");
	String path = "http://192.168.3.40/MovieImg/";
%>
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
                            <img src=<%=path+viewImg%>>
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
<%
	if(viewList != null){
		for(int i = 0 ; i < viewList.size() ; i++){
%>                                
                                <ul class="listCont viewList">                            
                                    <li class="lb1"><%=i + 1%></li>
                                    <li class="lbName"><%=viewList.get(i).getTitle_kor()%></li>
                                    <li class="lbView"><%=viewList.get(i).getViewCount()%></li>
                                </ul>
<%
		}
	}
%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="cont">
                    <div class="img-box-large">
                        <div class="img-box">
                            <img src=<%=path + scoreImg%>>
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
<%
	if(scoreList != null){
		for(int i = 0; i < scoreList.size(); i++){
%>                                
                                <ul class="listCont scoreList">
                                    <li class="lb1"><%=i + 1%></li>
                                    <li class="lbName"><%=scoreList.get(i).getTitle_kor()%></li>
                                    <li class="lbView"><%=scoreList.get(i).getScore()%></li>
                                </ul>
<%
		}
	}
%>
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