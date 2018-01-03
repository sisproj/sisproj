package com.siszo.sisproj.employee.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.common.SearchVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {

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

	
		
}
