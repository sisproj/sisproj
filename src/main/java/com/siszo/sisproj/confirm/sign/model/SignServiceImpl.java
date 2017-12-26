package com.siszo.sisproj.confirm.sign.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignServiceImpl implements SignService{
	@Autowired
	private SignDAO sDao;

	@Override
	public SignVO selectSign(int empNo) {
		return sDao.selectSign(empNo);
	}

	@Override
	public int insertSignImg(SignVO sVo) {
		return sDao.insertSignImg(sVo);
	}

	@Override
	public int updateSignImg(SignVO sVo) {
		return sDao.updateSignImg(sVo);
	}
	
}
