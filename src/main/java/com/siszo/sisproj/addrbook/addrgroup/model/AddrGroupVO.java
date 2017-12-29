package com.siszo.sisproj.addrbook.addrgroup.model;

public class AddrGroupVO {
	private int groupNo;
	private String groupName;
	private int empNo;
	
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
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "AddrGroupVO [groupNo=" + groupNo + ", groupName=" + groupName + ", empNo=" + empNo + "]";
	}	
	
}
