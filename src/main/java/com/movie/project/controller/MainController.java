package com.movie.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String nickname = req.getParameter("nickname");
		String profileImg = fu.fileUpload(file, path);
		
		if(profileImg.equals("")) {
			profileImg = "none.png";
		}
		
		System.out.println(id + profileImg );
		
		SignUpBean sb = new SignUpBean();
		
		sb.setId(id);
		sb.setPassword(password);
		sb.setNickname(nickname);
		sb.setProfileImg(profileImg);
		
		ud.SignUpDao(sb);
		return "redirect:/login";
	}
	
	@RequestMapping("/idCheck")
	public void idCheck(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String id2 = req.getParameter("id");
		String nick = req.getParameter("nickname");

		if(id2 != null) {
			String id = ud.idCheck(id2);
			res.getWriter().print(id);
		}
		
		if(nick != null) {
			String nickname = ud.nickCheck(nick);
			res.getWriter().print(nickname);
		}
	}
}
			