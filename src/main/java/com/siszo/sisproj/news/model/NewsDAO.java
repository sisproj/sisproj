package com.siszo.sisproj.news.model;

import java.util.List;
import java.util.Map;


public interface NewsDAO {
	public int insertNews(NewsVO newsVo);
	public List<NewsVO> dailyNewsList(NewsSearchVO newsSearchVO);
	public List<NewsVO> dailyNewsMainList();
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
	public List<NewsVO> newslikeRanking();
	public List<Map<String, Object>> newscomRanking();
	public int readcountup(int newsNo);
	public List<NewsVO> newsreadRanking();
	public int deleteNewsCom(NewsComVO comVo);
	public int newstotalrecord();
	public List<NewsVO> newsAllselect(NewsSearchVO newsSearchVO);
	
}
