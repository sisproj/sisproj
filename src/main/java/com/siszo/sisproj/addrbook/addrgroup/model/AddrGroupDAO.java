package com.siszo.sisproj.addrbook.addrgroup.model;

import java.util.List;

public interface AddrGroupDAO {
	public List<AddrGroupVO> selectGroupName(int empNo);
}
