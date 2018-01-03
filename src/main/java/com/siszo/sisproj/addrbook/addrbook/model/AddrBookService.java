package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

import com.siszo.sisproj.common.AddrSearchVO;

public interface AddrBookService {
	public List<AddrBookVO> selectAddrBookAll(AddrSearchVO searchVo);
	public List<AddrBookVO> selectAddrBookIsDelY(AddrSearchVO searchVo);
	public int insertAddrBook(AddrBookVO vo);
	public int updateIsDelYMulti(List<AddrBookVO> list);
	public int updateIsDelNMulti(List<AddrBookVO> list);
	public int deleteAddrBook(int empNo);
	public int selectTotalRecordCountN(AddrSearchVO searchVo);
	public int selectTotalRecordCountY(AddrSearchVO searchVo);
	public AddrBookVO selectByAddrNo(int addrNo);
	public int updateAddrBook(AddrBookVO vo);
}
