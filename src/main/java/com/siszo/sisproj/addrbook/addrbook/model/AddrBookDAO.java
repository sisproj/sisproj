package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;

public interface AddrBookDAO {
	public List<AddrBookVO> selectAddrBookAll();
	public int insertAddrBook(AddrBookVO vo);
	public int updateIsDelY(int addrNo);
	public int updateIsDelN(int addrNo);
}
