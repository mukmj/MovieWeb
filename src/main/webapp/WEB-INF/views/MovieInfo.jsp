<%@page import="com.movie.project.bean.ScoreCntBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.movie.project.bean.CommentListBean"%>
<%@page import="java.util.List"%>
<%@page import="com.movie.project.bean.MovieWriteBean"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <script src="/resources/js/MovieInfo.js"></script>
</head>
<%
	HashMap<String, Integer> countMap = (HashMap<String, Integer>)request.getAttribute("countMap");
	int scoreCheck = (int) request.getAttribute("scoreCheck");
	String nickname = (String)session.getAttribute("nickname");
	HashMap<String, Integer> scoreCnt = (HashMap<String, Integer>) request.getAttribute("scoreCnt");
%>
<script>
$(document).ready(function(){
	var scoreCheck = <%=scoreCheck%>;
	var nick = "<%=nickname%>";
	
	if(scoreCheck == 0 || nick == "null"){
		$('#scoreInsert').show();
	}else{
		$('#scoreInsert').hide();
	}
	
	if(nick == "null"){
		$('#comment').attr('readonly','readonly');
		$('#comment').val("로그인 후 작성 가능합니다.");
		$('#commentSub').hide();
		
		$('#comment').click(function(){
			alert("로그인 화면으로 이동합니다.");
			location.href = "/login";
		});
	}
	
	$('#movieUpdate').hide();
	$('#movieDelete').hide();
	
	if(nick == "admin"){
		$('#movieUpdate').show();
		$('#movieDelete').show();	
	}
	var ctx = document.getElementById("scoreChart").getContext('2d');

	var scoreChart = new Chart(ctx, {
	    type: 'horizontalBar',
	    data: {
	        labels: ['5점','4점','3점','2점','1점'],
	        datasets: [{
	        	label: '별점',
	            data: [
	            	<%=scoreCnt.get("score5")%>,
	            	<%=scoreCnt.get("score4")%>,
	            	<%=scoreCnt.get("score3")%>,
	            	<%=scoreCnt.get("score2")%>,
	            	<%=scoreCnt.get("score1")%>
	            ],
	            borderColor: "rgba(255, 201, 14, 1)",
	            backgroundColor: "rgba(255, 201, 14, 0.5)",
	        }]
	    },
	    options: {
	    	scales: {
	            xAxes: [{
	            	ticks:{
	                	beginAtZero: true,
	                	display: false,
	                	max: 10
	            	},
	            	gridLines: {
	            		display: false
	            	}
	            }],
	            yAxes: [{
	            	gridLines: {
	            		display: false
	            	}
	            }]
	        },
	        tooltips: {
	        	callbacks: { 
	        	     label: function(scoreChart) { 
	        	      return Number(scoreChart.xLabel) + "명"; 
	        	     }
	        	} 
	        }
        }
	});
});
</script>
<body>
    <div id="load"></div>
<%
	List<MovieWriteBean> mwList = (List<MovieWriteBean>) request.getAttribute("mwList");
	String path = "http://192.168.3.40/MovieImg/";
	String genre = "";
	
	if(mwList.get(0).getGenre2() != null){
		genre = mwList.get(0).getGenre1() + "/" + mwList.get(0).getGenre2();
	}else{
		genre = mwList.get(0).getGenre1();
	}
%>

    <div class="container">
        <div class="row">
            <div class="col-12" style="min-width: 720px;">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container" >
                                    <img src=<%=path + mwList.get(0).getImgUrl() %> id="imgProfile" style="width: 150px; height: 200px" class="img-thumbnail" />
                                    <div class="middle">
                                        <input type="file" style="display: none;" id="profilePicture" name="file" />
                                    </div>
                                </div>
                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);"><%=mwList.get(0).getTitle_kor() %></a></h2>
                                    <h6 class="d-block" style="border-bottom: 1px solid grey"><%=mwList.get(0).getTitle_eng() %></h6>                                   
                                    <h6 class="d-block"><%=genre%></h6>							
                                    <h6 class="d-block"><%=mwList.get(0).getMovieTime()%>분</h6>
                                    <h6 class="d-block"><%=mwList.get(0).getNation()%></h6>
                                    <h6 class="d-block"><%=mwList.get(0).getOpenDate() %></h6>
                                    <h6 class="d-block"><%=mwList.get(0).getProducer() %></h6>
                                    <h6 class="d-block"><%=mwList.get(0).getCompany()%></h6>
                                </div>
                                <div class="ml-auto">                             
                                    <form>
                                    	<button type="button" id="listBack" class="commentButt adminButt">목록</button>
                                    	<button type="button" id="movieUpdate" class="commentButt adminButt">수정</button>
                                    	<button type="button" id="movieDelete" class="commentButt adminButt">삭제</button>
                                    </form>
                                </div>
                            </div>
                            <div class="movieCount"> 
                                  <span><%=countMap.get("commentCount") %></span> Comments
                            	| <span><%=countMap.get("movieView")%></span> views 
                            </div>
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
                                                <p><%=mwList.get(0).getPlot() %></p>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                    	<div class="chart">	
                                    		<canvas id="scoreChart"></canvas>
                                    	</div>
										<div class="scoreText">
											<span>평균</span>
											<span>3.5</span>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="commentCont">
                            <div class="commentWrite" id="scoreInsert">
                                <label>Your Comment</label><br>
                                <div class="star">
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                    <span class="a">★</span>
                                </div>
                                <form action="/comment" onsubmit="return scoreCheck();">
                                	<input type="hidden" id="score" name="score">
	                                <textarea id="comment" name="text" required="required"></textarea>
	                                <button type="submit" id="commentSub" class="commentButt">저장</button>
	                                <button type="submit" id="commentUpSub" formaction="/commentUpdate" class="commentButt">수정</button>
                                </form>
                            </div>                          
                            <div class="commentList">
<%
	String profilePath = "http://192.168.3.40/profile/";
	List<CommentListBean> commentList = (List<CommentListBean>)request.getAttribute("commentList");
	if(commentList != null){
		for(int i = 0 ; i < commentList.size(); i++) {
%>                            
<script>
$(document).ready(function(){
	var score = <%=commentList.get(i).getScore()%>;
	console.log(score);
	$('.commentInfo').eq(<%=i%>).children('span').eq(score - 1).addClass('on').prevAll('span').addClass('on');
});
</script>
                                <div class="commentList-small">
                                    <div class="commentInfo" id="test"> 
										<span class="scoreStar">★</span>
	                                    <span class="scoreStar">★</span>
	                                    <span class="scoreStar">★</span>
	                                    <span class="scoreStar">★</span>
	                                    <span class="scoreStar">★</span>	                                 
		                                | <a href="#"><%=commentList.get(i).getNickname()%></a>
		                                | <%=commentList.get(i).getWriteDate()%>
		                            </div>
                                    <div class="comment_profile">
                                        <img src=<%=profilePath + commentList.get(i).getProfileImg() %>>
                                    </div>
                                    <div>
                                        <div class="commentleft">◀</div>
                                        <div class="comment"><%=commentList.get(i).getText() %></div>
                                    </div>
<%
			if(commentList.get(i).getNickname().equals(nickname)){
%>                                    
                                    <form action="/commentDel">
                                    	<button type="button" class="commentButt" id="commentUpdate">수정</button>
                                    	<button type="submit" class="commentButt">삭제</button>
                                    </form>
<%
			}
%>                                    
                                </div>
<%
		}
	}
%>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>