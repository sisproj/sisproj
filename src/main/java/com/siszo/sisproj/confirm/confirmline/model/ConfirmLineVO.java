package com.siszo.sisproj.confirm.confirmline.model;

import java.sql.Timestamp;

public class ConfirmLineVO {

	private int lineNo; //결재라인번호
	private int empNo; //결재자(사원번호)
	private String empName; //결재자(이름) (join emp.empNo)
	private String lineStat; //결재 상태
	private String cfNo; //결재문서 번호
	private Timestamp lineRegdate; //결재변경일자
	
	public int getLineNo() {
		return lineNo;
	}
	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
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
	public String getLineStat() {
		return lineStat;
	}
	public void setLineStat(String lineStat) {
		this.lineStat = lineStat;
	}
	public String getCfNo() {
		return cfNo;
	}
	public void setCfNo(String cfNo) {
		this.cfNo = cfNo;
	}
	public Timestamp getLineRegdate() {
		return lineRegdate;
	}
	public void setLineRegdate(Timestamp lineRegdate) {
		this.lineRegdate = lineRegdate;
	}
	
	@Override
	public String toString() {
		return "ConfirmLineVO [lineNo=" + lineNo + ", empNo=" + empNo + ", empName=" + empName + ", lineStat="
				+ lineStat + ", cfNo=" + cfNo + ", lineRegdate=" + lineRegdate + "]";
	}
}
