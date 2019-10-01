package com.movie.project;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.project.bean.SignUpBean;

@Repository
public class UserDao {
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
}