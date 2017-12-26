package com.siszo.sisproj.confirm.isread.model;

public interface CfIsReadService {
	public String selectIsReadByCfNo(CfIsReadVO vo);
	public int updateIsReadDoc(CfIsReadVO vo);
	public int mainBoxSet(CfIsReadVO vo);
	public int mainBoxSetAll(CfIsReadVO vo);
}
