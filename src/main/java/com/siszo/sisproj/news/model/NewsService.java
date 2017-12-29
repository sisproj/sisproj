package com.siszo.sisproj.news.model;

import java.util.List;

public interface NewsService {
	public int insertNews(NewsVO newsVo);
	public List<NewsVO> dailyNewsList();
	public NewsVO newsSearchByNo(int newsNo);
	public int newsUpdate(NewsVO newsVo);
	public int newsUpdateImageException(NewsVO newsVo);
	public int newsDelete(int newsNo);
		
}
