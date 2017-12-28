package com.siszo.sisproj.news.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDAO newsDao;
	public int insertNews(NewsVO newsVo) {
		return newsDao.insertNews(newsVo);
	}
	public List<NewsVO> dailyNewsList(){
		return newsDao.dailyNewsList();
	}
	
	public NewsVO newsSearchByNo(int newsNo) {
		return newsDao.newsSearchByNo(newsNo);
	}
	
	
	
}
