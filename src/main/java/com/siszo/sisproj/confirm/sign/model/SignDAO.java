package com.siszo.sisproj.confirm.sign.model;

public interface SignDAO {
	public SignVO selectSign(int empNo);
	public int insertSignImg(SignVO sVo);
	public int updateSignImg(SignVO sVo);
}
