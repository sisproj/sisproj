package com.siszo.sisproj.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int notiNo;	//공지번호
	private String notiTitle;	//공지이름
	private int empNo;	//사원번호
	private String notiContent;	//공지내용
	private Timestamp notiRegdate;	//입력날짜
	private String notiFilename;	//파일이름
	private long notiFilesize;	//파일사이즈
	private String notiOfilename;	//원본파일이름
	private int notiDowncnt;	//다운수
	private int notiReadcnt;	//조회수
	
	private String empName;
	
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	public int getNotiNo() {
		return notiNo;
	}
	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}
	public Timestamp getNotiRegdate() {
		return notiRegdate;
	}
	public void setNotiRegdate(Timestamp notiRegdate) {
		this.notiRegdate = notiRegdate;
	}
	public String getNotiFilename() {
		return notiFilename;
	}
	public void setNotiFilename(String notiFilename) {
		this.notiFilename = notiFilename;
	}
	public long getNotiFilesize() {
		return notiFilesize;
	}
	public void setNotiFilesize(long notiFilesize) {
		this.notiFilesize = notiFilesize;
	}
	public String getNotiOfilename() {
		return notiOfilename;
	}
	public void setNotiOfilename(String notiOfilename) {
		this.notiOfilename = notiOfilename;
	}
	public int getNotiDowncnt() {
		return notiDowncnt;
	}
	public void setNotiDowncnt(int notiDowncnt) {
		this.notiDowncnt = notiDowncnt;
	}
	public int getNotiReadcnt() {
		return notiReadcnt;
	}
	public void setNotiReadcnt(int notiReadcnt) {
		this.notiReadcnt = notiReadcnt;
	}
	
	
	@Override
	public String toString() {
		return "NoticeVO [notiNo=" + notiNo + ", notiTitle=" + notiTitle + ", empNo=" + empNo + ", notiContent="
				+ notiContent + ", notiRegdate=" + notiRegdate + ", notiFilename=" + notiFilename + ", notiFilesize="
				+ notiFilesize + ", notiOfilename=" + notiOfilename + ", notiDowncnt=" + notiDowncnt + ", notiReadcnt="
				+ notiReadcnt + "]";
	}
	
		
}
