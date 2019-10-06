package com.movie.project;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.project.bean.LoginBean;
import com.movie.project.bean.MovieImgBean;
import com.movie.project.bean.MovieListBean;
import com.movie.project.bean.MovieWriteBean;
import com.movie.project.bean.SignUpBean;

@Repository
public class MovieDao {
	@Autowired
	SqlSession session;
	
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
	
	public void MovieWrit(MovieWriteBean mwb, String imgUrl) {
		session.insert("movie.insert", mwb);
		int no = session.selectOne("movie.writeNo", mwb.getTitle_kor());
		MovieImgBean mib = new MovieImgBean();
		mib.setWriteNo(no);
		mib.setImgUrl(imgUrl);
		session.insert("movie.imgInsert", mib);
	}
	
	public List<MovieListBean> movieList(String genre) {
		List<MovieListBean> movieList = null;

		if(genre.equals("전체")) {
			movieList = session.selectList("movie.movieList");
		} else {
			movieList = session.selectList("movieSearch.genre", genre);
		}
		
		return movieList;
	}
	
	public List<MovieWriteBean> movie(String no){
		List<MovieWriteBean> mwList = session.selectList("movie.movie", no);
		return mwList;
	}
}