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
		System.out.println(sb.getEmail().toString());
		session.insert("signUp.insert", sb);
	}
}