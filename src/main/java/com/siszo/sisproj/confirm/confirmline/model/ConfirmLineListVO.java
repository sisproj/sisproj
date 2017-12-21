package com.siszo.sisproj.confirm.confirmline.model;

import java.util.List;

public class ConfirmLineListVO {
	private List<ConfirmLineVO> confirmLises;

	public List<ConfirmLineVO> getConfirmLises() {
		return confirmLises;
	}

	public void setConfirmLises(List<ConfirmLineVO> confirmLises) {
		this.confirmLises = confirmLises;
	}

	@Override
	public String toString() {
		return "ConfirmLineListVO [confirmLises=" + confirmLises + "]";
	}
}
