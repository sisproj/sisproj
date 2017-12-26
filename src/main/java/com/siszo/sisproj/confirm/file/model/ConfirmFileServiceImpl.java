package com.siszo.sisproj.confirm.file.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConfirmFileServiceImpl implements ConfirmFileService {
	
	@Autowired
	private ConfirmFileDAO cfDao;

	@Override
	public List<ConfirmFileVO> selectCfFileByCfNo(String cfNo) {
		return cfDao.selectCfFileByCfNo(cfNo);
	}
	
	
}
