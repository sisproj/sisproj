package com.siszo.sisproj.organization.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.employee.model.EmployeeVO;

@Repository
public class OrganizationDAOMybatis extends SqlSessionDaoSupport implements OrganizationDAO{
	private String namespace="config.mybatis.mapper.oracle.organization";

	@Override
	public List<EmployeeVO> selectEmp() {
		return getSqlSession().selectList(namespace+".selectEmp");
	} 
}
