package com.siszo.sisproj.addrbook.addrgroup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;

@Service
public class AddrGroupServiceImpl implements AddrGroupService{
	@Autowired
	private AddrGroupDAO addrGroupDao;

	@Override
	public List<AddrGroupVO> selectGroupName(int empNo) {
		return addrGroupDao.selectGroupName(empNo);
	}

	@Override
	public int insertGroup(AddrGroupVO groupVo) {
		return addrGroupDao.insertGroup(groupVo);
	}

	@Override
	public int insertGroupDefault(AddrGroupVO groupVo) {
		return addrGroupDao.insertGroupDefault(groupVo);
	}

	@Override
	public int deleteGroup(int groupNo) {
		return addrGroupDao.deleteGroup(groupNo);
	}

	@Override
	public int countGroup(int empNo) {
		return addrGroupDao.countGroup(empNo);
	}

}
