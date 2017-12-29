package com.siszo.sisproj.employee.model;

import java.util.List;

import com.siszo.sisproj.common.SearchVO;

public interface EmployeeService {
	public int insertEmployee(EmployeeVO vo);
	public EmployeeVO selectEmployeeByNo(int empNo);
	public int editEmployee(EmployeeVO vo);
	public List<EmployeeVO> selectEmployeeByEmpPosition(String empName);
	public int employeeOut(List<EmployeeVO> list);
	public List<EmployeeVO> selectAllEmployee(SearchVO vo);
	public int selectTotalRecordCount(SearchVO vo);
	public int employeeCome(List<EmployeeVO> list);
}
