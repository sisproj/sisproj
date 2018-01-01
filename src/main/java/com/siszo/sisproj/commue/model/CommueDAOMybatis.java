package com.siszo.sisproj.commue.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommueDAOMybatis extends SqlSessionDaoSupport implements CommueDAO{

	private String namespace = "config.mybatis.mapper.oracle.commue";
	@Override
	public List<CommueVO> selectAllCom() {
		return getSqlSession().selectList(namespace+".selectAllCom");
	}
	@Override
	public int insertIn(int empNo) {
		return getSqlSession().insert(namespace+".insertIn",empNo);
	}

}
