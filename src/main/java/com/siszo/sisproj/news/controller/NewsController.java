package com.siszo.sisproj.news.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.news.model.NewsService;
import com.siszo.sisproj.news.model.NewsVO;
import com.siszo.sisproj.schmodel.SchedulerVO;

@Controller
@RequestMapping("/news")
public class NewsController {
	private static final Logger logger =LoggerFactory.getLogger(NewsController.class);

	@Autowired
	private NewsService newsService;
	
	
	@RequestMapping("/news.do")
	public void newsView(Model model) {
		List<NewsVO> list = newsService.dailyNewsList();
		logger.info("뉴스화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/newsWriteOk.do")
	public String newsInsert(@ModelAttribute NewsVO newsVo, Model model) {
		logger.info("뉴스 등록 처리, 파라미터 newsVo={}",newsVo);
		int cnt = newsService.insertNews(newsVo);
		String msg="", url="";
		if(cnt>0)
		{
			msg="뉴스 등록 성공";
			url="/news/dailyNews.do";
		}else {
			msg="뉴스 등록 실패";
			url="/news/newsWrite.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
		
	}
	
	
	@RequestMapping("/photoNews.do")
	public void photoNewsView() {
		
	}
	
	@RequestMapping("/dailyNews.do")
	public void DailyNewsView(Model model) {
		List<NewsVO> list = newsService.dailyNewsList();
		logger.info("뉴스화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping("/newsWrite.do")
	public void newWrite() {
		
	}
	
	@RequestMapping("/bottomNews.do")
	public void bottomNews(Model model) {
		List<NewsVO> list = newsService.dailyNewsList();
		logger.info("뉴스화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping("/newsDetail.do")
	public String newsDetail(@RequestParam(defaultValue="0") int newsNo, Model model) {
		NewsVO newsVo=newsService.newsSearchByNo(newsNo);
		logger.info("뉴스 디테일 화면 출력,newsVo ={}",newsVo);
		
		
		model.addAttribute("newsVo",newsVo);
		
		return "news/newsDetail";
	}
	
	
}
