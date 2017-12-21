package com.siszo.sisproj.organization.model;

import java.util.List;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface OrganizationDAO {
	public List<EmployeeVO> selectEmp();
	public EmployeeVO selectEmpByEmpNo(int empNo);
	public List<EmployeeVO> selectMulti(String keyword);
}
