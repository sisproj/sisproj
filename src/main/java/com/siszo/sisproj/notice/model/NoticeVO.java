package com.siszo.sisproj.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int notiNo;
	private String notiTitle;
	private int empNo;
	private String notiContent;
	private Timestamp notiRegdate;
	private String notiFilename;
	private String notiFilesize;
	private String notiOfilename;
	private int notiDowncnt;
	private int notiReadcnt;
	
	
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
	public String getNotiFilesize() {
		return notiFilesize;
	}
	public void setNotiFilesize(String notiFilesize) {
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
