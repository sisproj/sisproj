package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AddrBookServiceImpl implements AddrBookService{
	@Autowired
	private AddrBookDAO addrBookDao;

	@Override
//	public List<AddrBookVO> selectAddrBookAll(int groupNo) {
	public List<AddrBookVO> selectAddrBookAll(Map<String, Integer> map) {
		return addrBookDao.selectAddrBookAll(map);
	}
	@Override
	public List<AddrBookVO> selectAddrBookIsDelY() {
		return addrBookDao.selectAddrBookIsDelY();
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
	public int deleteAddrBook() {
		return addrBookDao.deleteAddrBook();
	}
	
}
