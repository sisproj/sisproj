package com.siszo.sisproj.confirm.model;

import java.util.List;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

public interface DocumentDAO {
	public int selectConfirmSEQ();
	public int insertConfirmDoc(DocumentVO vo);
	public List<DocumentVO> selectAllDoc(ConfirmSearchVO svo);
	public List<DocumentVO> selectForAwait(ConfirmSearchVO svo);
	public int totalRecordCountDoc(ConfirmSearchVO svo);
	public List<DocumentVO> completeDocSelByEmpNo(int empNo);
	public EmployeeVO selectByEmpNo(int empNo);
	public DocumentVO selectDocByCfNo(String cfNo);
}
