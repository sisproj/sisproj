package com.siszo.sisproj.news.model;

import java.util.List;

public interface NewsService {
	public int insertNews(NewsVO newsVo);
	public List<NewsVO> dailyNewsList();
}
