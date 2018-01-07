package com.siszo.sisproj.commue.model;

import java.util.List;
import java.util.Map;

public interface CommueService {
	public static final int CHECK_IN=1;	// 출근 하지않음
	public static final int CHECK_IN_OK=2; //  이미 출근 함
	public static final int CHECK_OUT=3; // 퇴근 하지않음
	public static final int CHECK_OUT_OK=4; //이미 퇴근 함
	
	public List<CommueVO> selectAll();
	public int insertIn(CommueVO comVo);
	public int updateOut(int cmtNo);
	
	public CommueVO selectByEmpNo(int empNo);
	public List<Map<String, Object>> searchDate(DateSearchVO vo);
	public int selectInChk(int empNo);
	public int selectOutChk(int empNo);
	public int selectTotalRecord(DateSearchVO vo);
}
