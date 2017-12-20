package com.siszo.sisproj.confirm.model;

import java.sql.Timestamp;

import com.siszo.sisproj.confirm.docform.model.DocumentFormVO;

public class DocumentVO extends DocumentFormVO{
	private String cfNo; //문서번호
	private int formNo; //양식번호
	private int empNo; //기안자
	private String empName; //사원이름(join emp.emp_name)
	private Timestamp cfRegdate; //기안일자
	private String linkCfNo; //연계문서번호
	private String cfTitle; //기안제목
	private String cfContent; //기안내용
	private String cfIsfile; //파일여부
	private String cfStatus; //현재상태
	
	public String getCfNo() {
		return cfNo;
	}
	public void setCfNo(String cfNo) {
		this.cfNo = cfNo;
	}
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
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
	public Timestamp getCfRegdate() {
		return cfRegdate;
	}
	public void setCfRegdate(Timestamp cfRegdate) {
		this.cfRegdate = cfRegdate;
	}
	public String getLinkCfNo() {
		return linkCfNo;
	}
	public void setLinkCfNo(String linkCfNo) {
		this.linkCfNo = linkCfNo;
	}
	public String getCfTitle() {
		return cfTitle;
	}
	public void setCfTitle(String cfTitle) {
		this.cfTitle = cfTitle;
	}
	public String getCfContent() {
		return cfContent;
	}
	public void setCfContent(String cfContent) {
		this.cfContent = cfContent;
	}
	public String getCfIsfile() {
		return cfIsfile;
	}
	public void setCfIsfile(String cfIsfile) {
		this.cfIsfile = cfIsfile;
	}
	public String getCfStatus() {
		return cfStatus;
	}
	public void setCfStatus(String cfStatus) {
		this.cfStatus = cfStatus;
	}
	
	@Override
	public String toString() {
		return "DocumentVO [cfNo=" + cfNo + ", formNo=" + formNo + ", empNo=" + empNo + ", empName=" + empName
				+ ", cfRegdate=" + cfRegdate + ", linkCfNo=" + linkCfNo + ", cfTitle=" + cfTitle + ", cfContent="
				+ cfContent + ", cfIsfile=" + cfIsfile + ", cfStatus=" + cfStatus + ", getTypeNo()=" + getTypeNo()
				+ ", getTypeType()=" + getTypeType() + ", getFormName()=" + getFormName() + ", getFormSecu()="
				+ getFormSecu() + ", getFormLife()=" + getFormLife() + ", getFormEx()=" + getFormEx() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
