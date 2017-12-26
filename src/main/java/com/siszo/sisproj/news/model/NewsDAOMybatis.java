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


}
