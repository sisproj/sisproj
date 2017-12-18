package com.siszo.sisproj.addrbook.addrbook.model;

public class AddrBookVO {
	private int addrNo;
	private String addrName;
	private String addrComp;
	private String addrTel;
	private String addrEmail;
	private String addrGruopNo;
	private String addrIsDel;
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
	public String getAddrGruopNo() {
		return addrGruopNo;
	}
	public void setAddrGruopNo(String addrGruopNo) {
		this.addrGruopNo = addrGruopNo;
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
	@Override
	public String toString() {
		return "AddrBookVO [addrNo=" + addrNo + ", addrName=" + addrName + ", addrComp=" + addrComp + ", addrTel="
				+ addrTel + ", addrEmail=" + addrEmail + ", addrGruopNo=" + addrGruopNo + ", addrIsDel=" + addrIsDel
				+ ", empNo=" + empNo + "]";
	}
	
	
}
