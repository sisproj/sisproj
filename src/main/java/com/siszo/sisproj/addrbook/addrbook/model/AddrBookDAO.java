package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

import com.siszo.sisproj.common.AddrSearchVO;

public interface AddrBookDAO {
	public List<AddrBookVO> selectAddrBookAll(AddrSearchVO searchVo);
	public List<AddrBookVO> selectAddrBookIsDelY(AddrSearchVO searchVo);
	public int insertAddrBook(AddrBookVO vo);
	public int updateIsDelY(int addrNo);
	public int updateIsDelN(int addrNo);
	public int deleteAddrBook(int empNo);
	public int selectTotalRecordCountN(AddrSearchVO searchVo);
	public int selectTotalRecordCountY(AddrSearchVO searchVo);
}
