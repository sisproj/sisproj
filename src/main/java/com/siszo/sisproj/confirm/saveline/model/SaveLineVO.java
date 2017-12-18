package com.siszo.sisproj.confirm.saveline.model;

public class SaveLineVO {
	private int saveNo; //결재라인등록번호
	private int empNo; //결재라인 등록자 사원번호
	private String saveName; //결재라인 이름
	private String saveConfirmer; //결재자들
	
	public int getSaveNo() {
		return saveNo;
	}
	public void setSaveNo(int saveNo) {
		this.saveNo = saveNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getSaveConfirmer() {
		return saveConfirmer;
	}
	public void setSaveConfirmer(String saveConfirmer) {
		this.saveConfirmer = saveConfirmer;
	}
	@Override
	public String toString() {
		return "SaveLineVO [saveNo=" + saveNo + ", empNo=" + empNo + ", saveName=" + saveName + ", saveConfirmer="
				+ saveConfirmer + "]";
	}
}
