package com.siszo.sisproj.confirm.file.model;

import java.util.List;

public interface ConfirmFileService {
	public List<ConfirmFileVO> selectCfFileByCfNo(String cfNo);
}
