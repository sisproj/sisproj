package com.siszo.sisproj.confirm.common;

import com.siszo.sisproj.common.SearchVO;

public class ConfirmSearchVO extends SearchVO{
	private String listType; //리스트 형태
	private int empNo; //내 사원번호
	private String isRead; //읽은글인지 여부
	private int cfConfirmer; //다음결재자
	
	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
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
		return "ConfirmSearchVO [listType=" + listType + ", empNo=" + empNo + ", isRead=" + isRead + ", cfConfirmer="
				+ cfConfirmer + "]";
	}
	
}
