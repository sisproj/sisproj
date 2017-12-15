package com.siszo.sisproj.confirm.model;

public interface DocumentFormDAO {
	public int insertDocForm(DocumentFormVO vo);
	public DocumentFormVO selectDocFormByFormNo(int formNo);
}
