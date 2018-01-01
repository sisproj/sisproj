package com.siszo.sisproj.news.model;

public class NewsLikeVO {
	  private int likeNo; 
	  private int empNo;
	  private int newsNo;
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getNewsNo() {
		return newsNo;
	}
	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}
	@Override
	public String toString() {
		return "newsLikeVO [likeNo=" + likeNo + ", empNo=" + empNo + ", newsNo=" + newsNo + "]";
	}
	
}
