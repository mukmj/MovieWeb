<%@page import="com.movie.project.bean.MovieWriteBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	List<MovieWriteBean> updateList = (List<MovieWriteBean>)request.getAttribute("updateList");
	String error = "";
	if(updateList == null){
		error = "잘못된 경로입니다.";
	}
%>
    <title>영화 수정</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/update.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   
  	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="/resources/js/update.js"></script>
	<script>
	$(document).ready(function(){
		var genre1 = "<%=updateList.get(0).getGenre1()%>";
		var genre2 = "<%=updateList.get(0).getGenre2()%>";
		$('#genre_1').val(genre1).prop("selected",true);
		$('#genre_2').val(genre2).prop("selected",true);
	});
	</script>	
</head>
<body>
<div id="load"></div>
<div class="bigcont">
	<div class="container" id="insertBox">  
		<div class="col-lg-12 well">
	    	<div class="row">
	            <form action="/movieUpdate" method="post" enctype="multipart/form-data">
	    			<div class="col-sm-12">
	    				<div class="row">
	    					<div class="col-sm-6 form-group">
	    						<label>영화명(한국)</label>
	    						<input type="text" placeholder="한국 영화명을 입력하세요." name="title_kor" class="form-control" required="required" value="<%=updateList.get(0).getTitle_kor()%>">
	    					</div>
	    					<div class="col-sm-6 form-group">
	    						<label>영화명(영어)</label>
	    						<input type="text" placeholder="영어 영화명을 입력하세요." name="title_eng" class="form-control" required="required" value="<%=updateList.get(0).getTitle_eng()%>">
	    					</div>
	    				</div>					
	    				<div class="form-group">
	    					<label>내용</label>
	    					<textarea placeholder="영화 내용을 입력하세요." rows="3" name="plot" class="form-control" style="resize: none;" required="required"><%=updateList.get(0).getPlot()%></textarea>
	    				</div>	
	    				<div class="row">
	    					<div class="col-sm-4 form-group">
	    						<label>총 상영 시간</label>
	    						<input type="number" placeholder="분단위로 입력하세요." value="<%=updateList.get(0).getMovieTime()%>" name="movieTime" class="form-control" required="required">
	    					</div>	
	    					<div class="col-sm-4 form-group">
	    						<label>제작 국가</label>
	    						<input type="text" placeholder="국가명을 입력하세요." value="<%=updateList.get(0).getNation()%>" name="nation" class="form-control" required="required">
	    					</div>	
	    					<div class="col-sm-4 form-group">
	    						<label>개봉 날짜</label>
	    						<input type="date" name="openDate" value="<%=updateList.get(0).getOpenDate()%>" class="form-control" required="required">
	    					</div>		
	    				</div>
	    				<div class="row">
	    					<div class="col-sm-6 form-group">
	    						<label>제작사</label>
	    						<input type="text" placeholder="제작사를 입력하세요." value="<%=updateList.get(0).getProducer()%>" name="producer" class="form-control" required="required">
	    					</div>		
	    					<div class="col-sm-6 form-group">
	    						<label>배급사</label>
	    						<input type="text" placeholder="배급사를 입력하세요." value="<%=updateList.get(0).getCompany()%>" name="company" class="form-control" required="required">
	    					</div>	
	    				</div>
	                    <div class="row">
	    					<div class="col-sm-6 form-group">
	    						<label>장르</label>
	    						<select id="genre_1" name="genre1" class="genre-select" required="required">
	                                <option value="">장르선택</option>
	                                <option value="코미디">코미디</option>
	                                <option value="SF/판타지">SF/판타지</option>
	                                <option value="공포">공포</option>
	                                <option value="스릴러">스릴러</option>
	                                <option value="드라마">드라마</option>
	                                <option value="로맨스">로맨스</option>
	                                <option value="범죄">범죄</option>
	                                <option value="액션">액션</option>
	                            </select>
	    					</div>		
	    					<div class="col-sm-6 form-group plus">
	    						<img src="/resources/img/plus.png" class="plusButt">
	    					</div>
	                        <div class="col-sm-6 form-group plus" style="display: none;">
	    						<img src="/resources/img/minus.png" class="plusButt">
	    					</div>
	    				</div>
	                    <div class="row genre2" style="display: none;">
	    					<div class="col-sm-6 form-group">
	    						<label>장르(2)</label>
	    						<select id="genre_2" name="genre2" class="genre-select">
	                                <option value="">장르선택</option>
	                                <option value="코미디">코미디</option>
	                                <option value="SF/판타지">SF/판타지</option>
	                                <option value="공포">공포</option>
	                                <option value="스릴러">스릴러</option>
	                                <option value="드라마">드라마</option>
	                                <option value="로맨스">로맨스</option>
	                                <option value="범죄">범죄</option>
	                                <option value="액션">액션</option>
	                            </select>
	    					</div>		
	    				</div>
	    			<div class="form-group">
	    				<span>영화 이미지 업로드</span>
	    				<div class="file_input">
	                        <label>
	                            File Attach
	                            <input type="file" name="MovieImgUpdate" onchange="javascript:document.getElementById('file_route').value=this.value">
	                        </label>
	                        <input type="text" readonly="readonly" title="File Route" id="file_route">
	                    </div>
	    			</div>		
	                    <button type="submit" id="updateSubmit" onclick="re();" class="btn btn-lg btn-info">Submit</button>
	    			</div>
	            </form>
	    	</div>
		</div>
	</div>
</div>
</body>
</html>

