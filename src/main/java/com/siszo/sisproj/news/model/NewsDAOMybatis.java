package com.siszo.sisproj.news.model;

import java.util.List;

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

}
