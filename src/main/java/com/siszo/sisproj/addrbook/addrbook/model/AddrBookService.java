package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;

public interface AddrBookService {
	public List<AddrBookVO> selectAddrBookAll();
	public int insertAddrBook(AddrBookVO vo);
}
