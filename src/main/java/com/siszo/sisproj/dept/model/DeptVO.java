package com.siszo.sisproj.dept.model;

public class DeptVO {
	private int dept_No;
	private String dept_Name;
	
	public int getDept_No() {
		return dept_No;
	}
	public void setDept_No(int dept_No) {
		this.dept_No = dept_No;
	}
	public String getDept_Name() {
		return dept_Name;
	}
	public void setDept_Name(String dept_Name) {
		this.dept_Name = dept_Name;
	}
	@Override
	public String toString() {
		return "DeptVO [dept_No=" + dept_No + ", dept_Name=" + dept_Name + "]";
	}
	
	
	
}
