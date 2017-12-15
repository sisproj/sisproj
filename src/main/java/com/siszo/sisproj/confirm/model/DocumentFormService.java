package com.siszo.sisproj.confirm.model;

public interface DocumentFormService {
	public int[] insertDocForm(DocumentFormVO vo);
	public DocumentFormVO selectDocFormByFormNo(int formNo);
}
