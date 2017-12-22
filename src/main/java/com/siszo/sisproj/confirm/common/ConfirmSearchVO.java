package com.siszo.sisproj.confirm.common;

import com.siszo.sisproj.common.SearchVO;

public class ConfirmSearchVO extends SearchVO{
	private String listType; //리스트 형태
	private int empNo; //사원번호
	private String isRead; //읽은글인지 여부
	
	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	@Override
	public String toString() {
		return "ConfirmSearchVO [listType=" + listType + "]";
	}
}
