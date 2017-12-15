package com.siszo.sisproj.employee.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOMybatis extends SqlSessionDaoSupport implements EmployeeDAO{

	private String namespace="config.mybatis.mapper.oracle.employee";
	
	@Override
	public int insertEmployee(EmployeeVO vo) {
		return getSqlSession().insert(namespace+".insertEmployee",vo);
	}
	
}
