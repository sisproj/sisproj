package com.siszo.sisproj.addrbook.addrbook.model;

public class AddrBookVO {
	private int addrNo;
	private String addrName;
	private String addrComp;
	private String addrTel;
	private String addrEmail;
	private String addrIsDel;
	private int groupNo;
	private String groupName;
	private int empNo;
	
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}
	public String getAddrName() {
		return addrName;
	}
	public void setAddrName(String addrName) {
		this.addrName = addrName;
	}
	public String getAddrComp() {
		return addrComp;
	}
	public void setAddrComp(String addrComp) {
		this.addrComp = addrComp;
	}
	public String getAddrTel() {
		return addrTel;
	}
	public void setAddrTel(String addrTel) {
		this.addrTel = addrTel;
	}
	public String getAddrEmail() {
		return addrEmail;
	}
	public void setAddrEmail(String addrEmail) {
		this.addrEmail = addrEmail;
	}	
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getAddrIsDel() {
		return addrIsDel;
	}
	public void setAddrIsDel(String addrIsDel) {
		this.addrIsDel = addrIsDel;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@Override
	public String toString() {
		return "AddrBookVO [addrNo=" + addrNo + ", addrName=" + addrName + ", addrComp=" + addrComp + ", addrTel="
				+ addrTel + ", addrEmail=" + addrEmail + ", addrIsDel=" + addrIsDel + ", groupNo=" + groupNo
				+ ", groupName=" + groupName + ", empNo=" + empNo + "]";
	}	
	
}
