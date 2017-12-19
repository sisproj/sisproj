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

	
}
