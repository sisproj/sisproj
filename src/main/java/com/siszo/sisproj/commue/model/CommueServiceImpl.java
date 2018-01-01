package com.siszo.sisproj.commue.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommueServiceImpl implements CommueService{

	@Autowired
	private CommueDAO commueDao;
	
	@Override
	public List<CommueVO> selectAllCom() {
		return commueDao.selectAllCom(); 
	}

	@Override
	public int insertIn(int empNo) {
		return commueDao.insertIn(empNo);
	}
}
