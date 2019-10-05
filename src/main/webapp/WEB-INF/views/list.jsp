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
                        <a href="" class="nav-link" data-toggle="tab">범죄</a>
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
<%
	List<MovieListBean> movieList = (List<MovieListBean>) request.getAttribute("movieList");
	String path = "http://192.168.0.3/MovieImg/";
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
            </div>
        </div>
    </div>
</body>
</html>