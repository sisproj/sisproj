package com.siszo.sisproj.news.model;

import java.sql.Timestamp;

public class NewsComVO {
	private int comNo;
	private int newsNo;
	private int empNo;
	private String comContent;
	private Timestamp comRegdate;
	private int comLike;
	
	
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getNewsNo() {
		return newsNo;
	}
	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public Timestamp getComRegdate() {
		return comRegdate;
	}
	public void setComRegdate(Timestamp comRegdate) {
		this.comRegdate = comRegdate;
	}
	public int getComLike() {
		return comLike;
	}
	public void setComLike(int comLike) {
		this.comLike = comLike;
	}
	@Override
	public String toString() {
		return "NewsComVO [comNo=" + comNo + ", newsNo=" + newsNo + ", empNo=" + empNo + ", comContent=" + comContent
				+ ", comRegdate=" + comRegdate + ", comLike=" + comLike + "]";
	}
	
	

}
