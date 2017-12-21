package com.siszo.sisproj.confirm.confirmline.model;

public interface ConfirmLineDAO {
	public ConfirmLineVO selectConfirmerByEmpNo(int empNo);
	public int insertConfirmLine(ConfirmLineVO vo);
	public int myConfirmOk(ConfirmLineVO vo);
}
