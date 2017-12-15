package com.siszo.sisproj.confirm.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentFormDAOMybatis extends SqlSessionDaoSupport implements DocumentFormDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public int insertDocForm(DocumentFormVO vo) {
		return getSqlSession().insert(namespace+".insertDocForm",vo);
	}

	@Override
	public DocumentFormVO selectDocFormByFormNo(int formNo) {
		return getSqlSession().selectOne(namespace+".selectDocFormByFormNo",formNo);
	}
	
}
