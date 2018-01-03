package com.siszo.sisproj.commue.model;

import java.util.List;

public interface CommueDAO {
	
	public CommueVO selectByNo(int cmtNo);
	public int insertIn(CommueVO comVo);
	public int updateOut(int cmtNo);
	public CommueVO checkCmt(int empNo);
	public CommueVO selectByEmpNo(int empNo);
	
	public List<CommueVO> selectAll();
}
