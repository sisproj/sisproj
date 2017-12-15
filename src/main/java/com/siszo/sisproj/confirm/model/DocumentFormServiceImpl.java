package com.siszo.sisproj.confirm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentFormServiceImpl implements DocumentFormService {
	
	@Autowired
	private DocumentFormDAO dfDao;

	@Override
	public int[] insertDocForm(DocumentFormVO vo) {
		int cnt = dfDao.insertDocForm(vo);
		int[] resArr = new int[]{vo.getFormNo(), cnt};
		System.out.println("cnt="+cnt+", vo="+vo);
		
		return resArr;
	}

	@Override
	public DocumentFormVO selectDocFormByFormNo(int formNo) {
		return dfDao.selectDocFormByFormNo(formNo);
	}
}
