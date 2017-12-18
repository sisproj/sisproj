package com.siszo.sisproj.confirm.file.model;

public class ConfirmFileVO {
	private int fileNo; //파일번호
	private String fileName; //파일이름
	private String fileOriName; //원래파일이름
	private String fileSize; //파일용량
	private String cfNo; //해당파일 문서번호
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
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getCfNo() {
		return cfNo;
	}
	public void setCfNo(String cfNo) {
		this.cfNo = cfNo;
	}
	@Override
	public String toString() {
		return "ConfirmFileVO [fileNo=" + fileNo + ", fileName=" + fileName + ", fileOriName=" + fileOriName
				+ ", fileSize=" + fileSize + ", cfNo=" + cfNo + "]";
	}
	
	
}
