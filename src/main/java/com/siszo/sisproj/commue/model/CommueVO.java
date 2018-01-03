package com.siszo.sisproj.commue.model;

import java.sql.Timestamp;

public class CommueVO {
	private int cmtNo;
	private int empNo;
	private Timestamp cmtIn;
	private Timestamp cmtOut;
	private String cmtStatus;
	//join
	private String deptName;
	private String posName;
	private String empName;
	
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
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	@Override
	public String toString() {
		return "CommueVO [cmtNo=" + cmtNo + ", empNo=" + empNo + ", cmtIn=" + cmtIn + ", cmtOut=" + cmtOut
				+ ", cmtStatus=" + cmtStatus + ", deptName=" + deptName + ", posName=" + posName + ", empName="
				+ empName + "]";
	}
}
