package com.siszo.sisproj.employee.model;

import java.util.List;

public interface EmployeeDAO {
	public int insertEmployee(EmployeeVO vo);
	public EmployeeVO selectEmployeeByNo(int empNo);
	public int editEmployee(EmployeeVO vo);
	public List<EmployeeVO> selectAllEmployee();
	public List<EmployeeVO> selectEmployeeByEmpName(String empName);
	public int employeeSelect(int empNo);
}
