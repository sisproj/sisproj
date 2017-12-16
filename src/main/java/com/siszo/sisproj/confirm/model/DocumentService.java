package com.siszo.sisproj.confirm.model;

public interface DocumentService {
	//결재 문서 상태 표시
	public static final String TEMPORARY_SAVE = "임시저장"; //임시 저장
	public static final String CONFIRM_AWAIT = "결재대기"; //결재 대기
	public static final String CONFIRM_COMPLETE = "결재완료"; //결재 완료
	public static final String CONFIRM_RETURN = "결재반려"; //결재 반려
}
