package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddrBookServiceImpl implements AddrBookService{
	@Autowired
	private AddrBookDAO addrBookDao;

	@Override
	public List<AddrBookVO> selectAddrBookAll() {
		return addrBookDao.selectAddrBookAll();
	}
}
