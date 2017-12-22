package com.siszo.sisproj.confirm.confirmline.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConfirmLineServiceImpl implements ConfirmLineService {
	@Autowired
	private ConfirmLineDAO clDao;

	@Override
	public ConfirmLineVO selectConfirmerByEmpNo(int empNo) {
		return clDao.selectConfirmerByEmpNo(empNo);
	}
	
	@Override
	public int myConfirmOk(ConfirmLineVO vo) {
		return clDao.myConfirmOk(vo);
	}
}
