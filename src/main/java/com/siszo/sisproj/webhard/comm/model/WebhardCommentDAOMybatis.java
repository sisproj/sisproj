package com.siszo.sisproj.webhard.comm.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class WebhardCommentDAOMybatis extends SqlSessionDaoSupport implements WebhardCommentDAO{
	private String namespace="config.mybatis.mapper.oracle.webhard";

	@Override
	public int insertWebComment(WebhardCommentVO wcVo) {
		return getSqlSession().insert(namespace+".insertWebComment",wcVo);
	}

	@Override
	public List<WebhardCommentVO> selectWebComment(int webNo) {
		return getSqlSession().selectList(namespace+".selectWebComment",webNo);
	}

	@Override
	public int webCommCnt(int webNo) {
		return getSqlSession().selectOne(namespace+".webCommCnt", webNo);
	}

	@Override
	public int updateWebComment(WebhardCommentVO wcVo) {
		return getSqlSession().update(namespace+".updateWebComment", wcVo);
	}

	@Override
	public int deleteWebComment(int commNo) {
		return getSqlSession().delete(namespace+".deleteWebComment", commNo);
	}
	
	
}
