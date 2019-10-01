package com.movie.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.movie.project.FileUploadImg;
import com.movie.project.UserDao;
import com.movie.project.bean.SignUpBean;

@Controller
public class MainController {
	@Autowired
	UserDao ud;
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public String sighUp(HttpServletRequest req, @RequestParam("profileImg") MultipartFile file) {
		FileUploadImg fu = new FileUploadImg();
		String path = "D:\\IDE\\httpd-2.4.41-win64-VS16\\Apache24\\htdocs\\profile\\";
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String nickname = req.getParameter("nickname");
		String profileImg = fu.fileUpload(file, path);
		
		System.out.println(email + profileImg );
		
		SignUpBean sb = new SignUpBean();
		
		sb.setEmail(email);
		sb.setPassword(password);
		sb.setNickname(nickname);
		sb.setProfileImg(profileImg);
		
		ud.SignUpDao(sb);
		return "login";
	}
}
