package com.siszo.sisproj.webhard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.confirm.common.ConfirmUtility;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.webhard.board.model.WebhardBoardService;
import com.siszo.sisproj.webhard.board.model.WebhardBoardVO;
import com.siszo.sisproj.webhard.comm.model.WebhardCommentService;
import com.siszo.sisproj.webhard.comm.model.WebhardCommentVO;
import com.siszo.sisproj.webhard.common.WebhardSearchVO;
import com.siszo.sisproj.webhard.model.WebhardService;
import com.siszo.sisproj.webhard.model.WebhardVO;

@Controller
@RequestMapping("/webhard")
public class WebhardController {
	private static final Logger logger = LoggerFactory.getLogger(WebhardController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	@Autowired
	private WebhardService wService;
	@Autowired
	private WebhardBoardService wbService;
	@Autowired
	private WebhardCommentService wcService;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		logger.info("웹하드 메인 화면 보여주기");
		
		List<WebhardVO> list = wService.selectWebhard();
		logger.info("업로드된 파일 조회 결과 list.size()={}",list.size());
		for(WebhardVO wVo : list) {
			System.out.println("wVo => "+wVo);
		}
		
		model.addAttribute("list",list);
		
		return "webhard/main";
	}
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public int upFile(HttpServletRequest request, HttpSession session) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("ajax방식 - 웹하드 파일 업로드");
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = null;
		String fileName="", fileOriName="";
		long fileSize=0;
		List<WebhardVO> uploadFileList = new ArrayList<WebhardVO>();
		boolean fileResult = true;
		int result = 0;
		try {
			fileList = fileUtil.fileupload(request, FileUploadUtil.WEBHARD);
			//파일 업로드 성공시
			if(fileList!=null && !fileList.isEmpty()) {
				logger.info("파일 개수 fileList.size()={}",fileList.size());
				for(Map<String, Object> map : fileList) {
					fileOriName = (String) map.get("originalFileName");
					fileName = (String) map.get("fileName");
					fileSize = (Long) map.get("fileSize");
					
					WebhardVO wVo = new WebhardVO();
					wVo.setFileName(fileName);
					wVo.setFileOriName(fileOriName);
					wVo.setFileSize(fileSize);
					wVo.setEmpNo(empVo.getEmpNo());
					
					uploadFileList.add(wVo);
				}
				
				result = wService.insertWebhard(uploadFileList);
				logger.info("웹하드 파일 업로드 결과 result={}", result);
			}
		} catch (IllegalStateException e) {
			fileResult=false;
			e.printStackTrace();
		} catch (IOException e) {
			fileResult=false;
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/download.do")
	public ModelAndView download(@RequestParam String fileName, HttpServletRequest request) {
		logger.info("다운로드 처리, fileName={}",fileName);
		
		//map에 다운로드할 파일 객체를 저장해서 ModelAndView에 저장한 후 리턴
		Map<String, Object> map = new HashMap<String, Object>();
		
		String path=fileUtil.getUploadPath(request, FileUploadUtil.WEBHARD);
		File file = new File(path, fileName);
		
		map.put("myfile", file);
		
		ModelAndView mav = new ModelAndView("webhardDownloadView", map);
		
		return mav;		
	}
	
	@RequestMapping("/deleteItem.do")
	@ResponseBody
	public int deleteItem(@RequestParam int fileNo, HttpSession session) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("파일 삭제 처리, 파라미터 fileNo={}",fileNo);
		int cnt=0;
		WebhardVO wvo = wService.selectWebhardByFileNo(fileNo);
		if(wvo.getEmpNo() == empVo.getEmpNo() || empVo.getEmpLev().equals("관리자")) {
			cnt = wService.deleteWebhard(fileNo);			
		}
		logger.info("파일 삭제처리 결과 cnt={}",cnt);
		return cnt;
	}
	
