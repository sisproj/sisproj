package com.siszo.sisproj.organization.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.employee.model.EmployeeVO;

@Service
public class OrganizationSeviceImpl implements OrganizationService{
	@Autowired
	private OrganizationDAO orgDao;

	@Override
	public List<EmployeeVO> selectEmp() {
		return orgDao.selectEmp();
	}
}