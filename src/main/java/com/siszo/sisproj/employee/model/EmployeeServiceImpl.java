package com.siszo.sisproj.employee.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDAO employeeDao;
	
	@Override
	public int insertEmployee(EmployeeVO vo) {
		return employeeDao.insertEmployee(vo); 
	}
	
	@Override
	public List<EmployeeVO> selectAllEmployee() {
		return employeeDao.selectAllEmployee();
	}

	@Override
	public int editEmployee(EmployeeVO vo) {
		return employeeDao.editEmployee(vo);
	}

	@Override
	public List<EmployeeVO> selectEmployeeByEmpPosition(String empName) {
		 List<EmployeeVO> list=employeeDao.selectEmployeeByEmpName(empName);		 
	 
		 return list;
		 
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
					cnt = employeeDao.employeeSelect(empNo);
				}
			}//for			
		}catch(RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}
	
		
}
