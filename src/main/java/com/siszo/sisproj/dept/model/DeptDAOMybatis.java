package com.siszo.sisproj.dept.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class DeptDAOMybatis extends SqlSessionDaoSupport implements DeptDAO{
	
	private String namespace="config.mybatis.mapper.oracle.organization";
	
	@Override
	public List<DeptVO> selectDeptName() {
		return getSqlSession().selectList(namespace+".selectDeptName");
	}

}
