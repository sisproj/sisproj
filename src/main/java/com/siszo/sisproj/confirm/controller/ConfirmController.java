package com.siszo.sisproj.confirm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.SearchVO;
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
	
	@RequestMapping("/tempsaveOk.do")
	public String tempsaveOk(@ModelAttribute DocumentVO docuVo, @RequestParam String allConfirmers, HttpServletRequest request, Model model) {
		logger.info("새 결재 진행 - 결재 문서 작성 임시 저장 처리, 파라미터 docuVo={}", docuVo);
		docuVo.setCfStatus(DocumentService.TEMPORARY_SAVE);
		//파일 업로드 처리
		List<Map<String, Object>> fileList = null;
		String fileName = "", fileOriName="";
		long fileSize=0;
		List<ConfirmFileVO> uploadFileList = new ArrayList<ConfirmFileVO>(); 
		
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
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("파일 처리 이후 docuVo 내용, docuVo={}",docuVo);
		
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
		
		
		String msg="", url="";
		//문서 insert
		int cnt = dService.insertConfirmDoc(docuVo);
		logger.info("문서 insert 처리 결과 cnt={}",cnt);			
		
		if(cnt>0) {
			//문서 등록이 처리 되었다면 결재자 및 해당 파일도 db저장
			int res = cfService.multiInsertCfFile(uploadFileList);
			int cfRes = clService.insertConfirmers(clVoList);
			if(uploadFileList.size()==res && cfRes>0) {
				msg = "임시 저장함에 저장 되었습니다.";
				url = "/confirm/tempsave.do";
			} else {
				msg = "저장 실패!";
				url = "/confirm/write.do?formNo="+docuVo.getFormNo();
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
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
	public String confirmOk(@ModelAttribute DocumentVO docuVo, @RequestParam String allConfirmers, HttpServletRequest request, Model model) {
		logger.info("새 결재 진행 - 결재 문서 작성 본인 결재 후 상신 처리, 파라미터 docuVo={}", docuVo);
		docuVo.setCfStatus(DocumentService.CONFIRM_AWAIT);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = null;
		String fileName = "", fileOriName="";
		long fileSize=0;
		List<ConfirmFileVO> uploadFileList = new ArrayList<ConfirmFileVO>();
		
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
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//결재자
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
		
		String msg="", url="";
		//문서 insert
		int cnt = dService.insertConfirmDoc(docuVo);
		logger.info("문서 insert 처리 결과 cnt={}",cnt);			
		
		if(cnt>0) {
			//문서 등록이 처리 되었다면 결재자 및 해당 파일도 db저장
			int res = cfService.multiInsertCfFile(uploadFileList);
			int cfRes = clService.insertConfirmers(clVoList);
			
			ConfirmLineVO myConfirm = new ConfirmLineVO();
			myConfirm.setCfNo(docuVo.getCfNo());
			myConfirm.setLineStat(ConfirmLineService.CL_COMPLETE);
			myConfirm.setEmpNo(empNo);
			
			int Imconfirm = clService.myConfirmOk(myConfirm);
			
			if(uploadFileList.size()==res && cfRes>0 && Imconfirm>0) {
				msg = "결재 후 상신 되었습니다.";
				url = "/confirm/await.do";
			} else {
				msg = "저장 실패!";
				url = "/confirm/write.do?formNo="+docuVo.getFormNo();
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/await.do")
	public String await() {
		logger.info("결재대기함 화면 보여주기");
		return "confirm/await";
	}
	
	@RequestMapping("/complete.do")
	public String complete() {
		logger.info("결재완료함 화면 보여주기");
		return "confirm/complete";
	}
	
	@RequestMapping("/detail.do")
	public String detail() {
		logger.info("상세페이지 - detail.jsp 보여주기");
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
	public String return_get() {
		logger.info("결재 반려함 보여주기");
		return "confirm/return";
	}

	@RequestMapping("/edit.do")
	public String edit() {
		logger.info("문서 수정화면 보여주기");
		return "confirm/edit";
	}
}
