package com.siszo.sisproj.login.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.employee.model.EmployeeVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDao;

	@Override
	public int loginCheck(int empNo, String empPwd) {
		int result=0;
		
		String dbPwd =loginDao.selectPwd(empPwd);
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else {
			if(dbPwd.equals(empPwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}

		return result;	
	}

	@Override
	public EmployeeVO selectAdmin(int empNo) {
		return loginDao.selectAdmin(empNo);
	}

	@Override
	public List<Map<String, String>> selectEmpLev() {
		return loginDao.selectEmpLev();
	}
	
	
	
}
