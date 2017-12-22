package com.siszo.sisproj.confirm.model;

import java.util.List;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;

public interface DocumentDAO {
	public int selectConfirmSEQ();
	public int insertConfirmDoc(DocumentVO vo);
	public List<DocumentVO> selectAllDoc(ConfirmSearchVO svo);
	public int totalRecordCountDoc(ConfirmSearchVO svo);
	public List<DocumentVO> completeDocSelByEmpNo(int empNo);
	public String selectEmpNameByEmpNo(int empNo);
}
