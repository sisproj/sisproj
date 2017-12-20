package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

public interface AddrBookService {
//	public List<AddrBookVO> selectAddrBookAll(int groupNo);
	public List<AddrBookVO> selectAddrBookAll(Map<String, Integer> map);
	public List<AddrBookVO> selectAddrBookIsDelY();
	public int insertAddrBook(AddrBookVO vo);
	public int updateIsDelYMulti(List<AddrBookVO> list);
	public int updateIsDelNMulti(List<AddrBookVO> list);
	public int deleteAddrBook();
}
