package com.siszo.sisproj.confirm.docform.model;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentFormDAOMybatis extends SqlSessionDaoSupport implements DocumentFormDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public DocumentFormVO selectDocFormByFormNo(int formNo) {
		return getSqlSession().selectOne(namespace+".selectDocFormByFormNo",formNo);
	}

	@Override
	public void insertDocForm(Map<String, String> map) {
		getSqlSession().insert(namespace+".insertDocForm", map);
	}

	@Override
	public int updateDocForm(DocumentFormVO vo) {
		return getSqlSession().update(namespace+".updateDocForm", vo);
	}

	@Override
	public void deleteDocForm(Map<String, Integer> map) {
		getSqlSession().delete(namespace+".deleteDocForm",map);
	}
	
	
}
