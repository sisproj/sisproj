package com.siszo.sisproj.login.model;

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
		
		EmployeeVO vo = loginDao.selectAdmin(empNo);
		
		if(vo.getEmpPwd()==null || vo.getEmpPwd().isEmpty()) {
			result=ID_NONE;
		}else if(vo.getEmpPwd().equals(empPwd)){
			if(vo.getEmpLev().equals("사원")) {
				result=EMP_LOGIN;
			}else if(vo.getEmpLev().equals("관리자")){
				result=ADMIN_LOGIN;
			}
		}else {
			result=PWD_DISAGREE;
		}		
		return result;	
	}

	@Override
	public EmployeeVO selectAdmin(int empNo) {
		return loginDao.selectAdmin(empNo);
	}


	
	
	
}
