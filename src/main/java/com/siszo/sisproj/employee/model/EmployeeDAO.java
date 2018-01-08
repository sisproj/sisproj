package com.siszo.sisproj.employee.model;

import java.util.List;

import com.siszo.sisproj.common.SearchVO;

public interface EmployeeDAO {
	public int insertEmployee(EmployeeVO vo);
	public EmployeeVO selectEmployeeByNo(int empNo);
	public int editEmployee(EmployeeVO vo);
	public List<EmployeeVO> selectEmployeeByEmpName(String empName);
	public int employeeOut(int empNo);
	public List<EmployeeVO> selectAllEmployee(SearchVO vo);
	public int selectTotalRecordCount(SearchVO vo);
	public int employeeCome(int empNo);
    public int employeeEditPwd(EmployeeVO empVo);
    public int employeeUpdateMaster(int empNo);
    public int employeeUpdateTeam(int empNo);
    public int employeeTeamCheck(int empNo);
    public int employeeMasterCheck(int empNo);
    public int employeeOutCheck(int empNo);
   
}
