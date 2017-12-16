package com.siszo.sisproj.confirm.docform.model;

import java.util.List;
import java.util.Map;

import com.siszo.sisproj.confirm.model.DocumentVO;

public interface DocumentFormService {
	public void insertDocForm(Map<String, String> map);
	public DocumentFormVO selectDocFormByFormNo(int formNo);
	public int updateDocForm(DocumentFormVO vo);
	public void deleteDocForm(Map<String, Integer> map);
	public List<DocumentFormVO> selectDocFormAll();
	public List<DocumentFormVO> selectDocTypeAll();
	public DocumentFormVO selectFormByFormNo(int formNo);
}
