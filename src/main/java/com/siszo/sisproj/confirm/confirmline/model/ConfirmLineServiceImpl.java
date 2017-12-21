package com.siszo.sisproj.confirm.confirmline.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ConfirmLineServiceImpl implements ConfirmLineService {
	@Autowired
	private ConfirmLineDAO clDao;

	@Override
	public ConfirmLineVO selectConfirmerByEmpNo(int empNo) {
		return clDao.selectConfirmerByEmpNo(empNo);
	}

	@Override
	@Transactional
	public int insertConfirmers(List<ConfirmLineVO> list) {
		//결재자들 insert
		int cnt=0;
		try {
			for(ConfirmLineVO vo : list) {
				cnt = clDao.insertConfirmLine(vo);
			}
		} catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int myConfirmOk(ConfirmLineVO vo) {
		return clDao.myConfirmOk(vo);
	}
}
