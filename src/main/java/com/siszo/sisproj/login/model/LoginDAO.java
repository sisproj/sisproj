package com.siszo.sisproj.login.model;


import com.siszo.sisproj.employee.model.EmployeeVO;

public interface LoginDAO {
	public String selectPwd(String empPwd);
	public EmployeeVO selectAdmin(int empNo);	
}
