package com.siszo.sisproj.addrbook.addrgroup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddrGroupServiceImpl implements AddrGroupService{
	@Autowired
	private AddrGroupDAO addrGroupDao;

	@Override
	public List<AddrGroupVO> selectGroupName(int empNo) {
		return addrGroupDao.selectGroupName(empNo);
	}
}
