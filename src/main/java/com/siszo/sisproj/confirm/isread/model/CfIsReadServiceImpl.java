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
	
}
