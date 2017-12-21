package com.siszo.sisproj.confirm.confirmline.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ConfirmLineDAOMybatis extends SqlSessionDaoSupport implements ConfirmLineDAO {
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public ConfirmLineVO selectConfirmerByEmpNo(int empNo) {
		return getSqlSession().selectOne(namespace+".selectConfirmerByEmpNo", empNo);
	}

	@Override
	public int insertConfirmLine(ConfirmLineVO vo) {
		return getSqlSession().insert(namespace+".insertConfirmLine", vo);
	}

	@Override
	public int myConfirmOk(ConfirmLineVO vo) {
		return getSqlSession().update(namespace+".myConfirmOk",vo);
	}

	
}
