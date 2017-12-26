package com.siszo.sisproj.confirm.isread.model;


import com.siszo.sisproj.confirm.model.DocumentVO;

public interface CfIsReadDAO {
	public int insertIsRead(DocumentVO vo);
	public String selectIsReadByCfNo(CfIsReadVO vo);
	public int updateIsReadDoc(CfIsReadVO vo);
	public int mainBoxSet(CfIsReadVO vo);
	public int mainBoxSetAll(CfIsReadVO vo);
}
