package com.siszo.sisproj.confirm.model;

import java.util.List;

public class DocumentListVO {
	private List<DocumentVO> docuItems;

	public List<DocumentVO> getDocuItems() {
		return docuItems;
	}

	public void setDocuItems(List<DocumentVO> docuItems) {
		this.docuItems = docuItems;
	}

	@Override
	public String toString() {
		return "DocumentListVO [docuItems=" + docuItems + "]";
	}
}
