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
	private String changeTitle; //변경 후 이름
	private String cfContent; //기안내용
	private String cfIsfile; //파일여부
	private String cfStatus; //현재상태
	private String allConfirmers; //결재자 전체
	private String isRead; //읽은 글인지 여부
	private int cfConfirmer;//현재 결재완료자 수
	
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
	public String getChangeTitle() {
		return changeTitle;
	}
	public void setChangeTitle(String changeTitle) {
		this.changeTitle = changeTitle;
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
	public String getAllConfirmers() {
		return allConfirmers;
	}
	public void setAllConfirmers(String allConfirmers) {
		this.allConfirmers = allConfirmers;
	}
	public String getIsRead() {
		return isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	public int getCfConfirmer() {
		return cfConfirmer;
	}
	public void setCfConfirmer(int cfConfirmer) {
		this.cfConfirmer = cfConfirmer;
	}
	@Override
	public String toString() {
		return "DocumentVO [cfNo=" + cfNo + ", formNo=" + formNo + ", empNo=" + empNo + ", empName=" + empName
				+ ", cfRegdate=" + cfRegdate + ", linkCfNo=" + linkCfNo + ", cfTitle=" + cfTitle + ", changeTitle="
				+ changeTitle + ", cfContent=" + cfContent + ", cfIsfile=" + cfIsfile + ", cfStatus=" + cfStatus
				+ ", allConfirmers=" + allConfirmers + ", isRead=" + isRead + ", cfConfirmer=" + cfConfirmer + "]";
	}
	
}
