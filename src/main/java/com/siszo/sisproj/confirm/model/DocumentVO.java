package com.siszo.sisproj.confirm.model;

import java.sql.Timestamp;

public class DocumentVO {
	private String cfNo; //문서번호
	private int formNo; //양식번호
	private String formName; //양식이름 (join doc_form.form_name)
	private int formTypeNo; //문서종류번호 (join doc_form.form_type_no)
	private String formSecu; //보안수준 (join doc_form.form_secu)
	private String formLife; //보존년한 (join doc_form.form_life)
	private String formEx; //설명
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
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public int getFormTypeNo() {
		return formTypeNo;
	}
	public void setFormTypeNo(int formTypeNo) {
		this.formTypeNo = formTypeNo;
	}
	public String getFormSecu() {
		return formSecu;
	}
	public void setFormSecu(String formSecu) {
		this.formSecu = formSecu;
	}
	public String getFormLife() {
		return formLife;
	}
	public void setFormLife(String formLife) {
		this.formLife = formLife;
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
		return "DocumentVO [cfNo=" + cfNo + ", formNo=" + formNo + ", formName=" + formName + ", formTypeNo="
				+ formTypeNo + ", formSecu=" + formSecu + ", formLife=" + formLife + ", empNo=" + empNo + ", empName="
				+ empName + ", cfRegdate=" + cfRegdate + ", linkCfNo=" + linkCfNo + ", cfTitle=" + cfTitle
				+ ", cfContent=" + cfContent + ", cfIsfile=" + cfIsfile + ", cfStatus=" + cfStatus + "]";
	}
}
