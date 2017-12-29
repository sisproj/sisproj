package com.siszo.sisproj.confirm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
import com.siszo.sisproj.confirm.isread.model.CfIsReadService;
import com.siszo.sisproj.confirm.isread.model.CfIsReadVO;
import com.siszo.sisproj.confirm.model.DocumentService;
import com.siszo.sisproj.confirm.model.DocumentVO;
import com.siszo.sisproj.confirm.saveline.model.SaveLineService;
import com.siszo.sisproj.confirm.saveline.model.SaveLineVO;
import com.siszo.sisproj.confirm.sign.model.SignService;
import com.siszo.sisproj.confirm.sign.model.SignVO;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
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
	private CfIsReadService cirService;
	@Autowired
	private SignService sService;
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/main.do")
	public String main(HttpSession session, Model model) {
		logger.info("전자결재 메인화면 보여주기");
		//세션 세팅
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");		
		
		DocumentVO dVo = new DocumentVO();
		dVo.setEmpNo(empVo.getEmpNo());
		dVo.setIsRead("N");
		// 메인화면 박스별 숫자 세팅 1.임시저장함
		dVo.setCfStatus(DocumentService.TEMPORARY_SAVE);
		int tempsaveCnt= dService.selectSaveWaitCntThirdType(dVo);
		logger.info("임시저장함 레코드수 tempsaveCnt={}", tempsaveCnt);
		int tempsaveCntAll= dService.selectSaveWaitAllCntThirdType(dVo);
		logger.info("임시저장함 전체 레코드수tempsaveCntAll={}", tempsaveCntAll);
		
		//2.결재대기함
		dVo.setCfStatus(DocumentService.CONFIRM_AWAIT);
		int awaitCnt = dService.selectSaveWaitCntThirdType(dVo);
		logger.info("결재대기함 레코드수 awaitCnt={}", awaitCnt);
		int awaitCntAll = dService.selectSaveWaitAllCntThirdType(dVo);
		logger.info("결재대기함 전체 레코드수 awaitCntAll={}", awaitCntAll);
		
		//3.결재완료함
		dVo.setCfStatus(DocumentService.CONFIRM_COMPLETE);
		int completeCnt = dService.selectCompleteCntOneType(dVo);
		logger.info("결재완료함 레코드수 completeCnt={}", completeCnt);
		int completeCntAll = dService.selectCompleteAllCntOneType(dVo);
		logger.info("결재완료함 전체 레코드수 completeCntAll={}", completeCntAll);
		
		//4.결재반려함
		dVo.setCfStatus(DocumentService.CONFIRM_RETURN);
		int returnCnt = dService.selectReturnCntSecondType(dVo);
		logger.info("결재반려함 레코드수 returnCnt={}", returnCnt);
		int returnCntAll = dService.selectReturnAllCntSecondType(dVo);
		logger.info("결재반려함 전체 레코드수 returnCntAll={}", returnCntAll);
		
		//5. 참조수신함
		dVo.setCfStatus(DocumentService.CONFIRM_COMPLETE);
		int postboxCnt = dService.selectReferCntFourType(dVo);
		logger.info("참조수신함 레코드 수 postboxCnt={}",postboxCnt);
		int postboxCntAll = dService.selectReferCntAllFourType(dVo);
		logger.info("참조수신함 레코드 수 postboxCntAll={}", postboxCntAll);
		
		// 테이블 세팅 1.결재 대기함
		//결재대기함 플래그 VO에 입력
		ConfirmSearchVO csVo = new ConfirmSearchVO();
		//searchVo에 값 세팅
		csVo.setEmpNo(empVo.getEmpNo());
		csVo.setRecordCountPerPage(5);
		csVo.setFirstRecordIndex(0);
		//결재대기함 플래그 VO에 입력
		csVo.setListType(DocumentService.CONFIRM_AWAIT);
		logger.info("searchVo 최종값={}", csVo);
		
		List<DocumentVO> awaitList = dService.selectSaveWaitThirdType(csVo);
		logger.info("결재대기함 목록 조회 결과, awaitList.size()={}",awaitList.size());

		//제목 길이 처리, 꺽쇠 처리, 이름 세팅
		for(DocumentVO imvo : awaitList) {			
			String str = imvo.getCfTitle();
			String title = ConfirmUtility.titleLength(str, 14);
			//스크립트 보안 : 꺽쇠 변환
			title = ConfirmUtility.changeTag(title);			
			imvo.setCfTitle(title);
			
			EmployeeVO eVo = dService.selectByEmpNo(imvo.getEmpNo());
			String empName = eVo.getEmpName();
			imvo.setEmpName(empName);
		}
		
		//2.결재 완료함
		//결재완료함 플래그 VO에 입력
		csVo.setListType(DocumentService.CONFIRM_COMPLETE);
		logger.info("searchVo 최종값={}", csVo);
		
		List<DocumentVO> completeList = dService.selectCompleteOneType(csVo);
		logger.info("결재완료함 목록 조회 결과, completeList.size()={}",completeList.size());

		//제목 길이 처리, 꺽쇠 처리
		for(DocumentVO imvo : completeList) {
			String str = imvo.getCfTitle();
			String title = ConfirmUtility.titleLength(str, 18);
			//스크립트 보안 : 꺽쇠 변환
			title = ConfirmUtility.changeTag(title);			
			imvo.setCfTitle(title);
		}
		
		model.addAttribute("tempsaveCnt",tempsaveCnt);
		model.addAttribute("awaitCnt",awaitCnt);
		model.addAttribute("completeCnt",completeCnt);
		model.addAttribute("returnCnt",returnCnt);
		model.addAttribute("tempsaveCntAll",tempsaveCntAll);
		model.addAttribute("awaitCntAll",awaitCntAll);
		model.addAttribute("completeCntAll",completeCntAll);
		model.addAttribute("returnCntAll",returnCntAll);
		model.addAttribute("postboxCnt",postboxCnt);
		model.addAttribute("postboxCntAll",postboxCntAll);
		
		model.addAttribute("awaitList",awaitList);
		model.addAttribute("completeList",completeList);
		
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
	public String write(@RequestParam(defaultValue="0") int formNo,HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
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
		List<DocumentVO> docuVo = dService.completeDocSelByEmpNo(empVo.getEmpNo());
		
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(day);
		System.out.println("오늘날짜"+today);
		
		model.addAttribute("vo",vo);
		model.addAttribute("today",today);
		model.addAttribute("seq",seq);
		model.addAttribute("eVo",empVo);
		model.addAttribute("docuVo",docuVo);
		
		return "confirm/write";
	}
	
	@RequestMapping("/line.do")
	public String line(HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("결재라인 선택화면 보여주기");
		
		List<SaveLineVO> slVoList = slService.selectSaveLineByEmpNo(empVo.getEmpNo());
		
		model.addAttribute("slVoList",slVoList);
		
		return "confirm/line";
	}

	@RequestMapping("/choLine.do")
	public String choline(@RequestParam(defaultValue="0") int empNo, @RequestParam(defaultValue="0") int saveNo, Model model) {
		logger.info("결재자 선택 화면, 파라미터 empNo={}, saveNo={}",empNo,saveNo);
	
		//왼쪽 결재라인 그룹 선택시
		if(saveNo>0) {
			SaveLineVO savelineVo = slService.selectSaveLineBySaveNo(saveNo);
			
			String confirmers = savelineVo.getSaveConfirmer();
			String[] empNos = confirmers.split(",");
			
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
	//결재환경설정
	@RequestMapping("/setting.do")
	public String setting(HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
		logger.info("결재 환경 설정 보여주기");
		logger.info("결재서명등록 화면 보여주기");	
		SignVO sVo = sService.selectSign(empVo.getEmpNo());
		logger.info("결재 서명 조회 결과 sVo={}",sVo);
		
		logger.info("결재라인등록 화면 보여주기");		
		List<SaveLineVO> slVoList = slService.selectSaveLineByEmpNo(empVo.getEmpNo());
		
		model.addAttribute("sVo",sVo);
		model.addAttribute("slVoList",slVoList);
		model.addAttribute("eVo",empVo);
		
		return "confirm/setting";
	}
	
	@RequestMapping("/confirmLine.do")
	public String confirmLine(@ModelAttribute SaveLineVO slVo, Model model) {
		logger.info("결재라인 등록 처리(save_line 테이블), 파라미터 slVo={}",slVo);
		
		int cnt = slService.insertSaveLine(slVo);
		String msg="", url="/confirm/setting.do#tabs-2";
		if(cnt>0) {
			msg="결재라인이 등록 되었습니다.";
		} else {
			msg="결재라인 등록실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";		
	}
	
	@RequestMapping("/editLine.do")
	public String editLine(@ModelAttribute SaveLineVO slVo, Model model) {
		logger.info("결재라인 수정 처리(save_line 테이블), 파라미터 slVo={}",slVo);
		
		int cnt = slService.updateSaveLine(slVo);
		String msg="", url="/confirm/setting.do#tabs-2";
		if(cnt>0) {
			msg="결재라인이 수정 되었습니다.";
		} else {
			msg="결재라인 수정실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";	
	}
	
	@RequestMapping("/deleteLine.do")
	public String deleteLine(@RequestParam(defaultValue="0") int saveNo, Model model) {
		logger.info("결재라인 삭제 처리(save_line 테이블), 파라미터 saveNo={}",saveNo);
		
		int cnt = slService.deleteSaveLine(saveNo);
		String msg="", url="/confirm/setting.do#tabs-2";
		if(cnt>0) {
			msg="결재라인이 삭제 되었습니다.";
		} else {
			msg="결재라인 삭제실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";		
	}
	/////
	@RequestMapping("/confirmOk.do")
	public String confirmOk_post(@ModelAttribute DocumentVO docuVo, @RequestParam String allConfirmers,	
			HttpSession session, HttpServletRequest request, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
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

		//결재자 리스트 생성, 다음결재자 세팅
		List<ConfirmLineVO> clVoList = new ArrayList<ConfirmLineVO>();
		String[] confirmers = allConfirmers.split(",");
		for(int i=0; i<confirmers.length; i++) {
			if(!confirmers[i].equals("") || !confirmers[i].isEmpty()) {
				ConfirmLineVO clVo = new ConfirmLineVO();
				
				clVo.setEmpNo(Integer.parseInt(confirmers[i]));
				clVo.setLineStat(ConfirmLineService.CL_AWAIT);
				clVo.setCfNo(docuVo.getCfNo());
				clVo.setLineOrder(i+1);
				
				clVoList.add(clVo);
				logger.info("clVo={}", clVo);
			}
		}
		logger.info("결재자, allConfirmers={}", allConfirmers);
		logger.info("결재자 인원 수, clVoList.size()={}", clVoList.size());
		
		
		if(writeType.equals(DocumentService.CONFIRM_AWAIT)) {
			//결재완료 후 상신이라면 결재 결재순서 1번의 사원번호 입력
			docuVo.setCfConfirmer(clVoList.get(1).getEmpNo());
		} else if(writeType.equals(DocumentService.TEMPORARY_SAVE)) {
			//임시저장이라면 결재순서 0번의 사원번호 입력
			docuVo.setCfConfirmer(clVoList.get(0).getEmpNo());
		}
		logger.info("다음 결재자 docuVo.getCfConfermer={}",docuVo.getCfConfirmer());
		
		//파일 등록하지 않았거나, 파일처리 오류 안났을때 디비 저장
		if(fileResult==true) {			
			//db작업 -- 문서인서트(docuVo), 해당파일정보인서트(uploadFileList), 결재자 등록처리(clVoList), 읽은 글 여부 테이블 insert 처리
			int cnt = dService.insertConfirmDoc(docuVo, uploadFileList, clVoList);
			logger.info("결재 문서 등록 처리 결과 cnt={}", cnt);
			if(cnt>0) {
				//nextcf(내 결재 완료 후 상신)/tempsave(임시저장)
				if(writeType.equals(DocumentService.CONFIRM_AWAIT)) {
					//결재완료 후 상신
					ConfirmLineVO myConfirm = new ConfirmLineVO();
					myConfirm.setCfNo(docuVo.getCfNo());
					myConfirm.setLineStat(ConfirmLineService.CL_COMPLETE);
					myConfirm.setEmpNo(empVo.getEmpNo());
					
					cnt = clService.myConfirmOk(myConfirm);
					if(cnt>0) {
						msg = "결재 후 상신 되었습니다.";
						url = "/confirm/await.do";						
					} else {
						msg = "내 결재 실패!!";
						url = "/confirm/write.do?formNo="+docuVo.getFormNo();						
					}
				} else if(writeType.equals(DocumentService.TEMPORARY_SAVE)) {
					//임시저장 처리
					msg = "임시 저장함에 저장 되었습니다.";
					url = "/confirm/tempsave.do";	
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
	
	@RequestMapping("/confirmEdit.do")
	public String confirmEdit(@ModelAttribute DocumentVO docuVo, @RequestParam String allConfirmers, 
			HttpSession session, HttpServletRequest request, Model model) {
		//세션 받아오기
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
		//임시저장인지 결재 처리인지 플래그 vo에 세팅
		String writeType = docuVo.getCfStatus();
		logger.info("결재 문서 수정 처리, 파라미터 docuVo={}, 저장처리 방식 : writeType={}", docuVo, writeType);
		
		//oldFileList 얻기
		List<ConfirmFileVO> oldFileList = new ArrayList<ConfirmFileVO>();
		if(docuVo.getCfIsfile().equals(DocumentService.HAVE_FILES)) {
			oldFileList = cfService.selectCfFileByCfNo(docuVo.getCfNo());
			logger.info("해당 문서의 기존 파일 리스트, oldFileNameList.size()={}",oldFileList.size());
		}		
		
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
		
		//결재자 리스트 생성, 다음결재자 세팅
		List<ConfirmLineVO> clVoList = new ArrayList<ConfirmLineVO>();
		String[] confirmers = allConfirmers.split(",");
		for(int i=0; i<confirmers.length; i++) {
			if(!confirmers[i].equals("") || !confirmers[i].isEmpty()) {
				ConfirmLineVO clVo = new ConfirmLineVO();
				
				clVo.setEmpNo(Integer.parseInt(confirmers[i]));
				clVo.setLineStat(ConfirmLineService.CL_AWAIT);
				clVo.setCfNo(docuVo.getCfNo());
				clVo.setLineOrder(i+1);
				
				clVoList.add(clVo);
				logger.info("clVo={}", clVo);
			}
		}
		logger.info("결재자, allConfirmers={}", allConfirmers);
		logger.info("결재자 인원 수, clVoList.size()={}", clVoList.size());
		
		
		if(writeType.equals(DocumentService.CONFIRM_AWAIT)) {
			//결재완료 후 상신이라면 결재 결재순서 1번의 사원번호 입력
			docuVo.setCfConfirmer(clVoList.get(1).getEmpNo());
		} else if(writeType.equals(DocumentService.TEMPORARY_SAVE)) {
			//임시저장이라면 결재순서 0번의 사원번호 입력
			docuVo.setCfConfirmer(clVoList.get(0).getEmpNo());
		}
		logger.info("다음 결재자 docuVo.getCfConfermer={}",docuVo.getCfConfirmer());
		
		//파일 등록하지 않았거나, 파일처리 오류 안났을때 디비 저장
		if(fileResult==true) {
			//db작업 -- 문서인서트(docuVo), 해당파일정보인서트(uploadFileList), 결재자 등록처리(clVoList), 읽은 글 여부 테이블 insert 처리
			int cnt = dService.updateConfirmDoc(docuVo, uploadFileList, clVoList);
			logger.info("결재 문서 수정 처리 결과 cnt={}", cnt);
			if(cnt>0) {
				//nextcf(내 결재 완료 후 상신)/tempsave(임시저장)
				if(writeType.equals(DocumentService.CONFIRM_AWAIT)) {
					//결재완료 후 상신
					ConfirmLineVO myConfirm = new ConfirmLineVO();
					myConfirm.setCfNo(docuVo.getCfNo());
					myConfirm.setLineStat(ConfirmLineService.CL_COMPLETE);
					myConfirm.setEmpNo(empVo.getEmpNo());
					
					cnt = clService.myConfirmOk(myConfirm);
					if(cnt>0) {
						msg = "결재 후 상신 되었습니다.";
						url = "/confirm/await.do";						
					} else {
						msg = "내 결재 실패!!";
						url = "/confirm/write.do?formNo="+docuVo.getFormNo();						
					}
				} else if(writeType.equals(DocumentService.TEMPORARY_SAVE)) {
					//임시저장 처리
					msg = "임시 저장함에 저장 되었습니다.";
					url = "/confirm/tempsave.do";	
				}
				
				//파일 새로 첨부한 경우, 기존 파일이 존재한다면 삭제
				if(uploadFileList.size()>0) {
					if(docuVo.getCfIsfile()==DocumentService.HAVE_FILES) {
						String path = fileUtil.getUploadPath(request, FileUploadUtil.ATTACHFILE);
						for(ConfirmFileVO cfVo : oldFileList) {
							File delFile = new File(path, cfVo.getFileName());
							if(delFile.exists()) {
								boolean bool = delFile.delete();
								logger.info("기존 파일 삭제여부 bool={}", bool);
							}
						}
					}
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
	
	@RequestMapping("/edit.do")
	public String edit(@RequestParam(required=false) String cfNo,HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
		logger.info("문서 수정화면 보여주기, 파라미터 cfNo={}",cfNo);
		if(cfNo==null || cfNo.isEmpty()) {
			String msg = "잘못된 URL입니다.";
			String url = "/confirm/main.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);

			return "common/message";
		}
		//1. cfNo의 결재 문서 confirm테이블에서 가져옴 + 양식정보도 가져와서 vo에 삽입 = DocumentVO = docuVo (*)
		DocumentVO docVo = dService.selectDocByCfNo(cfNo);
		logger.info("해당 문서 조회, docuVo={}",docVo);
		//스크립트 보안 : 꺽쇠 변환
		String title = docVo.getCfTitle();
		title = ConfirmUtility.changeTag(title);
		docVo.setCfTitle(title);
				
		//3. cfNo의 결재라인 confirm_line 테이블에서 가져옴 = List<ConfirmLineVO> (*)
		List<ConfirmLineVO> clVoList = clService.selectCfLineByCfNo(cfNo);
		logger.info("해당 문서 결재라인 조회, clVoList.size()={}", clVoList.size());
		String allConfirmers = "";
		for(ConfirmLineVO clVo : clVoList){
			allConfirmers += clVo.getEmpNo()+",";
		}
		
		//4. 연계문서가 있다면 (docuVo.linkCfNo) confirm테이블에서 가져옴= DocumentVO = docuVo2 (cfNo, cfTitle)
		DocumentVO linkDoc = new DocumentVO();
		if(docVo.getLinkCfNo()!=null && !docVo.getLinkCfNo().isEmpty()) {
			linkDoc = dService.selectDocByCfNo(docVo.getLinkCfNo());
			//스크립트 보안 : 꺽쇠 변환
			title = linkDoc.getCfTitle();
			title = ConfirmUtility.changeTag(title);
			linkDoc.setCfTitle(title);
			logger.info("해당 문서의 연계문서, linkDoc={}",linkDoc);
		}
		
		//5. 파일이 있다면 (docuVo.isFile=="Y") confirm_file테이블 에서 가져옴= List<ConfirmFileVO>
		List<ConfirmFileVO> fileList = new ArrayList<ConfirmFileVO>();
		if(docVo.getCfIsfile().equals(DocumentService.HAVE_FILES)) {
			fileList = cfService.selectCfFileByCfNo(cfNo);
			logger.info("해당 문서의 파일 리스트, fileList.size()={}",fileList.size());
		}
		//6. 연계문서 선택 리스트
		List<DocumentVO> compleVoList = dService.completeDocSelByEmpNo(empVo.getEmpNo());
		logger.info("연계문서리스트 조회 결과, compleVoList.size()={}",compleVoList.size());

		model.addAttribute("docVo", docVo);
		model.addAttribute("eVo", empVo);
		model.addAttribute("clVoList", clVoList);
		model.addAttribute("linkDoc", linkDoc);
		model.addAttribute("fileList", fileList);
		model.addAttribute("compleVoList",compleVoList);
		model.addAttribute("empNoList",clVoList);
		model.addAttribute("allConfirmers",allConfirmers);
		//결재 상태 확인용 상태플래그
		model.addAttribute("CL_AWAIT",ConfirmLineService.CL_AWAIT);
		model.addAttribute("CL_COMPLETE",ConfirmLineService.CL_COMPLETE);
		model.addAttribute("CL_RETURN",ConfirmLineService.CL_RETURN);
		
		return "confirm/edit";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(required=false) String cfNo, HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
		logger.info("상세페이지 보여주기, 파라미터 cfNo={}", cfNo);
		if(cfNo==null || cfNo.isEmpty()) {
			String msg = "잘못된 URL입니다.";
			String url = "/confirm/main.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);

			return "common/message";
		}
		//0. 해당글 해당 유저 읽은글 처리
		CfIsReadVO cirVo = new CfIsReadVO();
		cirVo.setCfNo(cfNo);
		cirVo.setEmpNo(empVo.getEmpNo());
		cirVo.setIsRead("Y");
		int cnt = cirService.updateIsReadDoc(cirVo);
		if(cnt<=0) {
			String msg = "읽은글로 처리 실패!";
			String url = "/confirm/main.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);

			return "common/message";
		}
		
		//1. cfNo의 결재 문서 confirm테이블에서 가져옴 + 양식정보도 가져와서 vo에 삽입 = DocumentVO = docuVo (*)
		DocumentVO docVo = dService.selectDocByCfNo(cfNo);
		logger.info("해당 문서 조회, docuVo={}",docVo);
		//스크립트 보안 : 꺽쇠 변환
		String title = docVo.getCfTitle();
		title = ConfirmUtility.changeTag(title);
		docVo.setCfTitle(title);
		//1-1. 해당 문서의 양식이름
		DocumentFormVO dfVo = dfService.selectDocFormByFormNo(docVo.getFormNo());
		String dfName = dfVo.getFormName();
				
		//2. 해당 기안자 조회 해서 EmployeeVO 구함(기안자, 부서이름 조회용)
		EmployeeVO writerEmpVo = dService.selectByEmpNo(docVo.getEmpNo());
		logger.info("해당 문서 작성자 조회, eVo={}",writerEmpVo);
		
		//3. cfNo의 결재라인 confirm_line 테이블에서 가져옴 = List<ConfirmLineVO> (*)
		List<ConfirmLineVO> clVoList = clService.selectCfLineByCfNo(cfNo);
		logger.info("해당 문서 결재라인 조회, clVoList.size()={}", clVoList.size());
		
		//4. 연계문서가 있다면 (docuVo.linkCfNo) confirm테이블에서 가져옴= DocumentVO = docuVo2 (cfNo, cfTitle)
		DocumentVO linkDoc = new DocumentVO();
		if(docVo.getLinkCfNo()!=null && !docVo.getLinkCfNo().isEmpty()) {
			linkDoc = dService.selectDocByCfNo(docVo.getLinkCfNo());
			//스크립트 보안 : 꺽쇠 변환
			title = linkDoc.getCfTitle();
			title = ConfirmUtility.changeTag(title);
			linkDoc.setCfTitle(title);
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
			for(CommentVO comm : commVoList) {
				//스크립트보안 : 꺽쇠변환
				String cont = comm.getCommContent();
				cont = ConfirmUtility.changeTag(cont);
				comm.setCommContent(cont);
			}
			logger.info("해당 문서의 의견 리스트, commVoList.size()={}",commVoList.size());
		}
		
		//7. 부서 리스트 추출
		List<DeptVO> deptList = deptService.selectDeptName();
		logger.info("부서리스트 추출결과 deptList.size()={}",deptList.size());
		
		model.addAttribute("docVo", docVo);
		model.addAttribute("dfName",dfName);
		model.addAttribute("writerEmpVo", writerEmpVo);
		model.addAttribute("clVoList", clVoList);
		model.addAttribute("linkDoc", linkDoc);
		model.addAttribute("fileList", fileList);
		model.addAttribute("commVoList", commVoList);
		model.addAttribute("deptList", deptList);
		
		//결재 상태 확인용 상태플래그
		model.addAttribute("CL_AWAIT",ConfirmLineService.CL_AWAIT);
		model.addAttribute("CL_COMPLETE",ConfirmLineService.CL_COMPLETE);
		model.addAttribute("CL_RETURN",ConfirmLineService.CL_RETURN);
		
		return "confirm/detail";
	}
	
	//////////////////////////////////리스트	
	@RequestMapping("/tempsave.do")
	public String tempsave(@ModelAttribute ConfirmSearchVO svo, HttpSession session, Model model) {
		logger.info("임시저장함 보여주기, 파라미터 searchVo={}",svo);
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");		
		
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
		svo.setEmpNo(empVo.getEmpNo());
		logger.info("searchVo 최종값={}", svo);
		
		
		List<DocumentVO> docuList = dService.selectSaveWaitThirdType(svo);
		logger.info("임시저장함 목록 조회 결과, docuList.size()={}",docuList.size());
		List<CfIsReadVO> cirList = new ArrayList<CfIsReadVO>();

		//제목 길이 처리, 꺽쇠 처리, 읽은여부 처리
		CfIsReadVO cirVo = new CfIsReadVO();
		for(DocumentVO imvo : docuList) {
			String str = imvo.getCfTitle();
			
			//스크립트 보안 : 꺽쇠 변환
			String title = ConfirmUtility.changeTag(str);			
			imvo.setCfTitle(title);
			
			// 제목 길이 처리
			title = ConfirmUtility.titleLength(str, 44);
			imvo.setChangeTitle(title);
			
			//읽은여부 docuVo에 세팅 
			cirVo.setCfNo(imvo.getCfNo());
			cirVo.setEmpNo(empVo.getEmpNo()); //임시 프로퍼티 지정
			String isRead = cirService.selectIsReadByCfNo(cirVo);
			imvo.setIsRead(isRead);
		}
		
		DocumentVO dVoForTotal = new DocumentVO();
		dVoForTotal.setCfStatus(svo.getListType());
		dVoForTotal.setEmpNo(svo.getEmpNo());
		int totalRecord = dService.selectSaveWaitAllCntThirdType(dVoForTotal);
		logger.info("임시저장함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		pageInfo.setTotalRecord(totalRecord);		
		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		model.addAttribute("cirList",cirList);
		
		
		return "confirm/tempsave";
	}

	@RequestMapping("/await.do")
	public String await(@ModelAttribute ConfirmSearchVO svo, HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
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
		svo.setCfConfirmer(empVo.getEmpNo());
		svo.setEmpNo(empVo.getEmpNo());
		logger.info("searchVo 최종값={}", svo);
		
		//현재 접속자 사원 번호 세팅
		CfIsReadVO cirVo = new CfIsReadVO();
		cirVo.setEmpNo(empVo.getEmpNo());

		List<DocumentVO> docuList = dService.selectSaveWaitThirdType(svo);
		logger.info("결재대기함 목록 조회 결과, docuList.size()={}",docuList.size());
		
		//이름 넣어주기 + 제목 길이 처리
		for(DocumentVO imvo : docuList) {
			EmployeeVO eVo = dService.selectByEmpNo(imvo.getEmpNo());
			String empName = eVo.getEmpName();
			imvo.setEmpName(empName);

			String str = imvo.getCfTitle();
			
			//스크립트 보안 : 꺽쇠 변환
			String title = ConfirmUtility.changeTag(str);			
			imvo.setCfTitle(title);
			
			// 제목 길이 처리
			title = ConfirmUtility.titleLength(str, 34);
			imvo.setChangeTitle(title);

			//읽은여부 docuVo에 세팅 
			cirVo.setCfNo(imvo.getCfNo());
			String isRead = cirService.selectIsReadByCfNo(cirVo);
			imvo.setIsRead(isRead);
		}
		
		DocumentVO dVoForTotal = new DocumentVO();
		dVoForTotal.setCfStatus(svo.getListType());
		dVoForTotal.setEmpNo(svo.getEmpNo());
		int totalRecord = dService.selectSaveWaitAllCntThirdType(dVoForTotal);
		logger.info("결재대기함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		
		pageInfo.setTotalRecord(totalRecord);		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/await";
	}
	
	@RequestMapping("/complete.do")
	public String complete(@ModelAttribute ConfirmSearchVO svo, HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
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
		svo.setEmpNo(empVo.getEmpNo());
		logger.info("searchVo 최종값={}", svo);
		//현재 접속자 사원 번호 세팅
		CfIsReadVO cirVo = new CfIsReadVO();
		cirVo.setEmpNo(empVo.getEmpNo());

		List<DocumentVO> docuList = dService.selectCompleteOneType(svo);
		logger.info("결재완료함 목록 조회 결과, docuList.size()={}",docuList.size());
		
		//제목 길이 처리
		for(DocumentVO imvo : docuList) {
			String str = imvo.getCfTitle();
			
			//스크립트 보안 : 꺽쇠 변환
			String title = ConfirmUtility.changeTag(str);			
			imvo.setCfTitle(title);
			
			// 제목 길이 처리
			title = ConfirmUtility.titleLength(str, 44);
			imvo.setChangeTitle(title);
			
			//읽은여부 docuVo에 세팅 
			cirVo.setCfNo(imvo.getCfNo());
			String isRead = cirService.selectIsReadByCfNo(cirVo);
			imvo.setIsRead(isRead);
		}

		DocumentVO dVoForTotal = new DocumentVO();
		dVoForTotal.setCfStatus(svo.getListType());
		dVoForTotal.setEmpNo(svo.getEmpNo());
		int totalRecord = dService.selectCompleteAllCntOneType(dVoForTotal);
		logger.info("결재완료함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		
		pageInfo.setTotalRecord(totalRecord);		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/complete";
	}
	
	@RequestMapping("/return.do")
	public String return_get(@ModelAttribute ConfirmSearchVO svo, HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
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
		svo.setEmpNo(empVo.getEmpNo());
		logger.info("searchVo 최종값={}", svo);
		//현재 접속자 사원 번호 세팅
		CfIsReadVO cirVo = new CfIsReadVO();
		cirVo.setEmpNo(empVo.getEmpNo());

		List<DocumentVO> docuList = dService.selectReturnSecondType(svo);
		logger.info("결재반려함 목록 조회 결과, docuList.size()={}",docuList.size());
		
		//제목 길이 처리
		for(DocumentVO imvo : docuList) {
			String str = imvo.getCfTitle();
			
			//스크립트 보안 : 꺽쇠 변환
			String title = ConfirmUtility.changeTag(str);			
			imvo.setCfTitle(title);
			
			// 제목 길이 처리
			title = ConfirmUtility.titleLength(str, 44);
			imvo.setChangeTitle(title);
			
			//읽은여부 docuVo에 세팅 
			cirVo.setCfNo(imvo.getCfNo());
			String isRead = cirService.selectIsReadByCfNo(cirVo);
			imvo.setIsRead(isRead);
		}

		DocumentVO dVoForTotal = new DocumentVO();
		dVoForTotal.setCfStatus(svo.getListType());
		dVoForTotal.setEmpNo(svo.getEmpNo());
		int totalRecord = dService.selectReturnAllCntSecondType(dVoForTotal);
		logger.info("결재반려함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		
		pageInfo.setTotalRecord(totalRecord);		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/return";
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam(required=false) String cfNo, HttpServletRequest request, Model model) {
		logger.info("문서 삭제 처리(임시저장함 문서), 파라미터 cfNo={}",cfNo);
		
		//1. 해당 문서가 파일을 갖고있다면 파일 리스트 수집
		List<ConfirmFileVO> fileList = cfService.selectCfFileByCfNo(cfNo);
		logger.info("파일 리스트 수집 결과 filList.size()={}",fileList.size());
		
		//2. confirm테이블에서 삭제 (cascade로 전부 삭제됨)
		String msg="", url="";
		int cnt = dService.deleteDocuByCfNo(cfNo);
		if(cnt>0) {
			//디비 처리가 완료되었으면 파일도 삭제
			if(fileList!=null && !fileList.isEmpty()) {
				String path = fileUtil.getUploadPath(request, FileUploadUtil.ATTACHFILE);
				for(ConfirmFileVO delfileVo : fileList) {
					File delFile = new File(path, delfileVo.getFileName());
					if(delFile.exists()) {
						boolean bool = delFile.delete();
						logger.info("등록 실패시 파일도 삭제 여부 bool={}",bool);
					}
				}
			}
			msg = "삭제처리 되었습니다.";
			url = "/confirm/tempsave.do";			
		} else {
			msg = "삭제실패";
			url = "/confirm/detail.do?cfNo="+cfNo;
		}//end if
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	//의견부분
	@RequestMapping("/writeComm.do")
	public String writeComm(@ModelAttribute CommentVO commVo, Model model) {
		logger.info("의견 등록 처리, 파라미터 commVo={}",commVo);
		
		int cnt = commService.insertComment(commVo);
		logger.info("의견 등록 처리 결과 cnt={}", cnt);
		
		String msg="", url="/confirm/detail.do?cfNo="+commVo.getCfNo();
		if(cnt>0) {
			msg = "의견이 등록 되었습니다.";
		} else {
			msg = "의견 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteComm.do")
	public String deleteComm(@RequestParam (defaultValue="0") int commNo, 
			@RequestParam (required=false) String cfNo, Model model) {
		logger.info("댓글 삭제 처리, 파라미터 commNo={}",commNo);
		
		int cnt = commService.deleteComment(commNo);
		logger.info("의견 삭제 처리 결과, cnt={}",cnt);
		
		String msg="", url="/confirm/detail.do?cfNo="+cfNo;
		if(cnt>0) {
			msg = "의견이 삭제 되었습니다.";
		} else {
			msg = "의견 삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/editComm.do")
	public String editComm(@ModelAttribute CommentVO commVo, Model model) {
		logger.info("의견 수정 처리, 파라미터 commVo={}",commVo);
		
		int cnt = commService.updateComment(commVo);
		logger.info("의견 수정 처리 결과, cnt={}",cnt);
		
		return "redirect:/confirm/detail.do?cfNo="+commVo.getCfNo()+"#"+commVo.getCommNo();
	}
	
	@RequestMapping("/settingConfirmer.do")
	@ResponseBody
	public ConfirmLineVO settingConfirmer(@RequestParam(defaultValue="0") int empNo) {
		logger.info("ajax요청 - 결재 환경 설정 - 결재 라인 등록 부분 라인 세팅");
		
		ConfirmLineVO clVo = clService.selectConfirmerByEmpNo(empNo);
		
		return clVo;
	}
	
	@RequestMapping("/settingConfirmers.do")
	@ResponseBody
	public List<ConfirmLineVO> settingConfirmers(@RequestParam(defaultValue="0") int saveNo){
		logger.info("ajax요청 - 결재 환경 설정 - 저장된 결재라인 불러와 세팅");
		
		SaveLineVO savelineVo = slService.selectSaveLineBySaveNo(saveNo);
		String confirmers = savelineVo.getSaveConfirmer();
		String[] empNos = confirmers.split(",");
		
		List<ConfirmLineVO> empNoList = new ArrayList<ConfirmLineVO>();
		for(int i=0; i<empNos.length; i++) {
			empNoList.add(clService.selectConfirmerByEmpNo(Integer.parseInt(empNos[i])));
		}
		
		return empNoList;
	}
	
	@RequestMapping("/settingListener.do")
	@ResponseBody
	public List<EmployeeVO> settingListener(@RequestParam(defaultValue="0") int deptNo){
		logger.info("ajax요청 - 참조 발신하기 위한 사원 리스트 불러오기 처리");
		
		List<EmployeeVO> listenerList = dService.selectEmpListByDeptNo(deptNo);
		
		return listenerList;
	}
	
	@RequestMapping("/noConfirm.do")
	public String noConfirm(@RequestParam String cfNo, @RequestParam int empNo, HttpSession session, Model model) {
		//세션 받기
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("결재 반려 처리, 파라미터 cfNo={}, empNo={}", cfNo, empNo);
		
		//0.해당 결재자 결재라인에서 반려로 처리 myConfirmOk(ConfirmLine)
		ConfirmLineVO clVo = new ConfirmLineVO();
		clVo.setLineStat(ConfirmLineService.CL_RETURN);
		clVo.setCfNo(cfNo);
		clVo.setEmpNo(empVo.getEmpNo());
		
		//1. 해당문서 결재반려 update 처리 updateDocStatus(Document)
		DocumentVO dVo = new DocumentVO();
		dVo.setCfNo(cfNo);
		dVo.setCfStatus(DocumentService.CONFIRM_RETURN);
		dVo.setCfConfirmer(0);
		
		//2. 해당 글 기안자 isread 안읽음(N)으로 처리 updateIsReadDoc(CfIsRead)
		CfIsReadVO cirVo = new CfIsReadVO();
		cirVo.setCfNo(cfNo);
		cirVo.setIsRead("N");
		cirVo.setEmpNo(empNo);
		
		//db작업
		int result = dService.noConfirm(dVo, cirVo, clVo);
		String msg="", url="/confirm/await.do";
		if(result>0) {
			msg="결재 반려 처리되었습니다.";
		} else {
			msg="결재 반려 처리 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/yesConfirm.do")
	public String yesConfirm(@RequestParam String cfNo, @RequestParam int empNo, HttpSession session, Model model) {
		//세션 받기
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("결재 승인 처리, 파라미터 cfNo={}, empNo={}", cfNo, empNo);
		
		//0.해당 결재자 결재라인에서 승인로 처리 myConfirmOk(ConfirmLine)
		ConfirmLineVO clVo = new ConfirmLineVO();
		clVo.setLineStat(ConfirmLineService.CL_COMPLETE);
		clVo.setCfNo(cfNo);
		clVo.setEmpNo(empVo.getEmpNo());

		//1. 해당글 결재라인 리스트 받기 / selectCfList(String cfNo)
		List<ConfirmLineVO> cfLineList = clService.selectCfLineByCfNo(cfNo);
		logger.info("해당글 결재라인 추출 결과, cfLineList.size()={}",cfLineList.size());
		
		//2. 다음결재자 추출하기
		int nextConfirmer = 0;
		for(int i=0; i<cfLineList.size(); i++) {
			ConfirmLineVO nextCfVo = cfLineList.get(i);
			String wait = nextCfVo.getLineStat();
			if(wait.equals(ConfirmLineService.CL_AWAIT)) {
				if((i+1)==cfLineList.size()) {
					nextConfirmer = 0;
				} else {
				nextConfirmer = cfLineList.get(i+1).getEmpNo();
				}
				break;
			}
		}
		logger.info("다음 결재자, nextConfirmer={}", nextConfirmer);
		
		//clVo, dVo, cirVo, writer(empNo), confirmer(empVo.getEmpNo)

		//update confirm set cf_Status = #{cfStatus}, cf_confirmer = #{cfConfirmer} where cf_no = #{cfNo}
		DocumentVO dVo = new DocumentVO();
		CfIsReadVO cirVo = new CfIsReadVO();
		if(nextConfirmer == 0) {
			//2. 다음 결재자 없다면
			//-> 해당 문서 다음 결재자를 0으로update(cf_confirmer), 상태를 '결재완료'로 처리 update
			dVo.setCfNo(cfNo);
			dVo.setCfStatus(DocumentService.CONFIRM_COMPLETE);
			dVo.setCfConfirmer(nextConfirmer);
			dVo.setEmpNo(empNo);
			
			//-> isread 테이블에 기안자 상태 안읽음(N)으로 처리 update
			cirVo.setCfNo(cfNo);
			cirVo.setIsRead("N");
			cirVo.setEmpNo(empNo);
		} else {
			//3. 다음 결재자 있다면
			//-> 해당 문서 다음 결재자를 다음 순서로 지정 update(cf_confirmer), 상태를 결재대기로
			dVo.setCfNo(cfNo);
			dVo.setCfStatus(DocumentService.CONFIRM_AWAIT);
			dVo.setCfConfirmer(nextConfirmer);
			dVo.setEmpNo(empNo);
			
			//-> 결재자가 본인이면 isread에 업데이트, 본인이 아니면 다음 결재자 insert
			cirVo.setCfNo(cfNo);
			cirVo.setIsRead("N");
			cirVo.setEmpNo(nextConfirmer);
		}
		
		//db작업
		int result = dService.yesConfirm(dVo, cirVo, clVo, nextConfirmer);
		String msg="", url="/confirm/await.do";
		if(result>0) {
			msg="결재 승인 처리되었습니다.";
		} else {
			msg="결재 승인 처리 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/documentSend.do")
	public String documentSend(@RequestParam String allListener, @RequestParam String cfNo, HttpSession session, Model model) {
		//세션 받기
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("결재 완료 문서 발신 처리, 파라미터 allListener={}",allListener);
				
		//수신자 리스트 생성
		List<ConfirmLineVO> listenerList = new ArrayList<ConfirmLineVO>();
		String[] listeners = allListener.split(",");
		for(int i=0; i<listeners.length;i++) {
			ConfirmLineVO clVo = null;
			if(Integer.parseInt(listeners[i])!=empVo.getEmpNo()) {
				//본인이 아닌 것만 리스트에 넣기
				clVo = new ConfirmLineVO();
				clVo.setCfNo(cfNo);
				clVo.setEmpNo(Integer.parseInt(listeners[i]));
				listenerList.add(clVo);
			}
		}
		logger.info("수신자 인원 수 확인, listenerList.size()={}",listenerList.size());
		
		//db작업
		int cnt = dService.insertSendDoc(listenerList);
		String msg="", url="/confirm/detail.do?cfNo="+cfNo;
		if(cnt>0) {
			msg=cfNo+"번 문서를 "+listenerList.size()+"명에게 참조 발신하였습니다.";
		} else {
			msg="발신 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/postbox.do")
	public String postbox(@ModelAttribute ConfirmSearchVO svo, HttpSession session, Model model) {
		//세션
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
		logger.info("참조 수신함 화면 보여주기, 파라미터 searchVo={}",svo);
		//결재완료함(결재 완료된 문서중 참조수신된 것만 가져오기 위해) 플래그 VO에 입력
		svo.setListType(DocumentService.CONFIRM_COMPLETE);
		
		//paging 처리에 필요한 변수
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setBlockSize(ConfirmUtility.BLOCK_SIZE);
		pageInfo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		pageInfo.setCurrentPage(svo.getCurrentPage());
		
		//searchVo에 값 세팅
		svo.setRecordCountPerPage(ConfirmUtility.RECORD_COUNT_PER_PAGE);
		svo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		svo.setCfConfirmer(empVo.getEmpNo());
		svo.setEmpNo(empVo.getEmpNo());
		logger.info("searchVo 최종값={}", svo);
		
		//현재 접속자 사원 번호 세팅
		CfIsReadVO cirVo = new CfIsReadVO();
		cirVo.setEmpNo(empVo.getEmpNo());

		List<DocumentVO> docuList = dService.selectReferFourType(svo);
		logger.info("참조 수신함 목록 조회 결과, docuList.size()={}",docuList.size());
		
		//이름 넣어주기
		for(DocumentVO imvo : docuList) {
			EmployeeVO eVo = dService.selectByEmpNo(imvo.getEmpNo());
			String empName = eVo.getEmpName();
			imvo.setEmpName(empName);

			String str = imvo.getCfTitle();
			
			//스크립트 보안 : 꺽쇠 변환
			String title = ConfirmUtility.changeTag(str);			
			imvo.setCfTitle(title);
			
			// 제목 길이 처리
			title = ConfirmUtility.titleLength(str, 28);
			imvo.setChangeTitle(title);
			
			//읽은여부 docuVo에 세팅 
			cirVo.setCfNo(imvo.getCfNo());
			String isRead = cirService.selectIsReadByCfNo(cirVo);
			imvo.setIsRead(isRead);
		}
		DocumentVO dVoForTotal = new DocumentVO();
		dVoForTotal.setCfStatus(svo.getListType());
		dVoForTotal.setEmpNo(svo.getEmpNo());
		int totalRecord = dService.selectReferCntAllFourType(dVoForTotal);
		logger.info("참조문서함 문서 개수 조회 결과, totalRecord={}",totalRecord);
		
		pageInfo.setTotalRecord(totalRecord);		
		logger.info("검색어 searchKeyword={}",svo.getSearchKeyword());
		
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("docuList",docuList);
		
		return "confirm/postbox";
	}
}
