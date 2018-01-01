package com.siszo.sisproj.webhard.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class WebhardDAOMybatis extends SqlSessionDaoSupport implements WebhardDAO {
	private String namespace="config.mybatis.mapper.oracle.webhard";

	@Override
	public int insertWebhard(WebhardVO wvo) {
		return getSqlSession().insert(namespace+".insertWebhard", wvo);
	}

	@Override
	public List<WebhardVO> selectWebhard() {
		return getSqlSession().selectList(namespace+".selectWebhard");
	}
}
