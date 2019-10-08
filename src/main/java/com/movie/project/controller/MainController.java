package com.movie.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.movie.project.FileUploadImg;
import com.movie.project.MovieDao;
import com.movie.project.bean.CommentInsertBean;
import com.movie.project.bean.LoginBean;
import com.movie.project.bean.MovieImgBean;
import com.movie.project.bean.MovieListBean;
import com.movie.project.bean.MovieWriteBean;
import com.movie.project.bean.SearchBean;
import com.movie.project.bean.SignUpBean;

@Controller
public class MainController {
	int no;
	String type;
	String sessionId;
	int userNo = 0;
	
	@Autowired
	FileUploadImg fud;
	
	@Autowired
	MovieDao md;
	
	@RequestMapping("/")
	public String home(HttpServletRequest req, HttpSession hs) {
		sessionId = (String)hs.getAttribute("id");
		if(sessionId != null) {
			userNo = md.userNo(sessionId);
		}
		System.out.println(sessionId + ":" + userNo);
		return "Main";
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public String sighUp(HttpServletRequest req, @RequestParam("profileImg") MultipartFile file) {
		String path = "D:\\IDE\\httpd-2.4.41-win64-VS16\\Apache24\\htdocs\\profile\\";
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String nickname = req.getParameter("nickname");
		String profileImg = fud.fileUpload(file, path);
		
		if(profileImg.equals("")) {
			profileImg = "none.png";
		}
		
		SignUpBean sb = new SignUpBean();
		
		sb.setId(id);
		sb.setPassword(password);
		sb.setNickname(nickname);
		sb.setProfileImg(profileImg);
		
		md.SignUpDao(sb);
		return "redirect:/login";
	}
	
	@RequestMapping("/idCheck")
	public void idCheck(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String idCheck = req.getParameter("id");
		String nick = req.getParameter("nickname");

		if(idCheck != null) {
			String id = md.idCheck(idCheck);
			res.getWriter().print(id);
		}
		
		if(nick != null) {
			String nickname = md.nickCheck(nick);
			res.getWriter().print(nickname);
		}
	}
	
	@RequestMapping(value="/loginCheck", method = RequestMethod.POST)
	public void loginCheck(HttpServletRequest req, HttpServletResponse res, LoginBean lb) throws IOException {
		HttpSession hs = req.getSession();
		List<LoginBean> lbList = md.login(lb);
		String result = "";

		if(lbList.isEmpty()) {
			result = "x";
		}else {
			result = lbList.get(0).getId();
			hs.setAttribute("id", result);
		}
		res.getWriter().print(result);
	}
	
	@RequestMapping(value="/headline", method = RequestMethod.POST)
	public String headline(HttpServletRequest req, HttpServletResponse res ) {
		return "headline";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest req, @RequestParam("MovieImg") MultipartFile file, MovieWriteBean mwb) {
		String path = "D:\\IDE\\httpd-2.4.41-win64-VS16\\Apache24\\htdocs\\MovieImg\\";
		String imgUrl = "";
		if(file == null) {
			imgUrl = "none.png";
		}else {
			imgUrl = fud.fileUpload(file, path);
		}

		type = "insert";
		md.MovieWrite(type, mwb, imgUrl);
		return "redirect: /admin";
	}
	

	String genre = "";
	@RequestMapping("/listGenre")
	public String listView(Model m, HttpServletRequest req) {
		genre = req.getParameter("genre");
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model m, HttpServletRequest req, SearchBean sb) {
		if(genre == "") {
			genre = "전체";
		}
		
		List<MovieListBean> movieList = md.movieList(genre, sb);
		m.addAttribute("movieList", movieList);

		return "list";
	}
	
	@RequestMapping("/Movie")
	public String Movie(HttpServletRequest req) {
		no = Integer.parseInt(req.getParameter("no"));	
		return "redirect:/MovieInfo";
	}
	
	@RequestMapping("/MovieInfo")
	public String MovieInfo(HttpServletRequest req) {
		List<MovieWriteBean> mwList = md.movie(no);
		req.setAttribute("mwList", mwList);
		
		//코멘트
		md.commentList(no);
		return "MovieInfo";
	}
	
	@RequestMapping("/movieDelete")
	public String movieDelete() {
		md.movieDelete(no);
		return "redirect: /list";
	}
	
	@RequestMapping("/update")
	public String update(Model m, HttpServletRequest req, HttpServletResponse res) throws IOException {
		List<MovieWriteBean> updateList = md.movie(no);
		String genre = updateList.get(0).getGenre1();
		res.getWriter().print(genre);
		m.addAttribute("updateList", updateList);
		return "update";
	}
	
	@RequestMapping("/movieUpdate")
	public String movieUpdate(HttpServletRequest req, @RequestParam("MovieImgUpdate") MultipartFile file, MovieWriteBean mwb) {
		String path = "";
		String imgUrl = "";
		
		path = "D:\\IDE\\httpd-2.4.41-win64-VS16\\Apache24\\htdocs\\MovieImg\\";
		imgUrl = fud.fileUpload(file, path);
	
		mwb.setNo(no);
		type = "update"; 
		md.MovieWrite(type, mwb, imgUrl);
		return "redirect:/MovieInfo";
	}
	
	@RequestMapping("/comment")
	public String comment(CommentInsertBean cib, Model m) {
		System.out.println(sessionId + "랑 " + userNo);
		cib.setMovieNo(no);
		cib.setUserNo(userNo);
		md.commentInsert(cib);
		return "redirect:/MovieInfo";
	}
}
			