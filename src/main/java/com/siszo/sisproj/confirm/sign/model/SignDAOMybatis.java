package com.siszo.sisproj.confirm.sign.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class SignDAOMybatis extends SqlSessionDaoSupport implements SignDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public SignVO selectSign(int empNo) {
		return getSqlSession().selectOne(namespace+".selectSign", empNo);
	}

	@Override
	public int insertSignImg(SignVO sVo) {
		return getSqlSession().insert(namespace+".insertSignImg", sVo);
	}

	@Override
	public int updateSignImg(SignVO sVo) {
		return getSqlSession().update(namespace+".updateSignImg", sVo);
	}
	
	
}
