package com.siszo.sisproj.login.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.employee.model.EmployeeVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDao;

	private static Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	@Override
	public int loginCheck(int empNo, String empPwd) {
		int result=0;
		
		EmployeeVO vo = loginDao.selectAdmin(empNo);
		
		if(vo.getEmpPwd()==null || vo.getEmpPwd().isEmpty()) {
			result=ID_NONE;
		}else if(vo.getEmpPwd().equals(empPwd)){
			result=LOGIN_OK;		
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
