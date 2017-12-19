package com.siszo.sisproj.confirm.saveline.model;

import java.util.List;

public interface SaveLineDAO {
	public List<SaveLineVO> selectSaveLineByEmpNo(int empNo);
	public SaveLineVO selectSaveLineBySaveNo(int saveNo);
}
