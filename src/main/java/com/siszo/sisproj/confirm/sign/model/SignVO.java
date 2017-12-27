package com.siszo.sisproj.confirm.sign.model;

public class SignVO {	
	private int empNo; //사원번호
	private String signName; //서명 이미지 파일명
	private String signOriName; //서명 이미지 원래 파일명
	private long signSize; //서명 이미지 파일 크기
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getSignName() {
		return signName;
	}
	public void setSignName(String signName) {
		this.signName = signName;
	}
	public String getSignOriName() {
		return signOriName;
	}
	public void setSignOriName(String signOriName) {
		this.signOriName = signOriName;
	}
	public long getSignSize() {
		return signSize;
	}
	public void setSignSize(long signSize) {
		this.signSize = signSize;
	}
	@Override
	public String toString() {
		return "SignVO [empNo=" + empNo + ", signName=" + signName + ", signOriName=" + signOriName + ", signSize="
				+ signSize + "]";
	}
	
	
	
}
