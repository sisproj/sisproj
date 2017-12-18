package com.siszo.sisproj.organization.model;

import java.util.List;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface OrganizationService {
	public List<EmployeeVO> selectEmp();
}
