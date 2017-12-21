package com.siszo.sisproj.confirm.file.model;

import java.util.List;

public class ConfirmFileListVO {
	private List<ConfirmFileVO> files;

	public List<ConfirmFileVO> getFiles() {
		return files;
	}

	public void setFiles(List<ConfirmFileVO> files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "ConfirmFileListVO [files=" + files + "]";
	}
	
}
