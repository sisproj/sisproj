package com.siszo.sisproj.schmodel;

import com.siszo.sisproj.common.SchedulerUtility;

public class SchedulerVO {
	private String pschNo;
	private String pschTitle;
	private String pschText;
	private String pschPlace;
	private String pschStart;
	private String pschEnd;
	private String pschCateg;
	private int empNo;
	public String getPschText() {
		return pschText;
	}
	public void setPschText(String pschText) {
		this.pschText = pschText;
	}
	public String getPschPlace() {
		return pschPlace;
	}
	public void setPschPlace(String pschPlace) {
		this.pschPlace = pschPlace;
	}
	public String getPschNo() {
		return pschNo;
	}
	public void setPschNo(String pschNo) {
		this.pschNo = pschNo;
	}
	public String getPschTitle() {
		return pschTitle;
	}
	public void setPschTitle(String pschTitle) {
		this.pschTitle = pschTitle;
	}
	public String getPschStart() {
		return pschStart;
	}
	public void setPschStart(String pschStart) {
		this.pschStart = pschStart;
	}
	public String getPschEnd() {
		return pschEnd;
	}
	public void setPschEnd(String pschEnd) {
		this.pschEnd = pschEnd;
	}
	public String getPschCateg() {
		return pschCateg;
	}
	public void setPschCateg(String pschCateg) {
		this.pschCateg = pschCateg;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "SchedulerVO [pschNo=" + pschNo + ", pschTitle=" + pschTitle + ", pschText=" + pschText + ", pschPlace="
				+ pschPlace + ", pschStart=" + pschStart + ", pschEnd=" + pschEnd + ", pschCateg=" + pschCateg
				+ ", empNo=" + empNo + "]";
	}

	
	    
	
}
