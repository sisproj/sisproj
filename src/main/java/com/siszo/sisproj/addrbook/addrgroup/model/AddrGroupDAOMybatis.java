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
}
