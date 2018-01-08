package com.siszo.sisproj.webhard.board.model;

import java.sql.Timestamp;

public class WebhardBoardVO {
	private int webNo;
	private int empNo;
	private String empName;
	private String webTitle;
	private String webContent;
	private Timestamp webRegdate;
	private int commCnt;
	
	public int getWebNo() {
		return webNo;
	}
	public void setWebNo(int webNo) {
		this.webNo = webNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getWebTitle() {
		return webTitle;
	}
	public void setWebTitle(String webTitle) {
		this.webTitle = webTitle;
	}
	public String getWebContent() {
		return webContent;
	}
	public void setWebContent(String webContent) {
		this.webContent = webContent;
	}
	public Timestamp getWebRegdate() {
		return webRegdate;
	}
	public void setWebRegdate(Timestamp webRegdate) {
		this.webRegdate = webRegdate;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getCommCnt() {
		return commCnt;
	}
	public void setCommCnt(int commCnt) {
		this.commCnt = commCnt;
	}
	@Override
	public String toString() {
		return "WebhardBoardVO [webNo=" + webNo + ", empNo=" + empNo + ", empName=" + empName + ", webTitle=" + webTitle
				+ ", webContent=" + webContent + ", webRegdate=" + webRegdate + ", commCnt=" + commCnt + "]";
	}
	
	
}
