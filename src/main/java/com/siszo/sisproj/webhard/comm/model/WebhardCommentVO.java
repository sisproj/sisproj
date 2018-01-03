package com.siszo.sisproj.webhard.comm.model;

import java.sql.Timestamp;

public class WebhardCommentVO {
    private int commNo;
    private int empNo;
    private String empName;
    private Timestamp commRegdate;
    private String commContent;
    private int webNo;
    
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
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
	public Timestamp getCommRegdate() {
		return commRegdate;
	}
	public void setCommRegdate(Timestamp commRegdate) {
		this.commRegdate = commRegdate;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public int getWebNo() {
		return webNo;
	}
	public void setWebNo(int webNo) {
		this.webNo = webNo;
	}
	@Override
	public String toString() {
		return "WebhardCommentVO [commNo=" + commNo + ", empNo=" + empNo + ", empName=" + empName + ", commRegdate="
				+ commRegdate + ", commContent=" + commContent + ", webNo=" + webNo + "]";
	}
}
