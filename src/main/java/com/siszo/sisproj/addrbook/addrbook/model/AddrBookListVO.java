package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;

public class AddrBookListVO {
	private List<AddrBookVO> addrItems;

	public List<AddrBookVO> getAddrItems() {
		return addrItems;
	}

	public void setAddrItems(List<AddrBookVO> addrItems) {
		this.addrItems = addrItems;
	}

	@Override
	public String toString() {
		return "AddrBookListVO [addrItems=" + addrItems + "]";
	}

}
