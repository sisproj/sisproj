package com.siszo.sisproj.confirm.isread.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.confirm.model.DocumentVO;

@Repository
public class CfIsReadDAOMybatis extends SqlSessionDaoSupport implements CfIsReadDAO {
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public int insertIsRead(DocumentVO vo) {
		return getSqlSession().insert(namespace+".insertIsRead", vo);
	}
	
	@Override
	public String selectIsReadByCfNo(CfIsReadVO vo) {
		return getSqlSession().selectOne(namespace+".selectIsReadByCfNo",vo);
	}

	@Override
	public int updateIsReadDoc(CfIsReadVO vo) {
		return getSqlSession().update(namespace+".updateIsReadDoc", vo);
	}

	@Override
	public int mainBoxSet(CfIsReadVO vo) {
		return getSqlSession().selectOne(namespace+".mainBoxSet", vo);
	}

	@Override
	public int mainBoxSetAll(CfIsReadVO vo) {
		return getSqlSession().selectOne(namespace+".mainBoxSetAll", vo);
	}
}
