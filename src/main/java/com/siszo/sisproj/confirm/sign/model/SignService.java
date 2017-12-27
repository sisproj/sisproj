package com.siszo.sisproj.confirm.sign.model;

public interface SignService {
	public SignVO selectSign(int empNo);
	public int insertSignImg(SignVO sVo);
	public int updateSignImg(SignVO sVo);
}
