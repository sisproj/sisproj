package com.siszo.sisproj.confirm.saveline.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaveLineServiceImpl implements SaveLineService{
	@Autowired
	private SaveLineDAO slDao;

	@Override
	public List<SaveLineVO> selectSaveLineByEmpNo(int empNo) {
		return slDao.selectSaveLineByEmpNo(empNo);
	}

	@Override
	public SaveLineVO selectSaveLineBySaveNo(int saveNo) {
		return slDao.selectSaveLineBySaveNo(saveNo);
	}
}
