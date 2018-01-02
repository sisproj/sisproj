package com.siszo.sisproj.news.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class NewsDAOMybatis extends SqlSessionDaoSupport implements NewsDAO{

	String namespace="config.mybatis.mapper.oracle.news";

	public int insertNews(NewsVO newsVo) {
		return getSqlSession().insert(namespace+".insertNews",newsVo);
	}
	
	public List<NewsVO> dailyNewsList(){
		return getSqlSession().selectList(namespace+".dailyNewsList");
		}
	public NewsVO newsSearchByNo(int newsNo) {
		return getSqlSession().selectOne(namespace+".newsSearchByNo",newsNo);
				
	}
	public int newsUpdate(NewsVO newsVo) {
		return getSqlSession().update(namespace+".newsUpdate",newsVo);
	}
	public int newsUpdateImageException(NewsVO newsVo) {
		return getSqlSession().update(namespace+".newsUpdateImageException",newsVo);
	}
	public int newsDelete(int newsNo) {
		return getSqlSession().delete(namespace+".newsDelete",newsNo);
	}

	public int insertNewsCommand(NewsComVO vo) {
		return getSqlSession().insert(namespace+".insertNewsCommand",vo);
	}

	public List<Map<String, Object>> searchNewsCommand(int newsNo){
		return getSqlSession().selectList(namespace+".searchNewsCommand",newsNo);
	}
	public int countNewsCommand(int newsNo) {
		return getSqlSession().selectOne(namespace+".countNewsCommand",newsNo);
	}
	public int updatelikecnt(NewsVO newsVo) {
		return getSqlSession().update(namespace+".updatelikecnt",newsVo);
				
	}
	public int insertlike(NewsLikeVO likeVo) {
		return getSqlSession().insert(namespace+".insertlike", likeVo);
	}
	public int chklike(NewsLikeVO likeVo) {
		return getSqlSession().selectOne(namespace+".chklike",likeVo);
	}
	public List<NewsVO> newslikeRanking() {
		return getSqlSession().selectList(namespace+".newslikeRanking");
	}
	public List<Map<String, Object>> newscomRanking(){
		return getSqlSession().selectList(namespace+".newscomRanking");
	}
	public int readcountup(int newsNo) {
		return getSqlSession().update(namespace+".readcountup",newsNo);
	}
	public List<NewsVO> newsreadRanking(){
		return getSqlSession().selectList(namespace+".newsreadRanking");
	}
}
