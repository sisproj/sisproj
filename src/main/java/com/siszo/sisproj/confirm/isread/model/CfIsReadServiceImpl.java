package com.siszo.sisproj.confirm.isread.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CfIsReadServiceImpl implements CfIsReadService {
	@Autowired
	private CfIsReadDAO cirDao;

	@Override
	public String selectIsReadByCfNo(CfIsReadVO vo) {
		return cirDao.selectIsReadByCfNo(vo);
	}

	@Override
	public int updateIsReadDoc(CfIsReadVO vo) {
		return cirDao.updateIsReadDoc(vo);
	}

	@Override
	public int mainBoxSet(CfIsReadVO vo) {
		return cirDao.mainBoxSet(vo);
	}

	@Override
	public int mainBoxSetAll(CfIsReadVO vo) {
		return cirDao.mainBoxSetAll(vo);
	}	
	
}
