package com.siszo.sisproj.employee.model;

import java.util.List;

public interface EmployeeService {
	public int insertEmployee(EmployeeVO vo);
	public EmployeeVO selectEmployeeByNo(int empNo);
	public List<EmployeeVO> selectAllEmployee();
	public int editEmployee(EmployeeVO vo);
	public List<EmployeeVO> selectEmployeeByEmpPosition(String empName);
}
