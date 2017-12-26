package com.siszo.sisproj.confirm.sign.model;

public class SignVO {	
	private int empNo; //사원번호
	private int signName; //서명 이미지 파일명
	private int signOriName; //서명 이미지 원래 파일명
	private int signSize; //서명 이미지 파일 크기
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getSignName() {
		return signName;
	}
	public void setSignName(int signName) {
		this.signName = signName;
	}
	public int getSignOriName() {
		return signOriName;
	}
	public void setSignOriName(int signOriName) {
		this.signOriName = signOriName;
	}
	public int getSignSize() {
		return signSize;
	}
	public void setSignSize(int signSize) {
		this.signSize = signSize;
	}
	@Override
	public String toString() {
		return "SignVO [empNo=" + empNo + ", signName=" + signName + ", signOriName=" + signOriName + ", signSize="
				+ signSize + "]";
	}
	
	
}
