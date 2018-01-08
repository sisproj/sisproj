package com.siszo.sisproj.webhard.model;

import java.sql.Timestamp;

public class WebhardVO {    
    private int fileNo;
    private String fileName;
    private String fileOriName;
    private long fileSize;
    private Timestamp fileRegdate;
    private String regdate;
    private int empNo;
    private String empName;
	private long fileTerm;
    
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Timestamp getFileRegdate() {
		return fileRegdate;
	}
	public void setFileRegdate(Timestamp fileRegdate) {
		this.fileRegdate = fileRegdate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public long getFileTerm() {
		return fileTerm;
	}
	public void setFileTerm(long fileTerm) {
		this.fileTerm = fileTerm;
	}
	@Override
	public String toString() {
		return "WebhardVO [fileNo=" + fileNo + ", fileName=" + fileName + ", fileOriName=" + fileOriName + ", fileSize="
				+ fileSize + ", fileRegdate=" + fileRegdate + ", regdate=" + regdate + ", empNo=" + empNo + ", empName="
				+ empName + ", fileTerm=" + fileTerm + "]";
	}
	
	
}
