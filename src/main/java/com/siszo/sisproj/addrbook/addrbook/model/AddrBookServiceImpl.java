package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.common.AddrSearchVO;

@Service
public class AddrBookServiceImpl implements AddrBookService{
	@Autowired
	private AddrBookDAO addrBookDao;

	@Override
	public List<AddrBookVO> selectAddrBookAll(AddrSearchVO searchVo) {
		return addrBookDao.selectAddrBookAll(searchVo);
	}
	@Override
	public List<AddrBookVO> selectAddrBookIsDelY(AddrSearchVO searchVo) {
		return addrBookDao.selectAddrBookIsDelY(searchVo);
	}

	@Override
	public int insertAddrBook(AddrBookVO vo) {
		return addrBookDao.insertAddrBook(vo);
	}

	@Override
	@Transactional
	public int updateIsDelYMulti(List<AddrBookVO> list) {
		int cnt=0;
		try {
			for (AddrBookVO vo : list) {
				int addrNo=vo.getAddrNo();
				if(addrNo!=0) {
					cnt=addrBookDao.updateIsDelY(addrNo);
				}
			}
		}catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int updateIsDelNMulti(List<AddrBookVO> list) {
		int cnt=0;
		try {
			for (AddrBookVO vo : list) {
				int addrNo=vo.getAddrNo();
				if(addrNo!=0) {
					cnt=addrBookDao.updateIsDelN(addrNo);
				}
			}
		}catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public int deleteAddrBook(int empNo) {
		return addrBookDao.deleteAddrBook(empNo);
	}
	@Override
	public int selectTotalRecordCountN(AddrSearchVO searchVo) {
		return addrBookDao.selectTotalRecordCountN(searchVo);
	}
	@Override
	public int selectTotalRecordCountY(AddrSearchVO searchVo) {
		return addrBookDao.selectTotalRecordCountY(searchVo);
	}
	@Override
	public AddrBookVO selectByAddrNo(int addrNo) {
		return addrBookDao.selectByAddrNo(addrNo);
	}
	@Override
	public int updateAddrBook(AddrBookVO vo) {
		return addrBookDao.updateAddrBook(vo);
	}
	
}
