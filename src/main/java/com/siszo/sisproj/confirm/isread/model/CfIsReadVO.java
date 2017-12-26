package com.siszo.sisproj.confirm.isread.model;

public class CfIsReadVO {
	private int seqNo; //시퀀스번호
	private int empNo; //글 읽을 수 있는 권한자
	private String cfNo; // 해당 글 번호
	private String isRead; //글 읽은 여부
	private String cfStaus; // join cofirm.cf_status 
	public int getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getCfNo() {
		return cfNo;
	}
	public void setCfNo(String cfNo) {
		this.cfNo = cfNo;
	}
	public String getIsRead() {
		return isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	public String getCfStaus() {
		return cfStaus;
	}
	public void setCfStaus(String cfStaus) {
		this.cfStaus = cfStaus;
	}
	@Override
	public String toString() {
		return "CfIsReadVO [seqNo=" + seqNo + ", empNo=" + empNo + ", cfNo=" + cfNo + ", isRead=" + isRead
				+ ", cfStaus=" + cfStaus + "]";
	}
	
}
