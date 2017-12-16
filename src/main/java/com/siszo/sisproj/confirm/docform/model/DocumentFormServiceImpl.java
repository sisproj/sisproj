package com.siszo.sisproj.confirm.docform.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.confirm.model.DocumentVO;

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

	@Override
	public List<DocumentVO> selectDocFormAll() {
		return dfDao.selectDocFormAll();
	}
	
	@Override
	public List<DocumentVO> selectDocTypeAll() {
		return dfDao.selectDocTypeAll();
	}

	@Override
	public DocumentVO selectFormByFormNo(int formNo) {
		return dfDao.selectFormByFormNo(formNo);
	}


}
