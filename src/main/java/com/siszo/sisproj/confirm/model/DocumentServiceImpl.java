package com.siszo.sisproj.confirm.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineDAO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineService;
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
				CfIsReadVO cirrVo = new CfIsReadVO();
				cirrVo.setCfNo(docuVo.getCfNo());
				cirrVo.setEmpNo(docuVo.getCfConfirmer());
				cirrVo.setIsRead("N");
				cnt = cirDao.selectIsReadCNTByCfNo(cirrVo);
				logger.info("해당글의 isread 조회 결과, cnt={}",cnt);
				if(cnt>0) {
					//있으면 업데이트
					cnt = cirDao.updateIsReadDoc(cirrVo);
				} else {
					//없으면 insert
					cnt = cirDao.insertIsReadCIR(cirrVo);				
				}				
				logger.info("다음 결재자 처리 결과 cnt={}", cnt);
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
		//업로드된 파일이 있다면
		if(uploadFileList.size()>0) {
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
		//cf_is_read 에서 해당 글의 레코드가 1개가 아니면 
		
		//바로 본인결재라면 읽은 여부 다음 결재자도 주기
		if(docuVo.getEmpNo()!=docuVo.getCfConfirmer()) {			
			CfIsReadVO cirrVo = new CfIsReadVO();
			cirrVo.setCfNo(docuVo.getCfNo());
			cirrVo.setEmpNo(docuVo.getCfConfirmer());
			cirrVo.setIsRead("N");
			cnt = cirDao.selectIsReadCNTByCfNo(cirrVo);
			logger.info("해당글의 isread 조회 결과, cnt={}",cnt);
			if(cnt>0) {
				//있으면 업데이트
				cnt = cirDao.updateIsReadDoc(cirrVo);
			} else {
				//없으면 insert
				cnt = cirDao.insertIsReadCIR(cirrVo);				
			}				
			logger.info("다음 결재자 처리 결과 cnt={}", cnt);
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

	@Override
	@Transactional
	public int noConfirm(DocumentVO dVo, CfIsReadVO cirVo, ConfirmLineVO clVo) {
		int result = 0;		
		//1.해당 결재자 결재라인에서 반려로 처리 myConfirmOk(ConfirmLine)
		int cnt = clDao.myConfirmOk(clVo);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		//2. 해당문서 결재반려 update 처리 updateDocStatus(Document)
		cnt = dDao.updateDocStatus(dVo);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		
		//3. 해당 글 기안자 isread 안읽음(N)으로 처리 updateIsReadDoc(CfIsRead)
		cnt = cirDao.updateIsReadDoc(cirVo);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		
		return result;
	}

	@Override
	@Transactional
	public int yesConfirm(DocumentVO dVo, CfIsReadVO cirVo, ConfirmLineVO clVo, int nextConfirmer) {
		System.out.println("승인 문서 정보 : "+dVo);
		System.out.println("읽은 정보 : "+cirVo);
		System.out.println("결재라인 정보 : "+clVo);
		System.out.println("다음 결재자  : "+nextConfirmer);
		int result = 0;
		//1.해당 결재자 결재라인에서 승인로 처리 myConfirmOk(ConfirmLine)
		int cnt = clDao.myConfirmOk(clVo);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		//2. 해당문서 결재대기 혹은 완료로 update 처리 updateDocStatus(Document)
		cnt = dDao.updateDocStatus(dVo);
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		
		if(nextConfirmer==0) {
			//-> 다음 결재자가 없으면 업데이트
			cnt = cirDao.updateIsReadDoc(cirVo);
		} else {
			//isread에 해당 글과 결재자로 cnt조회... 
			cnt = cirDao.selectIsReadCNTByCfNo(cirVo);
			logger.info("해당글의 isread 조회 결과, cnt={}",cnt);
			if(cnt>0) {
				//있으면 업데이트
				cnt = cirDao.updateIsReadDoc(cirVo);
			} else {
				//없으면 insert
				cnt = cirDao.insertIsReadCIR(cirVo);				
			}
		}
		if(cnt>0) {
			result=1;
		} else {
			result=0;
		}
		
		return result;
	}

	@Override
	public List<EmployeeVO> selectEmpListByDeptNo(int deptNo) {
		return dDao.selectEmpListByDeptNo(deptNo);
	}

	@Override
	@Transactional
	public int insertSendDoc(List<ConfirmLineVO> clVoList) {
		int cnt = 0;
		//수신함 업로드 및 읽은 여부 테이블에 넣기
		for(ConfirmLineVO clVo : clVoList) {
			//수신함에 없을떄만 인서트
			int res = clDao.selectReferByEmpCf(clVo);
			if(res==0) {
				cnt = dDao.insertSendDoc(clVo);				
			} 
			
			//읽은 여부테이블에 해당 사람이 있으면 업데이트 없으면 인서트
			CfIsReadVO cirVo = new CfIsReadVO();
			cirVo.setCfNo(clVo.getCfNo());
			cirVo.setEmpNo(clVo.getEmpNo());
			cirVo.setIsRead("N");

			res = cirDao.selectIsReadCNTByCfNo(cirVo);
			if(res>0) {
				cnt = cirDao.updateIsReadDoc(cirVo);
			} else {
				cnt = cirDao.insertIsReadCIR(cirVo);
			}
		}
		
		return cnt;
	}

	@Override
	public List<DocumentVO> selectCompleteOneType(ConfirmSearchVO csVo) {
		return dDao.selectCompleteOneType(csVo);
	}

	@Override
	public int selectCompleteAllCntOneType(DocumentVO dVo) {
		return dDao.selectCompleteAllCntOneType(dVo);
	}

	@Override
	public int selectCompleteCntOneType(DocumentVO dVo) {
		return dDao.selectCompleteCntOneType(dVo);
	}

	@Override
	public List<DocumentVO> selectReturnSecondType(ConfirmSearchVO csVo) {
		return dDao.selectReturnSecondType(csVo);
	}

	@Override
	public int selectReturnAllCntSecondType(DocumentVO dVo) {
		return dDao.selectReturnAllCntSecondType(dVo);
	}

	@Override
	public int selectReturnCntSecondType(DocumentVO dVo) {
		return dDao.selectReturnCntSecondType(dVo);
	}

	@Override
	public List<DocumentVO> selectSaveWaitThirdType(ConfirmSearchVO csVo) {
		return dDao.selectSaveWaitThirdType(csVo);
	}

	@Override
	public int selectSaveWaitAllCntThirdType(DocumentVO dVo) {
		return dDao.selectSaveWaitAllCntThirdType(dVo);
	}

	@Override
	public int selectSaveWaitCntThirdType(DocumentVO dVo) {
		return dDao.selectSaveWaitCntThirdType(dVo);
	}

	@Override
	public List<DocumentVO> selectReferFourType(ConfirmSearchVO csVo) {
		return dDao.selectReferFourType(csVo);
	}

	@Override
	public int selectReferCntAllFourType(DocumentVO dVo) {
		return dDao.selectReferCntAllFourType(dVo);
	}

	@Override
	public int selectReferCntFourType(DocumentVO dVo) {
		return dDao.selectReferCntFourType(dVo);
	}

}
