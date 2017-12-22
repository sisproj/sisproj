package com.siszo.sisproj.confirm.common;

import com.siszo.sisproj.common.SearchVO;

public class ConfirmSearchVO extends SearchVO{
	private String listType;

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
