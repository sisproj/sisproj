package com.siszo.sisproj.employee.model;

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
		
}
