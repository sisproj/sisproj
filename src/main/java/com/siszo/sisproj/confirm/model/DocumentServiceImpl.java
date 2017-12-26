package com.siszo.sisproj.confirm.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineDAO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileDAO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileVO;
import com.siszo.sisproj.confirm.isread.model.CfIsReadDAO;
import com.siszo.sisproj.confirm.isread.model.CfIsReadVO;
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
	@Autowired
	private CfIsReadDAO cirDao;

	@Override
	public int selectConfirmSEQ() {
		return dDao.selectConfirmSEQ();
	}
	
	@Override
	public List<DocumentVO> selectAllDoc(ConfirmSearchVO svo) {
		return dDao.selectAllDoc(svo);
	}
	
	@Override
	public List<DocumentVO> selectForAwait(ConfirmSearchVO svo) {
		return dDao.selectForAwait(svo);
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
			}
			//파일정보 db 저장 - confirm_file
			for(ConfirmFileVO  cfVo : uploadFileList) {
				cnt = cfDao.insertConfirmFile(cfVo);
				logger.info("첨부파일 저장 처리 결과, cnt={}", cnt);
				if(cnt>0) {
					result=1;
				} else {
					result=0;
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
				}
			}
			//내글 읽은여부 db저장 - cf_is_read
			cnt = cirDao.insertIsRead(docuVo);
			logger.info("cf_is_read 테이블(글 읽은 여부 테이블) Insert 결과, cnt={}", cnt);
			if(cnt>0) {
				result=1;
			} else {
				result=0;
			}
			//바로 본인결재라면 읽은여부 다음결재자도 주기 - cf_is_read
			if(docuVo.getEmpNo()!=docuVo.getCfConfirmer()) {
				DocumentVO nextCfVo= new DocumentVO();
				nextCfVo.setCfNo(docuVo.getCfNo());
				nextCfVo.setEmpNo(docuVo.getCfConfirmer());
				cnt = cirDao.insertIsRead(nextCfVo);
				if(cnt>0) {
					result=1;
				} else {
					result=0;
				}				
			}
		} catch (RuntimeException e) {
			result=0;
			e.printStackTrace();
		}
		//throw new RuntimeException("db insert오류");
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

	@Override
	@Transactional
	public int updateConfirmDoc(DocumentVO docuVo, List<ConfirmFileVO> uploadFileList, List<ConfirmLineVO> clVoList) {
		logger.info("글 수정 DB 등록 처리, 파라미터 docuVo={}, uploadFileList.size()={}",docuVo,uploadFileList.size());
		logger.info("파라미터 clVoList.size()={}", clVoList.size());
		int result=0;
		
		//결재문서 DB업데이트
		int cnt = dDao.updateConfirmDoc(docuVo);
		logger.info("문서 DB 업데이트 처리 결과, cnt={}", cnt);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		//기존 파일정보 삭제
		cnt = cfDao.deleteConfirmFile(docuVo.getCfNo());
		logger.info("기존 파일 삭제 처리 결과, cnt={}",cnt);
		if(cnt>0 ) {
			result=1;
		} else {
			result=0;
		}
		//새로운 파일정보 DB 저장
		for(ConfirmFileVO  cfVo : uploadFileList) {
			cnt = cfDao.insertConfirmFile(cfVo);
			logger.info("첨부파일 저장 처리 결과, cnt={}", cnt);
			if(cnt>0) {
				result=1;
			} else {
				result=0;
			}
		}
		//기존 결재라인 삭제
		cnt = dDao.deleteConfirmLine(docuVo.getCfNo());
		logger.info("기존 결재라인 삭제 처리 결과, cnt={}", cnt);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		//새로운 결재라인 db저장
		for(ConfirmLineVO clVo : clVoList) {
			cnt = clDao.insertConfirmLine(clVo);
			logger.info("결재라인 저장 처리 결과, cnt={}", cnt);
			if(cnt>0) {
				result=1;
			} else {
				result=0;
			}
		}
		//내글 읽은 여부 db업데이트(N으로 다시)
		CfIsReadVO cirVo = new CfIsReadVO();
		//update cf_is_read set is_read = #{isRead} where cf_no = #{cfNo} and emp_no=#{empNo}
		cirVo.setIsRead("N");
		cirVo.setCfNo(docuVo.getCfNo());
		cirVo.setEmpNo(docuVo.getEmpNo());
		
		cnt = cirDao.updateIsReadDoc(cirVo);
		logger.info("cf_is_read 테이블(글 읽은 여부 테이블) Update 결과, cnt={}", cnt);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		//바로 본인결재라면 읽은 여부 다음 결재자도 주기
		if(docuVo.getEmpNo()!=docuVo.getCfConfirmer()) {
			DocumentVO nextCfVo= new DocumentVO();
			nextCfVo.setCfNo(docuVo.getCfNo());
			nextCfVo.setEmpNo(docuVo.getCfConfirmer());
			cnt = cirDao.insertIsRead(nextCfVo);
			if(cnt>0) {
				result=1;
			} else {
				result=0;
			}				
		}
		
		return result;
	}

	@Override
	public int deleteDocuByCfNo(String cfNo) {
		return dDao.deleteDocuByCfNo(cfNo);
	}
}
