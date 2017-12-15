package com.siszo.sisproj.confirm.docform.model;

import java.util.Map;

public interface DocumentFormService {
	public void insertDocForm(Map<String, String> map);
	public DocumentFormVO selectDocFormByFormNo(int formNo);
	public int updateDocForm(DocumentFormVO vo);
	public void deleteDocForm(Map<String, Integer> map);
}
