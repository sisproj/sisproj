package com.siszo.sisproj.news.model;

import java.sql.Timestamp;

public class NewsVO {
	private int newsNo;
	private String newsTitle;
	private int empNo;
	private String newsContent;
	private Timestamp newsRegdate;
	private String newsImage;
	private int newsReadCnt;
	private int newsLike;
	private String newsMain;
	public int getNewsNo() {
		return newsNo;
	}
	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public Timestamp getNewsRegdate() {
		return newsRegdate;
	}
	public void setNewsRegdate(Timestamp newsRegdate) {
		this.newsRegdate = newsRegdate;
	}
	public String getNewsImage() {
		return newsImage;
	}
	public void setNewsImage(String newsImage) {
		this.newsImage = newsImage;
	}
	public int getNewsReadCnt() {
		return newsReadCnt;
	}
	public void setNewsReadCnt(int newsReadCnt) {
		this.newsReadCnt = newsReadCnt;
	}
	public int getNewsLike() {
		return newsLike;
	}
	public void setNewsLike(int newsLike) {
		this.newsLike = newsLike;
	}
	public String getNewsMain() {
		return newsMain;
	}
	public void setNewsMain(String newsMain) {
		this.newsMain = newsMain;
	}
	@Override
	public String toString() {
		return "NewsVO [newsNo=" + newsNo + ", newsTitle=" + newsTitle + ", empNo=" + empNo + ", newsContent="
				+ newsContent + ", newsRegdate=" + newsRegdate + ", newsImage=" + newsImage + ", newsReadCnt="
				+ newsReadCnt + ", newsLike=" + newsLike + ", newsMain=" + newsMain + "]";
	}
	
	
	

}
