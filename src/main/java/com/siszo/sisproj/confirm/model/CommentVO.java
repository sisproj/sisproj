package com.siszo.sisproj.confirm.model;

import java.sql.Timestamp;

public class CommentVO {
	private int commNo; //의견번호
	private int memNo; //사원번호(작성자)
	private Timestamp commRegdate; //작성일
	private String commContent; //내용
	private String cfNo; //해당의견 문서번호
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public Timestamp getCommRegdate() {
		return commRegdate;
	}
	public void setCommRegdate(Timestamp commRegdate) {
		this.commRegdate = commRegdate;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public String getCfNo() {
		return cfNo;
	}
	public void setCfNo(String cfNo) {
		this.cfNo = cfNo;
	}
	@Override
	public String toString() {
		return "CommentVO [commNo=" + commNo + ", memNo=" + memNo + ", commRegdate=" + commRegdate + ", commContent="
				+ commContent + ", cfNo=" + cfNo + "]";
	}
	
	
}
