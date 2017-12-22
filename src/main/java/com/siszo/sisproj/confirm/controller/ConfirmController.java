package com.siszo.sisproj.confirm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.confirm.comment.model.CommentService;
import com.siszo.sisproj.confirm.comment.model.CommentVO;
import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.common.ConfirmUtility;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineService;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.confirm.docform.model.DocumentFormService;
import com.siszo.sisproj.confirm.docform.model.DocumentFormVO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileService;
import com.siszo.sisproj.confirm.file.model.ConfirmFileVO;
import com.siszo.sisproj.confirm.model.DocumentService;
import com.siszo.sisproj.confirm.model.DocumentVO;
import com.siszo.sisproj.confirm.saveline.model.SaveLineService;
import com.siszo.sisproj.confirm.saveline.model.SaveLineVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/confirm")
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
	
	@Autowired
	private DocumentFormService dfService;
	@Autowired
	private DocumentService dService;
	@Autowired
	private ConfirmLineService clService;
	@Autowired
	private SaveLineService slService;
	@Autowired
	private ConfirmFileService cfService;
	@Autowired
	private CommentService commService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	private int empNo = 20170001; //임시회원번호 김연아
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("전자결재 메인화면 보여주기");
		
		return "confirm/main";
	}
	
	@RequestMapping("/newcho.do")
	public String newwrite(ModelMap model) {
		logger.info("새 결재 진행 - choice 화면 보여주기");
		
		List<DocumentFormVO> docFormList = dfService.selectDocFormAll();
		List<DocumentFormVO> docTypeList = dfService.selectDocTypeAll();
		logger.info("새 결재 진행 조회 결과 docFormList.size()={}, docTypeList.size()={}",docFormList.size(),docTypeList.size());
		
		model.addAttribute("docFormList", docFormList);
		model.addAttribute("docTypeList", docTypeList);
		
		return "confirm/newcho";
	}
	
	@RequestMapping("/write.do")
	public String write(@RequestParam(defaultValue="0") int formNo, Model model) {
		logger.info("새 결재 진행 - 결재 작성 화면 보여주기");
		
		String msg="", url="";
		if(formNo==0) {
			msg="잘못된 URL입니다.";
			url="/confirm/newcho.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		DocumentFormVO vo = dfService.selectDocFormByFormNo(formNo);
		int seq = dService.selectConfirmSEQ();
		logger.info("양식폼 가져오기 처리결과 vo={}, seq={}",vo, seq);
		List<DocumentVO> docuVo = dService.completeDocSelByEmpNo(empNo);
		
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(day);
		System.out.println("오늘날짜"+today);
		
		model.addAttribute("vo",vo);
		model.addAttribute("today",today);
		model.addAttribute("seq",seq);
		model.addAttribute("empNo",empNo);
		model.addAttribute("docuVo",docuVo);
		
		return "confirm/write";
	}
	
	@RequestMapping("/tempsave.do")
	public String tempsave(@ModelAttribute ConfirmSearchVO svo, Model model) {
		logger.info("임시저장함 보여주기, 파라미터 searchVo={}",svo);
		//임시저장함 플래그 VO에 입력
		svo.setListType(DocumentService.TEMPORARY_SAVE);
		
		//paging처리에 필요한 변수 계산을 위한 paginationInfo 생성
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setBlockSize(ConfirmUtility.BLOCK_SIZE);
		pageInfo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		pageInfo.setCurrentPage(svo.getCurrentPage());
		
		//searchVo에 값 세팅
		svo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		svo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값={}", svo);
		
		List<DocumentVO> docuList = dService.selectAllDoc(svo);
		logger.info("임시저장함 목록 조회 결과, docuList.size()={}",docuList.size());

		//제목 길이 처리
		for(DocumentVO imvo : docuList) {
			String str = imvo.getCfTitle();
			String title = ConfirmUtility.titleLength(str, 44);
			
			imvo.setCfTitle(title);
		}
		
		int totalRecord = dService.totalRecordCountDoc(svo);
		logger.info("임시저장함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		pageInfo.setTotalRecord(totalRecord);		
		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/tempsave";
	}
	
	@RequestMapping("/setting.do")
	public String setting() {
		logger.info("결재 환경 설정 보여주기");
		return "confirm/setting";
	}
	
	@RequestMapping("/confirmOk.do")
	public String confirmOk_post(@ModelAttribute DocumentVO docuVo, @RequestParam String allConfirmers,	HttpServletRequest request, Model model) {
		//임시저장인지 결재 처리인지 플래그 vo에 세팅
		String writeType = docuVo.getCfStatus();
		logger.info("새 결재 진행 - 결재 문서 작성 처리, 파라미터 docuVo={}, 저장처리 방식 : writeType={}", docuVo, writeType);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = null;
		String fileName = "", fileOriName="";
		long fileSize=0;
		List<ConfirmFileVO> uploadFileList = new ArrayList<ConfirmFileVO>();
		boolean fileResult=true;

		String msg="", url="";
		try {
			fileList = fileUtil.fileupload(request, FileUploadUtil.ATTACHFILE);
			//파일 업로드 한경우
			if(fileList!=null && !fileList.isEmpty()) {
				for(Map<String, Object> map : fileList) {
					fileOriName = (String) map.get("originalFileName");
					fileName = (String) map.get("fileName");
					fileSize = (Long) map.get("fileSize");
					
					ConfirmFileVO cfVo = new ConfirmFileVO();
					cfVo.setFileOriName(fileOriName);
					cfVo.setFileName(fileName);
					cfVo.setFileSize(fileSize);
					cfVo.setCfNo(docuVo.getCfNo());
					
					uploadFileList.add(cfVo);
				}
				docuVo.setCfIsfile(DocumentService.HAVE_FILES);
			} else {
				docuVo.setCfIsfile(DocumentService.NOT_HAVE_FILES);
			}
			logger.info("파일 처리 이후 docuVo 내용, docuVo={}",docuVo);
			logger.info("업로드 파일 리스트, uploadFileList.size()={}",uploadFileList.size());
			
		} catch (IllegalStateException e) {
			fileResult=false;
			e.printStackTrace();
		} catch (IOException e) {
			fileResult=false;
			e.printStackTrace();
		}
		
		//파일 등록하지 않았거나, 파일처리 오류 안났을때 디비 저장
		if(fileResult==true) {
			//결재자 리스트 생성
			List<ConfirmLineVO> clVoList = new ArrayList<ConfirmLineVO>();
			String[] confirmers = allConfirmers.split(",");
			for(int i=0; i<confirmers.length; i++) {
				if(!confirmers[i].equals("") || !confirmers[i].isEmpty()) {
					ConfirmLineVO clVo = new ConfirmLineVO();
					
					clVo.setEmpNo(Integer.parseInt(confirmers[i]));
					clVo.setLineStat(ConfirmLineService.CL_AWAIT);
					clVo.setCfNo(docuVo.getCfNo());
					
					clVoList.add(clVo);
					logger.info("clVo={}", clVo);
				}
			}
			logger.info("결재자, allConfirmers={}", allConfirmers);
			logger.info("결재자 인원 수, clVoList.size()={}", clVoList.size());
			
			
			//db작업 -- 문서인서트(docuVo), 해당파일정보인서트(uploadFileList), 결재자 등록처리(clVoList), 
			int cnt = dService.insertConfirmDoc(docuVo, uploadFileList, clVoList);
			logger.info("결재 문서 등록 처리 결과 cnt={}", cnt);
			if(cnt>0) {
				//nextcf(내 결재 완료 후 상신)/tempsave(임시저장)
				if(writeType.equals(DocumentService.CONFIRM_AWAIT)) {
					//결재완료 후 상신
					ConfirmLineVO myConfirm = new ConfirmLineVO();
					myConfirm.setCfNo(docuVo.getCfNo());
					myConfirm.setLineStat(ConfirmLineService.CL_COMPLETE);
					myConfirm.setEmpNo(empNo);
					
					cnt = clService.myConfirmOk(myConfirm);
					if(cnt>0) {
						msg = "결재 후 상신 되었습니다.";
						url = "/confirm/detail.do?cfNo="+docuVo.getCfNo();						
					} else {
						msg = "내 결재 실패!!";
						url = "/confirm/write.do?formNo="+docuVo.getFormNo();						
					}
				} else if(writeType.equals(DocumentService.TEMPORARY_SAVE)) {
					//임시저장 처리
					msg = "임시 저장함에 저장 되었습니다.";
					url = "/confirm/detail.do?cfNo="+docuVo.getCfNo();	
				}
			} else {
				msg = "데이터 저장 실패";
				url = "/confirm/write.do?formNo="+docuVo.getFormNo();	
				//데이터 저장 실패시 파일 있다면 삭제 처리
				if(docuVo.getCfIsfile()==DocumentService.HAVE_FILES) {
					String path = fileUtil.getUploadPath(request, FileUploadUtil.ATTACHFILE);
					for(ConfirmFileVO delfileVo : uploadFileList) {
						File delFile = new File(path, delfileVo.getFileName());
						if(delFile.exists()) {
							boolean bool = delFile.delete();
							logger.info("등록 실패시 파일도 삭제 여부 bool={}",bool);
						}
					}
				}
			}
		} else {
			msg = "파일업로드 실패";
			url = "/confirm/write.do?formNo="+docuVo.getFormNo();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/await.do")
	public String await(@ModelAttribute ConfirmSearchVO svo, Model model) {
		logger.info("결재대기함 화면 보여주기, 파라미터 searchVo={}",svo);
		//결재대기함 플래그 VO에 입력
		svo.setListType(DocumentService.CONFIRM_AWAIT);
		
		//paging 처리에 필요한 변수
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setBlockSize(ConfirmUtility.BLOCK_SIZE);
		pageInfo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		pageInfo.setCurrentPage(svo.getCurrentPage());
		
		//searchVo에 값 세팅
		svo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		svo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값={}", svo);

		List<DocumentVO> docuList = dService.selectAllDoc(svo);
		logger.info("결재대기함 목록 조회 결과, docuList.size()={}",docuList.size());
		
		//이름 넣어주기 + 제목 길이 처리
		for(DocumentVO imvo : docuList) {
			EmployeeVO eVo = dService.selectByEmpNo(imvo.getEmpNo());
			String empName = eVo.getEmpName();
			imvo.setEmpName(empName);

			String str = imvo.getCfTitle();
			String title = ConfirmUtility.titleLength(str, 36);
			
			imvo.setCfTitle(title);
		}
		
		int totalRecord = dService.totalRecordCountDoc(svo);
		logger.info("결재대기함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		
		pageInfo.setTotalRecord(totalRecord);		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/await";
		

		//처리해야함 : 해당 결재라인을 전체 조회해서 List얻음 -> 얻고 나서 line_no 순으로 for문으로 돌리면서 대기인 사람과 본인 만 해당 문서 보여주기
	}
	
	@RequestMapping("/complete.do")
	public String complete(@ModelAttribute ConfirmSearchVO svo, Model model) {
		logger.info("결재완료함 화면 보여주기, 파라미터 searchVo={}",svo);
		//결재완료함 플래그 VO에 입력
		svo.setListType(DocumentService.CONFIRM_COMPLETE);
		
		//paging 처리에 필요한 변수
				PaginationInfo pageInfo = new PaginationInfo();
				pageInfo.setBlockSize(ConfirmUtility.BLOCK_SIZE);
				pageInfo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
				pageInfo.setCurrentPage(svo.getCurrentPage());
				
				//searchVo에 값 세팅
				svo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
				svo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
				logger.info("searchVo 최종값={}", svo);

				List<DocumentVO> docuList = dService.selectAllDoc(svo);
				logger.info("결재완료함 목록 조회 결과, docuList.size()={}",docuList.size());
				
				//제목 길이 처리
				for(DocumentVO imvo : docuList) {
					String str = imvo.getCfTitle();
					String title = ConfirmUtility.titleLength(str, 44);
					
					imvo.setCfTitle(title);
				}
				
				int totalRecord = dService.totalRecordCountDoc(svo);
				logger.info("결재완료함 문서 개수 조회 결과, totalRecord={}",totalRecord);
				
				pageInfo.setTotalRecord(totalRecord);		
				logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
				
				model.addAttribute("pageInfo",pageInfo);
				model.addAttribute("docuList",docuList);
		
		return "confirm/complete";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam (defaultValue="") String cfNo, Model model) {
		logger.info("상세페이지 보여주기, 파라미터={}", cfNo);
		
		//1. cfNo의 결재 문서 confirm테이블에서 가져옴 + 양식정보도 가져와서 vo에 삽입 = DocumentVO = docuVo (*)
		DocumentVO docVo = dService.selectDocByCfNo(cfNo);
		logger.info("해당 문서 조회, docuVo={}",docVo);
		
		//2. 해당 기안자 조회 해서 EmployeeVO 구함(기안자, 부서이름 조회용)
		EmployeeVO eVo = dService.selectByEmpNo(docVo.getEmpNo());
		logger.info("해당 문서 작성자 조회, eVo={}",eVo);
		
		//3. cfNo의 결재라인 confirm_line 테이블에서 가져옴 = List<ConfirmLineVO> (*)
		List<ConfirmLineVO> clVoList = clService.selectCfLineByCfNo(cfNo);
		logger.info("해당 문서 결재라인 조회, clVoList.size()={}", clVoList.size());
		
		//4. 연계문서가 있다면 (docuVo.linkCfNo) confirm테이블에서 가져옴= DocumentVO = docuVo2 (cfNo, cfTitle)
		DocumentVO linkDoc = new DocumentVO();
		if(docVo.getLinkCfNo()!=null && !docVo.getLinkCfNo().isEmpty()) {
			linkDoc = dService.selectDocByCfNo(docVo.getLinkCfNo());
			logger.info("해당 문서의 연계문서, linkDoc={}",linkDoc);
		}
		
		//5. 파일이 있다면 (docuVo.isFile=="Y") confirm_file테이블 에서 가져옴= List<ConfirmFileVO>
		List<ConfirmFileVO> fileList = new ArrayList<ConfirmFileVO>();
		if(docVo.getCfIsfile().equals(DocumentService.HAVE_FILES)) {
			fileList = cfService.selectCfFileByCfNo(cfNo);
			logger.info("해당 문서의 파일 리스트, fileList.size()={}",fileList.size());
		}
		
		//6. 의견이 있다면 (comm테이블에서 cfNo로 셀렉) comm테이블에서 가져옴= List<CommentVO>
		int isComment = commService.selectCommCNTByCfNo(cfNo);
		List<CommentVO> commVoList = new ArrayList<CommentVO>();
		if(isComment>0) {
			commVoList = commService.selectCommByCfNo(cfNo);
			logger.info("해당 문서의 의견 리스트, commVoList.size()={}",commVoList.size());
		}
		
		model.addAttribute("docVo", docVo);
		model.addAttribute("eVo", eVo);
		model.addAttribute("clVoList", clVoList);
		model.addAttribute("linkDoc", linkDoc);
		model.addAttribute("fileList", fileList);
		model.addAttribute("commVoList", commVoList);
		//결재 상태 확인용 상태플래그
		model.addAttribute("CL_AWAIT",ConfirmLineService.CL_AWAIT);
		model.addAttribute("CL_COMPLETE",ConfirmLineService.CL_COMPLETE);
		model.addAttribute("CL_RETURN",ConfirmLineService.CL_RETURN);
		
		return "confirm/detail";
	}
	
	@RequestMapping("/line.do")
	public String line(Model model) {
		logger.info("결재라인 선택화면 보여주기");
		
		List<SaveLineVO> slVoList = slService.selectSaveLineByEmpNo(empNo);
		
		model.addAttribute("slVoList",slVoList);
		
		return "confirm/line";
	}

	@RequestMapping("/choLine.do")
	public String choline(@RequestParam(defaultValue="0") int empNo, @RequestParam(defaultValue="0") int saveNo, Model model) {
		logger.info("결재자 선택 화면, 파라미터 empNo={}, saveNo={}",empNo,saveNo);
		
		String msg="", url="";
		if(empNo==0 && saveNo==0) {
			msg="잘못된 URL입니다.";
			url="/confirm/main.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		//왼쪽 결재라인 그룹 선택시
		if(saveNo>0) {
			SaveLineVO savelineVo = slService.selectSaveLineBySaveNo(saveNo);
			
			String confirmers = savelineVo.getSaveConfirmer();
			String[] empNos = confirmers.split("-");
			
			List<ConfirmLineVO> empNoList = new ArrayList<ConfirmLineVO>();
			for(int i=0; i<empNos.length; i++) {
				empNoList.add(clService.selectConfirmerByEmpNo(Integer.parseInt(empNos[i])));
			}
			
			model.addAttribute("empNoList", empNoList);
		}
		
		//조직도에서 결재자 선택시
		if(empNo>0) {
			ConfirmLineVO clVo = clService.selectConfirmerByEmpNo(empNo);
			model.addAttribute("clVo", clVo);
		}
		
		return "confirm/choLine";
	}
	
	@RequestMapping("/return.do")
	public String return_get(@ModelAttribute ConfirmSearchVO svo, Model model) {
		logger.info("결재반려함 화면 보여주기, 파라미터 searchVo={}",svo);
		//결재반려함 플래그 VO에 입력
		svo.setListType(DocumentService.CONFIRM_RETURN);
		
		//paging 처리에 필요한 변수
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setBlockSize(ConfirmUtility.BLOCK_SIZE);
		pageInfo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		pageInfo.setCurrentPage(svo.getCurrentPage());
		
		//searchVo에 값 세팅
		svo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		svo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값={}", svo);

		List<DocumentVO> docuList = dService.selectAllDoc(svo);
		logger.info("결재반려함 목록 조회 결과, docuList.size()={}",docuList.size());
		
		//제목 길이 처리
		for(DocumentVO imvo : docuList) {
			String str = imvo.getCfTitle();
			String title = ConfirmUtility.titleLength(str, 44);
			
			imvo.setCfTitle(title);
		}
		
		int totalRecord = dService.totalRecordCountDoc(svo);
		logger.info("결재반려함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		
		pageInfo.setTotalRecord(totalRecord);		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/return";
	}

	@RequestMapping("/edit.do")
	public String edit() {
		logger.info("문서 수정화면 보여주기");
		return "confirm/edit";
	}
}
