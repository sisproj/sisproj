package com.siszo.sisproj.employee.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.common.SearchVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
	@Autowired
	private EmployeeDAO employeeDao;

	@Override
	public int insertEmployee(EmployeeVO vo) {
		return employeeDao.insertEmployee(vo); 
	}

	@Override
	public List<EmployeeVO> selectAllEmployee(SearchVO vo) {		
		return employeeDao.selectAllEmployee(vo);	
	}

	@Override
	public int editEmployee(EmployeeVO vo) {
		return employeeDao.editEmployee(vo);
	}

	@Override
	public List<EmployeeVO> selectEmployeeByEmpPosition(String empName) {
		return employeeDao.selectEmployeeByEmpName(empName);		 		 
	}

	@Override
	public EmployeeVO selectEmployeeByNo(int empNo) {
		return employeeDao.selectEmployeeByNo(empNo);	
	}

	@Override
	public int employeeOut(List<EmployeeVO> list) {
		int cnt=0;
		try {
			for(EmployeeVO vo :list) {
				int empNo=vo.getEmpNo();
				//체크한 사원만 퇴사
				if(empNo!=0) {
					cnt = employeeDao.employeeOut(empNo);
				}
			}//for			
		}catch(RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int selectTotalRecordCount(SearchVO vo) {
		return employeeDao.selectTotalRecordCount(vo);
	}

	@Override
	public int employeeCome(List<EmployeeVO> list) {
		int cnt=0;
		try {
			for(EmployeeVO vo :list) {
				int empNo=vo.getEmpNo();
				//체크한 사원만 복직
				if(empNo!=0) {
					cnt = employeeDao.employeeCome(empNo);
				}
			}//for			
		}catch(RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int employeeEditPwd(EmployeeVO empVo) {
		return employeeDao.employeeEditPwd(empVo);
	}

	@Override
	public int employeeUpdateMaster(List<EmployeeVO> list) {
		int cnt=0;
		try {
			for(EmployeeVO vo :list) {
				int empNo=vo.getEmpNo();
				//체크한 사원만 권한 관리자로
				if(empNo!=0) {
					cnt = employeeDao.employeeUpdateMaster(empNo);
				}
			}//for			
		}catch(RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int employeeUpdateTeam(List<EmployeeVO> list) {
		int cnt=0;
		try {
			for(EmployeeVO vo :list) {
				int empNo=vo.getEmpNo();
				//체크한 사원만 권한 팀장으로
				if(empNo!=0) {
					cnt = employeeDao.employeeUpdateTeam(empNo);
				}
			}//for			
		}catch(RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int employeeTeamCheck(int empNo) {
		int team= employeeDao.employeeTeamCheck(empNo);

		int result=0;
		if(team!=0) {
			result=TEAM_OK;
		}else if(team==0) {
			result=TEAM_NONE;
		}
		logger.info("사원 직급 체크 결과 result={}",result);
		return result;
	}

	@Override
	public int employeeMasterCheck(int empNo) {
		int master = employeeDao.employeeMasterCheck(empNo);
		int result=0;
		if(master!=0) {
			result=MASTER_OK;
		}else if(master==0) {
			result=MASTER_NONE;
		}
		logger.info("사원 직급 체크 결과 result={}",result);
		return result;
	}

	@Override
	public int employeeOutCheck(int empNo) {
		int out = employeeDao.employeeOutCheck(empNo);
		int result=0;
		if(out!=0) {
			result=OUT_OK;
		}else if(out==0) {
			result=OUT_NONE;
		}
		
		logger.info("퇴사 결과 result={}",result);
		return result;
	}

	@Override
	public int editEmployeeEmp(EmployeeVO vo) {
		return employeeDao.editEmployeeEmp(vo);
	}

}
