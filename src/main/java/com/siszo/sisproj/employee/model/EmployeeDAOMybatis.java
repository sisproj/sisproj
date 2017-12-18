package com.siszo.sisproj.employee.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOMybatis extends SqlSessionDaoSupport implements EmployeeDAO{

	private String namespace="config.mybatis.mapper.oracle.employee";
	
	@Override
	public int insertEmployee(EmployeeVO vo) {
		return getSqlSession().insert(namespace+".insertEmployee",vo);
	}

	@Override
	public EmployeeVO selectEmployeeByNo(int empNo) {
		return getSqlSession().selectOne(namespace+".selectEmployeeByNo",empNo);
	}

	@Override
	public List<EmployeeVO> selectAllEmployee() {
		return getSqlSession().selectList(namespace+".selectAllEmployee");
	}

	@Override
	public int editEmployee(EmployeeVO vo) {
		return getSqlSession().update(namespace+".editEmployee",vo);
	}

	@Override
	public List<EmployeeVO> selectEmployeeByEmpName(String empName) {
		return getSqlSession().selectList(namespace+".selectEmployeeByEmpName",empName);
	}

	

	
}
