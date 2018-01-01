package com.siszo.sisproj.webhard.model;

public class WebhardVO {    
    private int fileNo;
    private String fileName;
    private String fileOriName;
    private long fileSize;
    private int empNo;
    private String empName;
    
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
	@Override
	public String toString() {
		return "WebhardVO [fileNo=" + fileNo + ", fileName=" + fileName + ", fileOriName=" + fileOriName + ", fileSize="
				+ fileSize + ", empNo=" + empNo + ", empName=" + empName + "]";
	}
	
    
    
}
