package com.siszo.sisproj.confirm.docform.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentFormServiceImpl implements DocumentFormService {
	
	@Autowired
	private DocumentFormDAO dfDao;

	@Override
	public void insertDocForm(Map<String, String> map) {
		dfDao.insertDocForm(map);
	}

	@Override
	public DocumentFormVO selectDocFormByFormNo(int formNo) {
		return dfDao.selectDocFormByFormNo(formNo);
	}

	@Override
	public int updateDocForm(DocumentFormVO vo) {
		return dfDao.updateDocForm(vo);
	}

	@Override
	public void deleteDocForm(Map<String, Integer> map) {
		dfDao.deleteDocForm(map);
	}


}
