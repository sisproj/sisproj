package com.siszo.sisproj.confirm.docform.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.confirm.common.ConfirmUtility;

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
		DocumentFormVO vo = dfDao.selectDocFormByFormNo(formNo);
		vo.setTypeType(ConfirmUtility.changeTag(vo.getTypeType()));
		vo.setFormName(ConfirmUtility.changeTag(vo.getFormName()));
		vo.setFormEx(ConfirmUtility.changeTag(vo.getFormEx()));
		return vo;
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
	public List<DocumentFormVO> selectDocFormAll() {
		List<DocumentFormVO> list = dfDao.selectDocFormAll();
		for(int i=0; i<list.size(); i++) {
			DocumentFormVO vo = list.get(i);
			
			vo.setTypeType(ConfirmUtility.changeTag(vo.getTypeType()));
			vo.setFormName(ConfirmUtility.changeTag(vo.getFormName()));
			vo.setFormEx(ConfirmUtility.changeTag(vo.getFormEx()));
		}
		return list;
	}
	
	@Override
	public List<DocumentFormVO> selectDocTypeAll() {
		List<DocumentFormVO> list = dfDao.selectDocTypeAll();
		for(int i=0; i<list.size(); i++) {
			DocumentFormVO vo = list.get(i);
			
			vo.setTypeType(ConfirmUtility.changeTag(vo.getTypeType()));
		}
		return list;
	}

	@Override
	public DocumentFormVO selectFormByFormNo(int formNo) {
		return dfDao.selectFormByFormNo(formNo);
	}


}
