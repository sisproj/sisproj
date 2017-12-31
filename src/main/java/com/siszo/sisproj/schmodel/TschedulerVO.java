package com.siszo.sisproj.schmodel;

public class TschedulerVO {
	private String tschNo;
	private String tschText;
	private String tschStart;
	private String tschEnd;
	private String tschContent;
	private String tschCateg;
	private int deptNo;
	private String tschEventLocation;
	public String getTschNo() {
		return tschNo;
	}
	public void setTschNo(String tschNo) {
		this.tschNo = tschNo;
	}
	public String getTschText() {
		return tschText;
	}
	public void setTschText(String tschText) {
		this.tschText = tschText;
	}
	public String getTschStart() {
		return tschStart;
	}
	public void setTschStart(String tschStart) {
		this.tschStart = tschStart;
	}
	public String getTschEnd() {
		return tschEnd;
	}
	public void setTschEnd(String tschEnd) {
		this.tschEnd = tschEnd;
	}
	public String getTschContent() {
		return tschContent;
	}
	public void setTschContent(String tschContent) {
		this.tschContent = tschContent;
	}
	public String getTschCateg() {
		return tschCateg;
	}
	public void setTschCateg(String tschCateg) {
		this.tschCateg = tschCateg;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getTschEventLocation() {
		return tschEventLocation;
	}
	public void setTschEventLocation(String tschEventLocation) {
		this.tschEventLocation = tschEventLocation;
	}
	
	
	@Override
	public String toString() {
		return "TschedulerVO [tschNo=" + tschNo + ", tschText=" + tschText + ", tschStart=" + tschStart + ", tschEnd="
				+ tschEnd + ", tschContent=" + tschContent + ", tschCateg=" + tschCateg + ", deptNo=" + deptNo
				+ ", tschEventLocation=" + tschEventLocation + "]";
	}
	
	
	
}
