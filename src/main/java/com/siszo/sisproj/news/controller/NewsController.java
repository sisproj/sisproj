package com.siszo.sisproj.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class NewsController {

	@RequestMapping("/news.do")
	public void newsView() {
		
	}
	
	@RequestMapping("/photoNews.do")
	public void photoNewsView() {
		
	}
}
