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
		
		logger.info("로그인 할때 실패시  vo={}",vo);
		
		if(vo==null || vo.getEmpNo()!=empNo) {
			result=ID_NONE;
		}else if(vo.getEmpPwd().equals(empPwd)){		
			if(vo.getEmpOutdate()!=null) {
				result=EMP_OUT;
			}else {				
				result=LOGIN_OK;		
			}
		}else if((vo.getEmpPwd()!=null && !vo.getEmpPwd().isEmpty())){
			result=PWD_DISAGREE;
		}
		logger.info("로그인 확인 결과 result={}",result);
		return result;	
	}

	@Override
	public EmployeeVO selectAdmin(int empNo) {
		return loginDao.selectAdmin(empNo);
	}

	@Override
	public int searchPwd(int empNo, String empName) {
		int result =0;
		EmployeeVO vo = loginDao.selectAdmin(empNo);
		
		logger.info("비밀번호 찾기 파라미터  vo={}",vo);
		
		if(vo.getEmpNo()!=empNo) {
			result=ID_NONE;
		}else if(!vo.getEmpName().equals(empName)) {
			result=NAME_DISAGREE;
		}else if(empNo==vo.getEmpNo() && empName.equals(vo.getEmpName())) {
			result=SUSSCES_SEARCH;
		}
		logger.info("비밀번호 찾기 후 결과 result={}",result);
		return result;	
	}
}
