package com.siszo.sisproj.webhard.board.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.webhard.common.WebhardSearchVO;

@Repository
public class WebhardBoardDAOMybatis extends SqlSessionDaoSupport implements WebhardBoardDAO{
	private String namespace="config.mybatis.mapper.oracle.webhard";

	@Override
	public int insertWebBoard(WebhardBoardVO wbVo) {
		return getSqlSession().insert(namespace+".insertWebBoard", wbVo);
	}

	@Override
	public WebhardBoardVO selectWebBoardByWebNo(int webNo) {
		return getSqlSession().selectOne(namespace+".selectWebBoardByWebNo",webNo);
	}

	@Override
	public List<WebhardBoardVO> selectWebBoardList(WebhardSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectWebBoardList",searchVo);
	}

	@Override
	public int cntWebBoardList(WebhardSearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".cntWebBoardList",searchVo);
	}

	@Override
	public int updateWebBoard(WebhardBoardVO wbVo) {
		return getSqlSession().update(namespace+".updateWebBoard",wbVo);
	}

	@Override
	public int deleteWebBoard(int webNo) {
		return getSqlSession().delete(namespace+".deleteWebBoard",webNo);
	}		
}
