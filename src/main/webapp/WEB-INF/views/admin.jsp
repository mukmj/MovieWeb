<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화 등록</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/admin.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="/resources/js/admin.js"></script>
</head>
<body>
<div id="load"></div>
<div class="genre-nav">
      <div class="left_bar">
          <ul class=" nav-tabs--vertical nav" role="navigation">
			  <li class="nav-item adminbanner">
                  	Admin
              </li>
              <li class="nav-item" id="insert">
                  <a href="" class="nav-link" data-toggle="tab">영화 등록</a>
              </li>
              <li class="nav-item" id="user">
                  <a href="" class="nav-link" data-toggle="tab">회원 관리</a>
              </li>
         </ul>
      </div>
</div>
<div class="bigcontainer">     
	<div class="container" id="insertBox">  
		<div class="col-lg-12 well">
	    	<div class="row">
	            <form action="/insert" method="post" enctype="multipart/form-data">
	    			<div class="col-sm-12">
	    				<div class="row">
	    					<div class="col-sm-6 form-group">
	    						<label>영화명(한국)</label>
	    						<input type="text" placeholder="한국 영화명을 입력하세요." name="title_kor" class="form-control">
	    					</div>
	    					<div class="col-sm-6 form-group">
	    						<label>영화명(영어)</label>
	    						<input type="text" placeholder="영어 영화명을 입력하세요." name="title_eng" class="form-control">
	    					</div>
	    				</div>					
	    				<div class="form-group">
	    					<label>내용</label>
	    					<textarea placeholder="영화 내용을 입력하세요." rows="3" name="plot" class="form-control" style="resize: none;"></textarea>
	    				</div>	
	    				<div class="row">
	    					<div class="col-sm-4 form-group">
	    						<label>총 상영 시간</label>
	    						<input type="number" placeholder="분단위로 입력하세요." name="movieTime" class="form-control">
	    					</div>	
	    					<div class="col-sm-4 form-group">
	    						<label>제작 국가</label>
	    						<input type="text" placeholder="국가명을 입력하세요." name="nation" class="form-control">
	    					</div>	
	    					<div class="col-sm-4 form-group">
	    						<label>개봉 날짜</label>
	    						<input type="date" name="openDate" class="form-control">
	    					</div>		
	    				</div>
	    				<div class="row">
	    					<div class="col-sm-6 form-group">
	    						<label>제작사</label>
	    						<input type="text" placeholder="제작사를 입력하세요." name="producer" class="form-control">
	    					</div>		
	    					<div class="col-sm-6 form-group">
	    						<label>배급사</label>
	    						<input type="text" placeholder="배급사를 입력하세요." name="company" class="form-control">
	    					</div>	
	    				</div>
	                    <div class="row">
	    					<div class="col-sm-6 form-group">
	    						<label>장르</label>
	    						<select name="genre1" class="genre-select">
	                                <option value="">장르선택</option>
	                                <option value="코미디">코미디</option>
	                                <option value="SF/판타지">SF/판타지</option>
	                                <option value="공포">공포</option>
	                                <option value="스릴러">스릴러</option>
	                                <option value="드라마">드라마</option>
	                                <option value="로맨스">로맨스</option>
	                                <option value="스포츠">스포츠</option>
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
	    						<select name="genre2" class="genre-select">
	                                <option value="">장르선택</option>
	                                <option value="코미디">코미디</option>
	                                <option value="SF/판타지">SF/판타지</option>
	                                <option value="공포">공포</option>
	                                <option value="스릴러">스릴러</option>
	                                <option value="드라마">드라마</option>
	                                <option value="로맨스">로맨스</option>
	                                <option value="스포츠">스포츠</option>
	                                <option value="액션">액션</option>
	                            </select>
	    					</div>		
	    				</div>
	    			<div class="form-group">
	    				<span>영화 이미지 업로드</span>
	    				<div class="file_input">
	                        <label>
	                            File Attach
	                            <input type="file" name="MovieImg" onchange="javascript:document.getElementById('file_route').value=this.value">
	                        </label>
	                        <input type="text" readonly="readonly" title="File Route" id="file_route">
	                    </div>
	    			</div>		
	                    <button type="submit" class="btn btn-lg btn-info">Submit</button>
	    			</div>
	            </form>
	    	</div>
		</div>
	</div>
	<div id="userBox">
		asd
	</div>
</div>
</body>
</html>