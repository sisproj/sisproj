package com.siszo.sisproj.confirm.file.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ConfirmFileDAOMybatis extends SqlSessionDaoSupport implements ConfirmFileDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";
	
	@Override
	public int insertConfirmFile(ConfirmFileVO vo) {
		return getSqlSession().insert(namespace+".insertConfirmFile",vo);
	}

	@Override
	public List<ConfirmFileVO> selectCfFileByCfNo(String cfNo) {
		return getSqlSession().selectList(namespace+".selectCfFileByCfNo",cfNo);
	}

	@Override
	public int deleteConfirmFile(String cfNo) {
		return getSqlSession().delete(namespace+".deleteConfirmFile", cfNo);
	}

}
