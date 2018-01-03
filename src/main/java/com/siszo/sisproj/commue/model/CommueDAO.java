package com.siszo.sisproj.commue.model;

import java.util.List;

public interface CommueDAO {
	public List<CommueVO> selectAllCom();
	public CommueVO selectByNo(int cmtNo);
	public int insertIn(int empNo);
	public int updateOut(int cmtNo);
}
