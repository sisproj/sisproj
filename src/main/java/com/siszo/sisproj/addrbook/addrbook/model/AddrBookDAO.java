package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

public interface AddrBookDAO {
//	public List<AddrBookVO> selectAddrBookAll(int groupNo);
	public List<AddrBookVO> selectAddrBookAll(Map<String, Integer> map);
	public List<AddrBookVO> selectAddrBookIsDelY();
	public int insertAddrBook(AddrBookVO vo);
	public int updateIsDelY(int addrNo);
	public int updateIsDelN(int addrNo);
	public int deleteAddrBook();
}
