package com.siszo.sisproj.news.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDAO newsDao;
	public int insertNews(NewsVO newsVo) {
		return newsDao.insertNews(newsVo);
	}
	public List<NewsVO> dailyNewsList(NewsSearchVO newsSearchVO){
		return newsDao.dailyNewsList(newsSearchVO);
	}
	public List<NewsVO> dailyNewsMainList(){
		return newsDao.dailyNewsMainList();
	}
	public NewsVO newsSearchByNo(int newsNo) {
		return newsDao.newsSearchByNo(newsNo);
	}
	
	public int newsUpdate(NewsVO newsVo) {
		return newsDao.newsUpdate(newsVo);
	}
	
	
	public int newsUpdateImageException(NewsVO newsVo) {
		return newsDao.newsUpdateImageException(newsVo);
		
	}
	public int newsDelete(int newsNo) {
		return newsDao.newsDelete(newsNo);
	}
	public int insertNewsCommand(NewsComVO vo) {
		return newsDao.insertNewsCommand(vo);
	}
	public List<Map<String, Object>> searchNewsCommand(int newsNo){
		return newsDao.searchNewsCommand(newsNo);
	}
	public int countNewsCommand(int newsNo) {
		return newsDao.countNewsCommand(newsNo);
	}
	public int updatelikecnt(NewsVO newsVo) {
		return newsDao.updatelikecnt(newsVo);
	}
	
	public int insertlike(NewsLikeVO likeVo) {
		return newsDao.insertlike(likeVo);
	}
	public int chklike(NewsLikeVO likeVo) {
		return newsDao.chklike(likeVo);
	}
	public List<NewsVO> newslikeRanking() {
		return newsDao.newslikeRanking();
	}
	public List<Map<String, Object>> newscomRanking(){
		return newsDao.newscomRanking();
	}
	public int readcountup(int newsNo) {
		return newsDao.readcountup(newsNo);
	}
	public List<NewsVO> newsreadRanking(){
		return newsDao.newsreadRanking();
	}
	public int deleteNewsCom(NewsComVO comVo) {
		return newsDao.deleteNewsCom(comVo);
	}
	public int newstotalrecord() {
		return newsDao.newstotalrecord();
	}
}
