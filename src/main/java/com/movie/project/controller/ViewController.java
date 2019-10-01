package com.movie.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ViewController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		return "Main";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/headline")
	public String headline() {
		return "headline";
	}
	
	@GetMapping("/list")
	public String list() {
		return "list";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "insert";
	}
	
	@GetMapping("/MovieInfo")
	public String MovieInfo() {
		return "MovieInfo";
	}
}