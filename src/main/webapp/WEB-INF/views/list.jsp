<%@page import="com.movie.project.bean.MovieListBean"%>
<%@page import="com.movie.project.bean.MovieWriteBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화리스트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/resources/css/list.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/list.js"></script>
   <%int movieCount = (int) request.getAttribute("movieCount"); %>
<%
	int count;
	if(request.getParameter("count") != null){
		count = Integer.parseInt(request.getParameter("count"));
	}else{
		count = 0; 
	}
%>
    <script>
    		$(document).ready(function(){	
    			function currentPage(listCount){
    				$('#pagingStart span').click(function(){
	        			var countIndex = $('#pagingStart span').index(this);
	        			var countPage = ($('#pagingStart span')[countIndex].textContent - 1) * listCount;
	        			location.href = "/list?&count=" + countPage;
	        		});
    			}
    			
    			function pagingView(){
    				var tot = <%=movieCount%>;
	        		var listCount = 20;
	        		var totalPage = Math.ceil(tot / listCount);
	        		var block = 1;
	        		var page = (<%=count%> / listCount) + 1;
	     			var countPage = 0;
	        		var startPage;
	        		var endPage;
	        		console.log("s: " + startPage + ", e: " + endPage);
	        		
	        		if(totalPage < block){
	        			block = totalPage;
	        			$('#next').hide();
	        		}
	       
	        		if(totalPage <= page){
	        			$('#next').hide();
	        			$('#end').hide();
	        		}
	        		
	        		startPage = parseInt((page - 1) / block) * block + 1;
	        		endPage = startPage + block - 1;
	        		
	        		if(startPage > 1){
	        			$('#prev').show();
	        			$('#first').show();
	        		}else{
	        			$('#prev').hide();
	        			$('#first').hide();
	        		}
	        		
	        		paging(startPage, endPage);
	        		currentPage(listCount);
	        		
	        		$('#first').click(function(e){
	        			startPage = 1;
	        			countPage = (startPage - 1) * listCount;
	        			location.href = "/list?&count=" + countPage;
	        		});
	        		
	        		$('#end').click(function(){
	        			endPage = totalPage;
	        			countPage = (endPage - 1) * listCount;
	        			location.href = "/list?&count=" + countPage;
	        		});
	        		
	        		$('#next').click(function(e){
	        			startPage = endPage + 1;
	        			endPage = startPage + block - 1;
	        			paging(startPage, endPage);
	        			countPage = (startPage - 1) * listCount;
	        			location.href = "/list?&count=" + countPage;
	    			});
	        		
	        		$('#prev').click(function(){
	        			startPage = startPage - block;
	        			endPage = startPage + block - 1;
	        			paging(startPage, endPage);
	        			countPage = (endPage - 1) * listCount;
	        			location.href = "/list?&count=" + countPage;
	        		});
    			}
    			
    			function paging(startPage, endPage){
    				$('#pagingStart').empty();
	        		for(var i = startPage; i <= endPage; i++){
	                	var html = "<span>"+ i +"</span>";
	        			$('#pagingStart').append(html);
	        		}		
    			}

    			pagingView();
    		});
    </script>
</head>
<body>
    <div id="load"></div>
    <div class="big-cont" id="bigContainer">
        <div class="genre-nav">
            <div class="left_bar">
                <ul class=" nav-tabs--vertical nav" id="searchText" role="navigation">
                    <li class="nav-item" id="all">전체</li>
                    <li class="nav-item">코미디</li>
                    <li class="nav-item">SF/판타지</li>
                    <li class="nav-item">공포</li>
                    <li class="nav-item">스릴러</li>
                    <li class="nav-item">드라마</li>
                    <li class="nav-item">로맨스</li>
                    <li class="nav-item">범죄</li>
                    <li class="nav-item">액션</li>
                    <li class="nav-item">미스터리</li>
                    <li class="nav-item">애니메이션</li>
               </ul>
           </div>
        </div>
        <div class="list-cont">
            <div class="search-cont">
                <div class="search-cont-small">
                	<form action="/list" method="post">
	                    <div class="namebox">
	                        <label>영화명: </label>
	                        <input type="text" name="title" id="nameSearch">
	                    </div>
	                    <div class="datebox">
	                        <label>개봉년월: </label>
	                        <input type="month" name="openDate" id="dateSearch">
	                    </div>
	                    <div class="searchButt">
	                        <button type="submit">검색</button>
	                    </div>
                    </form>
                </div>
            </div>
            <div class="movieList-cont">
                <div class="row">
<%
	List<MovieListBean> movieList = (List<MovieListBean>) request.getAttribute("movieList");
	String path = "http://192.168.0.2/MovieImg/";
	if(movieList != null){
		for(int i = 0; i < movieList.size(); i++){	
%>            
                    <div class="col-sm-4" id="movieInfo" onclick="noCheck(<%=movieList.get(i).getNo()%>)" style="width: 25%;" >
                      <div class="panel panel-primary">
                        <div class="panel-heading"><%=movieList.get(i).getTitle_kor()%></div>
                        <div class="panel-body"><img src=<%=path + movieList.get(i).getImgUrl()%> class="img-responsive" style="width:100%" alt="Image"></div>
                        <div class="panel-footer"><%=movieList.get(i).getOpenDate()%></div>
                      </div>
                    </div>
<%
		}
	}
%>                 
                </div>
                <div id="paging">
                	<span class="block" id="first">&laquo;</span>
                	<span class="block" id="prev">&lt;</span>
                	<span id="pagingStart"></span>
                	<span class="block" id="next">&gt;</span>
                	<span class="block" id="end">&raquo;</span>
            	</div>   
            </div>
        </div>
    </div>
</body>
</html>