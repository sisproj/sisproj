package com.siszo.sisproj.addrbook.addrgroup.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AddrGroupDAOMybatis extends SqlSessionDaoSupport implements AddrGroupDAO{
	private String namespace="config.mybatis.mapper.oracle.addrGroup";

	@Override
	public List<AddrGroupVO> selectGroupName(int empNo) {
		return getSqlSession().selectList(namespace+".selectGroupName", empNo);
	}

	@Override
	public int insertGroup(AddrGroupVO groupVo) {
		return getSqlSession().insert(namespace+".insertGroup", groupVo);
	}

	@Override
	public int insertGroupDefault(AddrGroupVO groupVo) {
		return getSqlSession().insert(namespace+".insertGroupDefault", groupVo);
	}

	@Override
	public int deleteGroup(int groupNo) {
		return getSqlSession().delete(namespace+".deleteGroup", groupNo);
	}

	@Override
	public int countGroup(int empNo) {
		return getSqlSession().selectOne(namespace+".countGroup", empNo);
	}
}
