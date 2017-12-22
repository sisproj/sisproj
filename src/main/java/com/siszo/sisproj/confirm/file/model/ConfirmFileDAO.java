package com.siszo.sisproj.confirm.file.model;

import java.util.List;

public interface ConfirmFileDAO {
	public int insertConfirmFile(ConfirmFileVO vo);
	public List<ConfirmFileVO> selectCfFileByCfNo(String cfNo);
}
