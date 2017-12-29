package com.siszo.sisproj.schmodel;

import com.siszo.sisproj.common.SchedulerUtility;

public class SchedulerVO {
	private String pschNo;
	private String pschText;
	private String pschContent;
	private String pschEventLocation;
	private String pschStart;
	private String pschEnd;
	private String pschCateg;
	private int empNo;
	
	public String getPschNo() {
		return pschNo;
	}



	public void setPschNo(String pschNo) {
		this.pschNo = pschNo;
	}



	public String getPschText() {
		return pschText;
	}



	public void setPschText(String pschText) {
		this.pschText = pschText;
	}



	public String getPschContent() {
		return pschContent;
	}



	public void setPschContent(String pschContent) {
		this.pschContent = pschContent;
	}



	public String getPschEventLocation() {
		return pschEventLocation;
	}



	public void setPschEventLocation(String pschEventLocation) {
		this.pschEventLocation = pschEventLocation;
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
		return "SchedulerVO [pschNo=" + pschNo + ", pschText=" + pschText + ", pschContent=" + pschContent
				+ ", pschEventLocation=" + pschEventLocation + ", pschStart=" + pschStart + ", pschEnd=" + pschEnd
				+ ", pschCateg=" + pschCateg + ", empNo=" + empNo + "]";
	}
	
	

	
	    
	
}