	@RequestMapping("/fileInfo.do")
	@ResponseBody
	public WebhardVO fileInfo(@RequestParam int fileNo) {
		logger.info("파일 상세정보 처리, fileNo={}",fileNo);
		
		WebhardVO wvo = wService.selectWebhardByFileNo(fileNo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		wvo.setRegdate(sdf.format(wvo.getFileRegdate()));
		
		return wvo;
	}
	
	@RequestMapping("/requireList.do")
	public String requireList(@ModelAttribute WebhardSearchVO webSearchVo, Model model) {
		logger.info("요청 게시판  화면 보여주기");
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setBlockSize(WebhardService.BLOCK_SIZE);
		pageInfo.setRecordCountPerPage(WebhardService.RECORD_COUNT_PER_PAGE);
		pageInfo.setCurrentPage(webSearchVo.getCurrentPage());
		
		webSearchVo.setRecordCountPerPage(WebhardService.RECORD_COUNT_PER_PAGE);
		webSearchVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());

		logger.info("최종 webSearchVo={}",webSearchVo);
		
		List<WebhardBoardVO> webBoardList = wbService.selectWebBoardList(webSearchVo);
		logger.info("요청 게시판 리스트 수집 결과 webBoardList.size()={}",webBoardList.size());
		
		//댓글 개수 넣어주기
		for(WebhardBoardVO wbVo : webBoardList) {
			int commCnt = wcService.webCommCnt(wbVo.getWebNo());
			wbVo.setCommCnt(commCnt);
		}
		
		int totalRecord = wbService.cntWebBoardList(webSearchVo);
		pageInfo.setTotalRecord(totalRecord);
		for(WebhardBoardVO wbVo : webBoardList) {
			wbVo.setWebTitle(ConfirmUtility.changeTag(wbVo.getWebTitle()));
		}
		
		model.addAttribute("webBoardList",webBoardList);
		model.addAttribute("pageInfo",pageInfo);
		
		return "webhard/requireList";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public void write_get() {
		logger.info("요청 글 쓰기 화면 보여주기");
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write_post(@ModelAttribute WebhardBoardVO wbVo, HttpSession session, Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("요청 글 쓰기 등록 처리, 파라미터 wbVo={}",wbVo);
		wbVo.setEmpNo(empVo.getEmpNo());
		
		int cnt = wbService.insertWebBoard(wbVo);
		logger.info("요청 글 쓰기 등록 처리 결과 cnt={}",cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="등록 되었습니다.";
			url="/webhard/detail.do?webNo="+wbVo.getWebNo();
		} else {
			msg="등록 실패";
			url="/webhard/write.do";			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam int webNo, Model model) {
		logger.info("요청 글 상세 보기");
		
		WebhardBoardVO wbVo = wbService.selectWebBoardByWebNo(webNo);
		logger.info("요청 글 상세보기 처리 결과  wbVo={}",wbVo);
		
		//해당 글 댓글 수집
		List<WebhardCommentVO> commVoList = wcService.selectWebComment(webNo);
		logger.info("해당 글 댓글 수집 결과 commVoList.size", commVoList.size());
		
		wbVo.setWebTitle(ConfirmUtility.changeTag(wbVo.getWebTitle()));
		
		model.addAttribute("wbVo",wbVo);
		model.addAttribute("commVoList",commVoList);
		
		return "webhard/detail";
	}
	
	@RequestMapping(value = "/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam int webNo, Model model) {
		logger.info("요청 글 수정 하기 화면 보여주기");
		
		WebhardBoardVO wbVo = wbService.selectWebBoardByWebNo(webNo);
		logger.info("해당 글 수집 처리 결과  wbVo={}",wbVo);
		
		model.addAttribute("wbVo",wbVo);
		
		return "webhard/edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute WebhardBoardVO wbVo, Model model) {
		logger.info("요청글 수정 등록 처리 파라미터 wbVo={}",wbVo);
		
		int cnt = wbService.updateWebBoard(wbVo);
		logger.info("요청글 수정 등록 처리 결과 cnt={}",cnt);
		String msg="", url="";
		if(cnt>0) {
			msg="수정 등록 되었습니다.";
			url="/webhard/detail.do?webNo="+wbVo.getWebNo();
		} else {
			msg="수정 실패";
			url="/webhard/edit.do?webNo="+wbVo.getWebNo();			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam int webNo, Model model) {
		logger.info("요청 글 삭제 처리, 파라미터");
		
		int cnt = wbService.deleteWebBoard(webNo);
		logger.info("요청 글 삭제 처리 결과, cnt={}",cnt);
		String msg="", url="";
		if(cnt>0) {
			msg="삭제 되었습니다.";
			url="/webhard/requireList.do";
		} else {
			msg="삭제 실패";
			url="/webhard/detail.do?webNo="+webNo;			
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/writeComm.do")
	public String writeComm(@ModelAttribute WebhardCommentVO wcVo, HttpSession session, Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		wcVo.setEmpNo(empVo.getEmpNo());
		logger.info("웹하드 보드 댓글 등록, 파라미터 wcVo={}", wcVo);
		
		int cnt = wcService.insertWebComment(wcVo);
		logger.info("웹하드 보드 댓글 등록 결과, cnt={}",cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="댓글 등록 되었습니다.";
			url="/webhard/detail.do?webNo="+wcVo.getWebNo()+"#"+wcVo.getCommNo();
		} else {
			msg="댓글 등록 실패";
			url="/webhard/detail.do?webNo="+wcVo.getWebNo();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/editComm.do")
	public String editComm(@ModelAttribute WebhardCommentVO wcVo, Model model) {
		logger.info("웹하드 보드 댓글 수정, 파라미터 wcVo={}",wcVo);
		
		int cnt = wcService.updateWebComment(wcVo);
		logger.info("웹하드 보드 댓글 수정 결과, cnt={}",cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="댓글 수정 등록 되었습니다.";
			url="/webhard/detail.do?webNo="+wcVo.getWebNo()+"#"+wcVo.getCommNo();
		} else {
			msg="댓글 수정 등록 실패";
			url="/webhard/detail.do?webNo="+wcVo.getWebNo();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteComm.do")
	public String deleteComm(@RequestParam int commNo, @RequestParam int webNo, Model model) {
		logger.info("웹하드 보드 댓글 삭제, 파라미터 commNo={}", commNo);
		
		int cnt = wcService.deleteWebComment(commNo);
		logger.info("웹하드 보드 댓글 삭제 결과, cnt", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="댓글이 삭제 되었습니다.";
			url="/webhard/detail.do?webNo="+webNo;
		} else {
			msg="댓글 수정 등록 실패";
			url="/webhard/detail.do?webNo="+webNo;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
