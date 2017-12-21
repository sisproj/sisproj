package com.siszo.sisproj.confirm.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class DocumentDAOMybatis extends SqlSessionDaoSupport implements DocumentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public int selectConfirmSEQ() {
		return getSqlSession().selectOne(namespace+".selectConfirmSEQ");
	}

	@Override
	public int insertConfirmDoc(DocumentVO vo) {
		return getSqlSession().insert(namespace+".insertConfirmDoc",vo);
	}	
	
}
