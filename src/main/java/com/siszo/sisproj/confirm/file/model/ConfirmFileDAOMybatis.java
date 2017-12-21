package com.siszo.sisproj.confirm.file.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ConfirmFileDAOMybatis extends SqlSessionDaoSupport implements ConfirmFileDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";
	
	@Override
	public int insertConfirmFile(ConfirmFileVO vo) {
		return getSqlSession().insert(namespace+".insertConfirmFile",vo);
	}
}
