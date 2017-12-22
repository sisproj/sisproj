package com.siszo.sisproj.confirm.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.confirm.comment.model.CommentVO;
import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineDAO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileDAO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileVO;
import com.siszo.sisproj.employee.model.EmployeeVO;


@Service
public class DocumentServiceImpl implements DocumentService {
	private static final Logger logger = LoggerFactory.getLogger(DocumentServiceImpl.class);
	
	@Autowired
	private DocumentDAO dDao;
	@Autowired
	private ConfirmFileDAO cfDao;
	@Autowired
	private ConfirmLineDAO clDao;

	@Override
	public int selectConfirmSEQ() {
		return dDao.selectConfirmSEQ();
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

	@Override
	@Transactional
	public int insertConfirmDoc(DocumentVO docuVo, List<ConfirmFileVO> uploadFileList, List<ConfirmLineVO> clVoList) {
		logger.info("글쓰저 DB 등록 처리, 파라미터 docuVo={}, uploadFileList.size()={}",docuVo,uploadFileList.size());
		logger.info("파라미터 clVoList.size()={}", clVoList.size());
		
		int result = 0;
		
		try {
			//결재문서 db저장 - confirm테이블
			int cnt = dDao.insertConfirmDoc(docuVo);
			if(cnt>0) {
				result=1;
			} else {
				result=0;
				return result;
			}
			//파일정보 db 저장 - confirm_file
			for(ConfirmFileVO  cfVo : uploadFileList) {
				cnt = cfDao.insertConfirmFile(cfVo);
				logger.info("첨부파일 저장 처리 결과, cnt={}", cnt);
				if(cnt>0) {
					result=1;
				} else {
					result=0;
					return result;					
				}
			}
			//결재라인 db저장 - confirm_line
			for(ConfirmLineVO clVo : clVoList) {
				cnt = clDao.insertConfirmLine(clVo);
				logger.info("결재라인 저장 처리 결과, cnt={}", cnt);
				if(cnt>0) {
					result=1;
				} else {
					result=0;
					return result;
				}
			}
			
		} catch (RuntimeException e) {
			result=0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public EmployeeVO selectByEmpNo(int empNo) {
		return dDao.selectByEmpNo(empNo);
	}

	@Override
	public DocumentVO selectDocByCfNo(String cfNo) {
		return dDao.selectDocByCfNo(cfNo);
	}
}
