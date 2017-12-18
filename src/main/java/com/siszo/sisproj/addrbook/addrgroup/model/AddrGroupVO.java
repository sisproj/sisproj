package com.siszo.sisproj.addrbook.addrgroup.model;

public class AddrGroupVO {
	private int groupNo;
	private String groupName;
	private int addrNo;
	
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}
	@Override
	public String toString() {
		return "AddrGroupVO [groupNo=" + groupNo + ", groupName=" + groupName + ", addrNo=" + addrNo + "]";
	}
	
	
}
