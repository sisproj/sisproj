package com.siszo.sisproj.resource.model;

import java.sql.Timestamp;

public class ResourceVO {
	private int resNo;
	private String resCateg;
	private String resName;
	private String resDesc;
	private Timestamp resRegdate;
	private int empNo;
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getResCateg() {
		return resCateg;
	}
	public void setResCateg(String resCateg) {
		this.resCateg = resCateg;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResDesc() {
		return resDesc;
	}
	public void setResDesc(String resDesc) {
		this.resDesc = resDesc;
	}
	public Timestamp getResRegdate() {
		return resRegdate;
	}
	public void setResRegdate(Timestamp resRegdate) {
		this.resRegdate = resRegdate;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "ResourceVO [resNo=" + resNo + ", resCateg=" + resCateg + ", resName=" + resName + ", resDesc=" + resDesc
				+ ", resRegdate=" + resRegdate + ", empNo=" + empNo + "]";
	}

	
}
	
