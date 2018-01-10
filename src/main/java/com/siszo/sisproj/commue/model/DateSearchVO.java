package com.siszo.sisproj.commue.model;

import com.siszo.sisproj.commue.common.ComSearchVO;

public class DateSearchVO extends ComSearchVO{
	private String startDay; 
	private String empName;
	private String posName;
	private String deptName;
	
	private String year;
	private String month;
	
	private int empNo;
	private int total;
	
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}

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
				+ deptName + ", year=" + year + ", month=" + month + ", empNo=" + empNo + ", total=" + total +", firstRecordIndex=" + getFirstRecordIndex()				
				+ ", recordCountPerPage=" + getRecordCountPerPage() + "]";
	}
}
