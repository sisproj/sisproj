package com.siszo.sisproj.notice.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.SearchVO;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.notice.model.NoticeService;
import com.siszo.sisproj.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger
		= LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping(value="/adm/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 글쓰기 보여주기");
		
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite_post(HttpServletRequest request,
			@ModelAttribute NoticeVO noticeVo,
			HttpSession session,
			Model model) {
		logger.info("공지사항 글쓰기 처리-파라미터, vo={}", noticeVo);
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();

		noticeVo.setEmpNo(empNo);
		
		//파일 업로드 처리
		List<Map<String, Object>> list=null;
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			list=fileUtil.fileupload(request, FileUploadUtil.PDS_UPLOAD_NOTI);
			
			logger.info("공지사항 글쓰기 list={}", list);
			//파일 업로드 한 경우
			if(list!=null && !list.isEmpty()) {
				for(Map<String, Object> map : list) {
					originalFileName=(String) map.get("originalFileName");
					fileName=(String) map.get("fileName");
					fileSize=(Long) map.get("fileSize");
				}//for
				
				logger.info("공지사항 글쓰기 fileName={}", fileName);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//db작업
		noticeVo.setNotiFilename(fileName);
		noticeVo.setNotiOfilename(originalFileName);
		noticeVo.setNotiFilesize(fileSize);
		
		int cnt = noticeService.insertNotice(noticeVo);
		logger.info("공지사항 글쓰기 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="공지사항이 등록되었습니다.";
			url="/notice/noticeList.do";
		}else {
			msg="글 등록 실패하였습니다.";
			url="/notice/noticeWrite.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";	
	}
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공지사항 리스트, 파라미터 searchVo={}", searchVo);
		
		//Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				
		//SearchVo에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", searchVo);
		
		List<NoticeVO> list =noticeService.selectAll(searchVo);
		logger.info("글목록 결과, list.size()={}", list.size());
		
		int totalRecord = noticeService.selectTotalRecordCount(searchVo);
		logger.info("글 전체 개수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue="0") int notiNo,
			Model model) {
		logger.info("조회수 증가, 파라미터 notiNo={}", notiNo);
		
		if(notiNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "common/message";
		}
		
		int cnt = noticeService.updateReadCount(notiNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/notice/noticeDetail.do?notiNo="+notiNo;
	}
	
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue="0") int notiNo,
			HttpServletRequest request,	ModelMap model) {
		logger.info("상세보기 파라미터 notiNo={}", notiNo);
		
		String msg="", url="";
		if(notiNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "common/message";
		}
		
		NoticeVO vo =noticeService.selectByNo(notiNo);
		logger.info("상세보기 결과, vo={}", vo);
		
		String content=vo.getNotiContent();
		if(content!=null && !content.isEmpty()) {
			content=content.replace("\r\n", "<br>");
			vo.setNotiContent(content);
		}
		
		String fileInfo="", downInfo="";
		String fileName=vo.getNotiFilename();
		if(fileName!=null && !fileName.isEmpty()) {
			fileInfo=Utility.getFileInfo(vo.getNotiOfilename(), 
					vo.getNotiFilesize(), request);
			
			downInfo="다운 : "+vo.getNotiDowncnt();
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("downInfo", downInfo);
		
		return "notice/noticeDetail";
	}
	
	
	@RequestMapping(value="/adm/noticeUpdate.do", method=RequestMethod.GET)
	public String noticeUpdate_get(@RequestParam(defaultValue="0") int notiNo,
			HttpServletRequest request,
			ModelMap model) {
		logger.info("수정화면 조회 파라미터 no={}", notiNo);
		
		if(notiNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "common/message";
		}
		
		NoticeVO vo =noticeService.selectByNo(notiNo);
		logger.info("수정화면 조회 결과, vo={}", vo);
		
		String content=vo.getNotiContent();
		if(content!=null && !content.isEmpty()) {
			content=content.replace("\r\n", "<br>");
			vo.setNotiContent(content);
		}
		
		String fileInfo="";
		if(vo.getNotiFilename()!=null && !vo.getNotiFilename().isEmpty()) {
			fileInfo=Utility.getFileInfo(vo.getNotiOfilename(), 
						vo.getNotiFilesize(),request);
		}
		
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("vo", vo);
		
		return "notice/noticeUpdate";
	}
	
	@RequestMapping(value="/noticeUpdate.do", method=RequestMethod.POST)
	public String noticeUpdate_post(@ModelAttribute NoticeVO vo,
			@RequestParam String oldFileName,
			HttpServletRequest request,	Model model) {
		logger.info("글수정 처리-파라미터, vo={}, oldFileName={}", 
				vo, oldFileName);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList=null;
		String fileName="", originalFileName="";
		long fileSize=0;
				
		//db작업
		String msg="";
		String url="/notice/noticeUpdate.do?notiNo="+vo.getNotiNo();	
		
		try {
			fileList=fileUtil.fileupload(request, FileUploadUtil.PDS_UPLOAD_NOTI);
			for(Map<String, Object> map : fileList) {
				originalFileName=(String) map.get("originalFileName");
				fileName=(String) map.get("fileName");
				fileSize=(Long) map.get("fileSize");
				
				vo.setNotiOfilename(originalFileName);
				vo.setNotiFilename(fileName);
				vo.setNotiFilesize(fileSize);
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}			
		
		int cnt =noticeService.updateNotice(vo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="글수정되었습니다.";
			url="/notice/noticeDetail.do?notiNo="+vo.getNotiNo();
			
			//파일을 새로 첨부한 경우, 기존파일이 존재한다면 삭제
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUtil.getUploadPath(request, FileUploadUtil.PDS_UPLOAD_NOTI);
					File delFile = new File(path, oldFileName);
					if(delFile.exists()) {
						boolean bool=delFile.delete();
						logger.info("기존 파일 삭제여부 bool={}", bool);
					}
				}
			}//if				
		}else {
			msg="글수정 실패";							
		}
		
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam int notiNo, @ModelAttribute NoticeVO vo,
			HttpServletRequest request,	Model model) {
		
		logger.info("Delete VO : NoticeVO ={}", vo);
		logger.info("삭제 화면 파라미터, notiNo=", notiNo);
		
		int cnt = noticeService.deleteNotice(notiNo);
		logger.info("삭제 처리 파라미터, cnt=", cnt);
		
		//기존 파일이 첨부된 경우 파일 삭제
		if(vo.getNotiFilename()!=null && !vo.getNotiFilename().isEmpty()) {
			String path=fileUtil.getUploadPath(request, FileUploadUtil.PDS_UPLOAD_NOTI);
			File file = new File(path, vo.getNotiFilename());
			if(file.exists()) {
				boolean bool =file.delete();
				logger.info("기존파일 삭제여부:{}", bool);
			}
		}//if
		
		return "redirect:/notice/noticeList.do";
		
	}
	
	@RequestMapping("/download.do")
	public ModelAndView download(@RequestParam(defaultValue="0") int notiNo, 
			@RequestParam String fileName,
			HttpServletRequest request) {
		logger.info("다운로드수 증가, 파라미터 no={}, fileName={}", notiNo, fileName);
				
		//다운로드 수 증가시키기
		int cnt = noticeService.updateDownCount(notiNo);
		logger.info("다운로드수 증가, 결과 cnt={}", cnt);
		
		//map에 다운로드할 파일 객체를 저장해서 ModelAndView에 저장한 후 리턴
		Map<String, Object> map = new HashMap<String, Object>();
		
		String path=fileUtil.getUploadPath(request, FileUploadUtil.PDS_UPLOAD_NOTI);
		File file = new File(path, fileName);
		
		map.put("myfile", file);
		
		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("downloadViewNotice", map);
		
		return mav;		
	}
	
	
	
	
	
}


