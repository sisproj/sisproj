package com.siszo.sisproj.confirm.confirmline.model;

import java.util.List;

public interface ConfirmLineDAO {
	public ConfirmLineVO selectConfirmerByEmpNo(int empNo);
	public int insertConfirmLine(ConfirmLineVO vo);
	public int myConfirmOk(ConfirmLineVO vo);
	public List<ConfirmLineVO> selectCfLineByCfNo(String cfNo);
	public int selectReferByEmpCf(ConfirmLineVO clVo);
}
