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
	private String empPosition;
	private Timestamp empHiredate;
	private Timestamp empOutdate;
	private long empImgSize;
	
	private String tel1;
	private String tel2;
	private String tel3;
	private String email1;
	private String email2;
	private String email3;
	private String jumin1;
	private String jumin2;
	
	
	public String getEmpPosition() {
		return empPosition;
	}
	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}
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
	public Timestamp getEmpHiredate() {
		return empHiredate;
	}
	public void setEmpHiredate(Timestamp empHiredate) {
		this.empHiredate = empHiredate;
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
	public Timestamp getEmpOutdate() {
		return empOutdate;
	}
	public void setEmpOutdate(Timestamp empOutdate) {
		this.empOutdate = empOutdate;
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
	
	public long getEmpImgSize() {
		return empImgSize;
	}
	public void setEmpImgSize(long empImgSize) {
		this.empImgSize = empImgSize;
	}
	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", empName=" + empName + ", empEName=" + empEName + ", empPwd=" + empPwd
				+ ", empTel=" + empTel + ", empSsn=" + empSsn + ", empEmail=" + empEmail + ", empZipcode=" + empZipcode
				+ ", empAddr=" + empAddr + ", empAddr2=" + empAddr2 + ", empHobby=" + empHobby + ", empSchool="
				+ empSchool + ", empMajor=" + empMajor + ", empImg=" + empImg + ", empLev=" + empLev + ", empSal="
				+ empSal + ", empBookMark=" + empBookMark + ", deptNo=" + deptNo + ", empPosition=" + empPosition
				+ ", empHiredate=" + empHiredate + ", empOutdate=" + empOutdate + ", empImgSize=" + empImgSize
				+ ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", email1=" + email1 + ", email2=" + email2
				+ ", email3=" + email3 + ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + "]";
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getEmail3() {
		return email3;
	}
	public void setEmail3(String email3) {
		this.email3 = email3;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	
}
