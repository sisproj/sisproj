package com.siszo.sisproj.commue.model;

import java.sql.Timestamp;

public class CommueVO {
	private int cmtNo;
	private int empNo;
	private Timestamp cmtIn;
	private Timestamp cmtOut;
	private String cmtStatus;
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public Timestamp getCmtIn() {
		return cmtIn;
	}
	public void setCmtIn(Timestamp cmtIn) {
		this.cmtIn = cmtIn;
	}
	public Timestamp getCmtOut() {
		return cmtOut;
	}
	public void setCmtOut(Timestamp cmtOut) {
		this.cmtOut = cmtOut;
	}
	public String getCmtStatus() {
		return cmtStatus;
	}
	public void setCmtStatus(String cmtStatus) {
		this.cmtStatus = cmtStatus;
	}
	@Override
	public String toString() {
		return "CommueVO [cmtNo=" + cmtNo + ", empNo=" + empNo + ", cmtIn=" + cmtIn + ", cmtOut=" + cmtOut
				+ ", cmtStatus=" + cmtStatus + "]";
	}
	
}
