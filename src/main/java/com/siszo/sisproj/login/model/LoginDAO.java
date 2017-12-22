package com.siszo.sisproj.login.model;


import java.util.List;
import java.util.Map;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface LoginDAO {
	public int selectEmpNoCount(int empNo);
	public String selectPwd(String empPwd);
	public EmployeeVO selectAdmin(int empNo);
	public List<Map<String, String>> selectEmpLev();
}
