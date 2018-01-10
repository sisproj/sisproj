package com.siszo.sisproj.employee.model;

import java.util.List;

import com.siszo.sisproj.common.SearchVO;

public interface EmployeeService {	
	public static final int TEAM_OK=1; //팀장 직급임
	public static final int TEAM_NONE=2; //팀장 직급이아님
	public static final int MASTER_OK=3; //관리자 직급임
	public static final int MASTER_NONE=4;	//관리자 직급이 아님
	public static final int OUT_OK=5;	//퇴사직원
	public static final int OUT_NONE=6;	//퇴사직원이 아님
	
	
	
	public int insertEmployee(EmployeeVO vo);
	public EmployeeVO selectEmployeeByNo(int empNo);
	public int editEmployee(EmployeeVO vo);
	public List<EmployeeVO> selectEmployeeByEmpPosition(String empName);
	public int employeeOut(List<EmployeeVO> list);
	public List<EmployeeVO> selectAllEmployee(SearchVO vo);
	public int selectTotalRecordCount(SearchVO vo);
	public int employeeCome(List<EmployeeVO> list);
	public int employeeEditPwd(EmployeeVO empVo);
	public int employeeUpdateMaster(List<EmployeeVO> list);
	public int employeeUpdateTeam(List<EmployeeVO> list);
	public int employeeTeamCheck(int empNo);
	public int employeeMasterCheck(int empNo);
	public int employeeOutCheck(int empNo);
	public int editEmployeeEmp(EmployeeVO vo);
}
