package com.siszo.sisproj.commue.model;

import com.siszo.sisproj.commue.common.ComSearchVO;

public class DateSearchVO extends ComSearchVO{
	private String startDay; 
	private String empName;
	private String posName;
	private String deptName;
	
	public String getStartDay() {
		return startDay;
	}


	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public String getPosName() {
		return posName;
	}


	public void setPosName(String posName) {
		this.posName = posName;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", empName=" + empName + ", posName=" + posName + ", deptName="
				+ deptName + ", currentPage="
						+ getCurrentPage() 
						+ ", firstRecordIndex=" + getFirstRecordIndex()				
						+ ", recordCountPerPage=" + getRecordCountPerPage() +"]";
	}
}
