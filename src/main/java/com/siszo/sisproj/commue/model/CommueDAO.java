package com.siszo.sisproj.commue.model;

import java.util.List;
import java.util.Map;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface CommueDAO {
	
	public CommueVO selectByNo(int cmtNo);
	public int insertIn(CommueVO comVo);
	public int updateOut(int cmtNo);
	public CommueVO checkCmt(int empNo);
	public CommueVO selectByEmpNo(int empNo);
	public int selectInChk(int empNo);
	public int selectOutChk(int empNo);
	
	public List<CommueVO> selectAll();
	public List<Map<String, Object>> searchDate(DateSearchVO vo);
	public int selectTotalRecord(DateSearchVO vo);
	public List<Map<String, Object>> selectMonthList(DateSearchVO vo);
	public List<Map<String, Object>> selectMonthListGet(int empNo);
	public List<Map<String, Object>> selectMonthDeptName(DateSearchVO vo);
	public List<Map<String, Object>> selectDateCount(DateSearchVO vo);
	public int selectAllCount();

}

