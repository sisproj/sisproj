package com.siszo.sisproj.news.model;

import java.util.List;

public interface NewsDAO {
	public int insertNews(NewsVO newsVo);
	public List<NewsVO> dailyNewsList();
	public NewsVO newsSearchByNo(int newsNo);
}
