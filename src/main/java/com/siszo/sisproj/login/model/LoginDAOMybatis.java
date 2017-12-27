package com.siszo.sisproj.login.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.employee.model.EmployeeVO;

@Repository
public class LoginDAOMybatis extends SqlSessionDaoSupport implements LoginDAO{

	private String namespace = "config.mybatis.mapper.oracle.login";

	@Override
	public String selectPwd(String empPwd) {
		return getSqlSession().selectOne(namespace+".selectPwd",empPwd);
	}

	@Override
	public EmployeeVO selectAdmin(int empNo) {
		return getSqlSession().selectOne(namespace+".selectAdmin",empNo);
	}
}
