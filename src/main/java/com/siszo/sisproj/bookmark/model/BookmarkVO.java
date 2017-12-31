package com.siszo.sisproj.bookmark.model;

public class BookmarkVO {
	private int empNo;
	private String empBookmark;
	
	
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getEmpBookmark() {
		return empBookmark;
	}
	public void setEmpBookmark(String empBookmark) {
		this.empBookmark = empBookmark;
	}
	@Override
	public String toString() {
		return "BookmarkVO [empNo=" + empNo + ", empBookmark=" + empBookmark + "]";
	}
}
