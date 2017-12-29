package com.siszo.sisproj.confirm.model;

import java.util.List;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileVO;
import com.siszo.sisproj.confirm.isread.model.CfIsReadVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

public interface DocumentService {
	//결재 문서 상태 플래그
	public static final String TEMPORARY_SAVE = "임시저장"; //임시 저장
	public static final String CONFIRM_AWAIT = "결재대기"; //결재 대기
	public static final String CONFIRM_COMPLETE = "결재완료"; //결재 완료
	public static final String CONFIRM_RETURN = "결재반려"; //결재 반려
	
	//파일 유무 여부 플래그
	public static final String HAVE_FILES = "Y"; //파일 있음
	public static final String NOT_HAVE_FILES = "N"; //파일 없음

	
	public int selectConfirmSEQ();
	public int insertConfirmDoc(DocumentVO vo, List<ConfirmFileVO> uploadFileList, List<ConfirmLineVO> clVoList); 
	public List<DocumentVO> completeDocSelByEmpNo(int empNo);
	public EmployeeVO selectByEmpNo(int empNo);
	public DocumentVO selectDocByCfNo(String cfNo);
	public int updateConfirmDoc(DocumentVO vo, List<ConfirmFileVO> uploadFileList, List<ConfirmLineVO> clVoList);
	public int deleteDocuByCfNo(String cfNo);
	public int noConfirm(DocumentVO dVo, CfIsReadVO cirVo, ConfirmLineVO clVo);
	public int yesConfirm(DocumentVO dVo, CfIsReadVO cirVo, ConfirmLineVO clVo, int nextConfirmer);
	public List<EmployeeVO> selectEmpListByDeptNo(int deptNo);
	public int insertSendDoc(List<ConfirmLineVO> clVoList);
	
	//1타입 - 결재완료
	public List<DocumentVO> selectCompleteOneType(ConfirmSearchVO csVo);
	public int selectCompleteAllCntOneType(DocumentVO dVo);
	public int selectCompleteCntOneType(DocumentVO dVo);

	//2타입 - 결재반려
	public List<DocumentVO> selectReturnSecondType(ConfirmSearchVO csVo);
	public int selectReturnAllCntSecondType(DocumentVO dVo);
	public int selectReturnCntSecondType(DocumentVO dVo);

	//3타입 - 임시저장, 결재대기
	public List<DocumentVO> selectSaveWaitThirdType(ConfirmSearchVO csVo);
	public int selectSaveWaitAllCntThirdType(DocumentVO dVo);
	public int selectSaveWaitCntThirdType(DocumentVO dVo);

	//4타입 - 참조수신
	public List<DocumentVO> selectReferFourType(ConfirmSearchVO csVo);
	public int selectReferCntAllFourType(DocumentVO dVo);
	public int selectReferCntFourType(DocumentVO dVo);
}
