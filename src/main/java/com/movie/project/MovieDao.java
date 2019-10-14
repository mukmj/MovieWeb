package com.movie.project;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.project.bean.CommentInsertBean;
import com.movie.project.bean.CommentListBean;
import com.movie.project.bean.LoginBean;
import com.movie.project.bean.MovieImgBean;
import com.movie.project.bean.MovieListBean;
import com.movie.project.bean.MovieWriteBean;
import com.movie.project.bean.ScoreCntBean;
import com.movie.project.bean.SearchBean;
import com.movie.project.bean.SignUpBean;
import com.movie.project.bean.ViewRankBean;
import com.movie.project.bean.ScoreRankBean;

@Repository
public class MovieDao {
	@Autowired
	SqlSession session;
	
	public HashMap<String, Object> rank() {
		HashMap<String, Object> rankMap = new HashMap<String, Object>();
		List<ViewRankBean> viewList = session.selectList("rank.viewRank");
		List<ScoreRankBean> scoreList = session.selectList("rank.scoreRank");
		String viewImg = session.selectOne("rank.viewRankImg");
		String scoreImg = session.selectOne("rank.scoreRankImg");
		
		rankMap.put("viewImg", viewImg);
		rankMap.put("scoreImg", scoreImg);
		rankMap.put("viewList", viewList);
		rankMap.put("scoreList", scoreList);
		
		return rankMap;
	}
	
	public void SignUpDao(SignUpBean sb) {
		session.insert("signUp.insert", sb);
	}
	
	public String idCheck(String id) {
		return session.selectOne("signUp.idCheck", id);
	}
	
	public String nickCheck(String nickname) {
		return session.selectOne("signUp.nickCheck", nickname);
	}
	
	public List<LoginBean> login(LoginBean lb) {
		List<LoginBean> lbList = session.selectList("signUp.login", lb);
		return lbList;
	}
	
	public void MovieWrite(String type, MovieWriteBean mwb, String imgUrl) {
		int no = 0;
		
		MovieImgBean mib = new MovieImgBean();

		if(type.equals("insert")) {
			session.insert("movie.insert", mwb);
			no = session.selectOne("movie.writeNo", mwb.getTitle_kor());
			mib.setWriteNo(no);
			mib.setImgUrl(imgUrl);
			session.insert("movie.imgInsert", mib);
		}

		if(type.equals("update") && imgUrl != "") {
			session.update("movie.update", mwb);
			mib.setWriteNo(mwb.getNo());
			mib.setImgUrl(imgUrl);
			session.update("movie.imgUpdate", mib);
		} else if(type.equals("update")){
			session.update("movie.update", mwb);
		}
	}
	
	public List<MovieListBean> movieList(String genre, SearchBean sb, int count) {
		List<MovieListBean> movieList = null;
		HashMap<String, Object> genreMap = new HashMap<String, Object>();
		
		genreMap.put("title", sb.getTitle());
		genreMap.put("openDate", sb.getOpenDate());
		genreMap.put("genre", genre);
		genreMap.put("count", count);

		movieList = session.selectList("movie.all_search", genreMap);
		
		return movieList;
	}
	
	public int movieCount(String genre, SearchBean sb) {
		HashMap<String, String> genreMap = new HashMap<String, String>();
		
		genreMap.put("title", sb.getTitle());
		genreMap.put("openDate", sb.getOpenDate());
		genreMap.put("genre", genre);
		
		int listCount = session.selectOne("paging.listCount", genreMap);
		
		return listCount;
	}
	
	public List<MovieWriteBean> movie(int no){
		List<MovieWriteBean> mwList = session.selectList("movie.movie", no);
		
		return mwList;
	}
	
	public void viewInsert(int no) {
		session.insert("movie.viewInsert", no); //뷰 수
	}
	
	public void movieDelete(int no) {
		session.update("movieDelete", no);
	}
	
	public int userNo(String nickname) {
		return session.selectOne("comment.userNo", nickname);
	}

	public void commentInsert(CommentInsertBean cib) {
		session.insert("comment.insert", cib);
	}
	
	public List<CommentListBean> commentList(int movieNo) {
		List<CommentListBean> commentList = session.selectList("comment.select", movieNo);
		return commentList;
	}
	
	public int scoreCheck(HashMap<String, Integer> noMap) {
		int score = 0;
		if(session.selectOne("comment.scoreCheck", noMap) != null) {
			score = session.selectOne("comment.scoreCheck", noMap);
		}
		return score;
	}
	
	public void commentDelUp(String type, CommentInsertBean cib) {
		if(type.equals("delete")) {
			session.update("comment.delete", cib);
		}else if(type.equals("update")) {
			session.update("comment.update", cib);
		}
	}
	
	public HashMap<String, Integer> infoCount(int movieNo) {
		HashMap<String, Integer> countMap = new HashMap<String, Integer>();
		countMap.put("commentCount", session.selectOne("comment.commentCount", movieNo));
		countMap.put("movieView", session.selectOne("movie.movieView", movieNo));
		return countMap;
	}
	
	public int titleCheck(String title) {
		return session.selectOne("movie.titleCheck", title);
	}
	
	public List<ScoreCntBean> scoreChart(int movieNo){
		List<ScoreCntBean> scoreCnt = session.selectList("movie.scoreChart", movieNo);
		return scoreCnt;
	}
}