package com.siszo.sisproj.commue.model;

import java.util.List;

public interface CommueService {
	public List<CommueVO> selectAllCom();
	public int insertIn(int empNo);
}
