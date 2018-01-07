package com.siszo.sisproj.addrbook.addrgroup.model;

import java.util.List;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;

public interface AddrGroupService {
	public List<AddrGroupVO> selectGroupName(int empNo);
	public int insertGroup(AddrGroupVO groupVo);
	public int insertGroupDefault(AddrGroupVO groupVo);
	public int deleteGroup(int groupNo);
	public int countGroup(int empNo);

}
