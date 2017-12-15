package com.siszo.sisproj.confirm.model;

//문서종류, 문서양식
public class DocumentFormVO {
	private int formNo; //양식 번호
	private String formName; //양식 이름
	private int typeNo; //문서종류번호
	private String typeType; //문서 종류
	private String formSecu; //보안 수준
	private String formLife;//보존 년한
	private String formEx; //설명
	
	
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public String getTypeType() {
		return typeType;
	}
	public void setTypeType(String typeType) {
		this.typeType = typeType;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getFormSecu() {
		return formSecu;
	}
	public void setFormSecu(String formSecu) {
		this.formSecu = formSecu;
	}
	public String getFormLife() {
		return formLife;
	}
	public void setFormLife(String formLife) {
		this.formLife = formLife;
	}
	public String getFormEx() {
		return formEx;
	}
	public void setFormEx(String formEx) {
		this.formEx = formEx;
	}
	@Override
	public String toString() {
		return "DocumentFormVO [formNo=" + formNo + ", formName=" + formName + ", typeNo=" + typeNo + ", typeType="
				+ typeType + ", formSecu=" + formSecu + ", formLife=" + formLife + ", formEx=" + formEx + "]";
	}
	
	
	
}
