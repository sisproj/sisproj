package com.siszo.sisproj.commue.model;

import java.util.List;

public interface CommueService {
	public static final int CHECK_OUT=1; // 출근 하지않음
	public static final int CHECK_IN=2;	// 퇴근 하지않음
	public static final int CHECK_IN_OK=3; //  이미 출근 함
	public static final int CHECK_OUT_OK=4; //이미 퇴근 함
	
	public List<CommueVO> selectAll();
	public int insertIn(CommueVO comVo);
	public int updateOut(int cmtNo);
	public CommueVO selectByEmpNo(int empNo);
/*	public int checkCmt(int empNo);*/
}
