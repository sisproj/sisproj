package com.siszo.sisproj.confirm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;


@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentDAO dDao;

	@Override
	public int selectConfirmSEQ() {
		return dDao.selectConfirmSEQ();
	}

	@Override
	public int insertConfirmDoc(DocumentVO vo) {
		return dDao.insertConfirmDoc(vo);
	}

	@Override
	public List<DocumentVO> selectAllDoc(ConfirmSearchVO svo) {
		return dDao.selectAllDoc(svo);
	}

	@Override
	public int totalRecordCountDoc(ConfirmSearchVO svo) {
		return dDao.totalRecordCountDoc(svo);
	}

	@Override
	public List<DocumentVO> completeDocSelByEmpNo(int empNo) {
		return dDao.completeDocSelByEmpNo(empNo);
	}
}
