package com.siszo.sisproj.news.model;

import java.util.List;
import java.util.Map;


public interface NewsService {
	
	public static final int EXIST_LIKE=1;  
	public static final int NONE_EXIST_LIKE=2;
	public int insertNews(NewsVO newsVo);
	public List<NewsVO> dailyNewsList();
	public NewsVO newsSearchByNo(int newsNo);
	public int newsUpdate(NewsVO newsVo);
	public int newsUpdateImageException(NewsVO newsVo);
	public int newsDelete(int newsNo);
		
	public int insertNewsCommand(NewsComVO vo);
	public List<Map<String, Object>> searchNewsCommand(int newsNo);
	public int countNewsCommand(int newsNo);
	public int updatelikecnt(NewsVO newsVo);
	public int insertlike(NewsLikeVO likeVo);
	public int chklike(NewsLikeVO likeVo);
}
