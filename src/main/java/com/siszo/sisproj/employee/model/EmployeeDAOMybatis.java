package com.siszo.sisproj.employee.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.common.SearchVO;

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
	public int editEmployee(EmployeeVO vo) {
		return getSqlSession().update(namespace+".editEmployee",vo);
	}

	@Override
	public List<EmployeeVO> selectEmployeeByEmpName(String empName) {
		return getSqlSession().selectList(namespace+".selectEmployeeByEmpName",empName);
	}

	@Override
	public int employeeOut(int empNo) {
		return getSqlSession().update(namespace+".employeeOut",empNo);
	}

	@Override
	public int selectTotalRecordCount(SearchVO vo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecordCount",vo);
	}
	@Override
	public List<EmployeeVO> selectAllEmployee(SearchVO vo) {
		return getSqlSession().selectList(namespace+".selectAllEmployee",vo);
	}

	@Override
	public int employeeCome(int empNo) {
		return getSqlSession().update(namespace+".employeeCome",empNo);
	}
	

	
}
