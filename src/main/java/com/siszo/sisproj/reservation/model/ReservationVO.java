package com.siszo.sisproj.reservation.model;

import java.sql.Timestamp;

public class ReservationVO {
	private int rvNo;
	private int resNo;
	private String rvStart;
	private String rvEnd;
	private int empNo;
	private String rvContent;
	private String rvConfirm;
	private Timestamp rvRegdate;
	private String resCateg;
	private String resName;
	private int deptNo;
	
	
	
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getRvStart() {
		return rvStart;
	}
	public void setRvStart(String rvStart) {
		this.rvStart = rvStart;
	}
	public String getRvEnd() {
		return rvEnd;
	}
	public void setRvEnd(String rvEnd) {
		this.rvEnd = rvEnd;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getRvConfirm() {
		return rvConfirm;
	}
	public void setRvConfirm(String rvConfirm) {
		this.rvConfirm = rvConfirm;
	}
	public Timestamp getRvRegdate() {
		return rvRegdate;
	}
	public void setRvRegdate(Timestamp rvRegdate) {
		this.rvRegdate = rvRegdate;
	}
	public String getResCateg() {
		return resCateg;
	}
	public void setResCateg(String resCateg) {
		this.resCateg = resCateg;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	@Override
	public String toString() {
		return "ReservationVO [rvNo=" + rvNo + ", resNo=" + resNo + ", rvStart=" + rvStart + ", rvEnd=" + rvEnd
				+ ", empNo=" + empNo + ", rvContent=" + rvContent + ", rvConfirm=" + rvConfirm + ", rvRegdate="
				+ rvRegdate + ", resCateg=" + resCateg + ", resName=" + resName + ", deptNo=" + deptNo + "]";
	}


}
