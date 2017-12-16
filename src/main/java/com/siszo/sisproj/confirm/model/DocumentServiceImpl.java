package com.siszo.sisproj.confirm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentDAO dDao;

	@Override
	public int selectConfirmSEQ() {
		return dDao.selectConfirmSEQ();
	}
}
