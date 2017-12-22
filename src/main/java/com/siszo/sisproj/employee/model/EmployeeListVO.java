package com.siszo.sisproj.employee.model;

import java.util.List;


public class EmployeeListVO {
	private List<EmployeeVO> empItems;

	public List<EmployeeVO> getEmpItems() {
		return empItems;
	}

	public void setEmpItems(List<EmployeeVO> empItems) {
		this.empItems = empItems;
	}

	@Override
	public String toString() {
		return "EmployeeListVO [empItems=" + empItems + "]";
	}
	
}
