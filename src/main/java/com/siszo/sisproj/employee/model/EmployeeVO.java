package com.siszo.sisproj.employee.model;

import java.sql.Timestamp;

public class EmployeeVO {
	private int empNo;
	private String empName;
	private String empEName;
	private String empPwd;
	private String empTel;
	private String empSsn;
	private String empEmail;
	private String empZipcode;
	private String empAddr;
	private String empAddr2;
	private String empHobby;
	private String empSchool;
	private String empMajor;
	private String empImg;
	private String empLev;
	private int empSal;
	private String empBookMark;
	private int deptNo;
	private String deptName;
	private String posName;
	private int posNo;
	private Timestamp empHiredate;
	private Timestamp empOutdate;
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpEName() {
		return empEName;
	}
	public void setEmpEName(String empEName) {
		this.empEName = empEName;
	}
	public String getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getEmpSsn() {
		return empSsn;
	}
	public void setEmpSsn(String empSsn) {
		this.empSsn = empSsn;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpZipcode() {
		return empZipcode;
	}
	public void setEmpZipcode(String empZipcode) {
		this.empZipcode = empZipcode;
	}
	public String getEmpAddr() {
		return empAddr;
	}
	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}
	public String getEmpAddr2() {
		return empAddr2;
	}
	public void setEmpAddr2(String empAddr2) {
		this.empAddr2 = empAddr2;
	}
	public String getEmpHobby() {
		return empHobby;
	}
	public void setEmpHobby(String empHobby) {
		this.empHobby = empHobby;
	}
	public String getEmpSchool() {
		return empSchool;
	}
	public void setEmpSchool(String empSchool) {
		this.empSchool = empSchool;
	}
	public String getEmpMajor() {
		return empMajor;
	}
	public void setEmpMajor(String empMajor) {
		this.empMajor = empMajor;
	}
	public String getEmpImg() {
		return empImg;
	}
	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}
	public String getEmpLev() {
		return empLev;
	}
	public void setEmpLev(String empLev) {
		this.empLev = empLev;
	}
	public int getEmpSal() {
		return empSal;
	}
	public void setEmpSal(int empSal) {
		this.empSal = empSal;
	}
	public String getEmpBookMark() {
		return empBookMark;
	}
	public void setEmpBookMark(String empBookMark) {
		this.empBookMark = empBookMark;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
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
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public Timestamp getEmpHiredate() {
		return empHiredate;
	}
	public void setEmpHiredate(Timestamp empHiredate) {
		this.empHiredate = empHiredate;
	}
	public Timestamp getEmpOutdate() {
		return empOutdate;
	}
	public void setEmpOutdate(Timestamp empOutdate) {
		this.empOutdate = empOutdate;
	}
	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", empName=" + empName + ", empEName=" + empEName + ", empPwd=" + empPwd
				+ ", empTel=" + empTel + ", empSsn=" + empSsn + ", empEmail=" + empEmail + ", empZipcode=" + empZipcode
				+ ", empAddr=" + empAddr + ", empAddr2=" + empAddr2 + ", empHobby=" + empHobby + ", empSchool="
				+ empSchool + ", empMajor=" + empMajor + ", empImg=" + empImg + ", empLev=" + empLev + ", empSal="
				+ empSal + ", empBookMark=" + empBookMark + ", deptNo=" + deptNo + ", deptName=" + deptName
				+ ", posName=" + posName + ", posNo=" + posNo + ", empHiredate=" + empHiredate + ", empOutdate="
				+ empOutdate + "]";
	}
	

	
}
