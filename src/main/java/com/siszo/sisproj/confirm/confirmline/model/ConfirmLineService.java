package com.siszo.sisproj.confirm.confirmline.model;

import java.util.List;

public interface ConfirmLineService {
	public static final String CL_AWAIT = "대기"; //결재 대기
	public static final String CL_COMPLETE = "승인"; //결재 승인
	public static final String CL_RETURN = "반려"; //결재 반려

	public ConfirmLineVO selectConfirmerByEmpNo(int empNo);
	public int insertConfirmers(List<ConfirmLineVO> list);
	public int myConfirmOk(ConfirmLineVO vo);
}
