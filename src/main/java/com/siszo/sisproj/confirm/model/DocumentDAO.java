package com.siszo.sisproj.confirm.model;

import java.util.List;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

public interface DocumentDAO {
	public int selectConfirmSEQ();
	public int insertConfirmDoc(DocumentVO vo);
	public List<DocumentVO> completeDocSelByEmpNo(int empNo);
	public EmployeeVO selectByEmpNo(int empNo);
	public DocumentVO selectDocByCfNo(String cfNo);
	public int updateConfirmDoc(DocumentVO docuVo);
	public int deleteConfirmLine(String cfNo);
	public int deleteDocuByCfNo(String cfNo);
	public int updateDocStatus(DocumentVO dVo);
	public List<EmployeeVO> selectEmpListByDeptNo(int deptNo);
	public int insertSendDoc(ConfirmLineVO clVo);
	
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
