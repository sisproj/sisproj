/*package com.siszo.sisproj.notice.controller;

import java.util.List;

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

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.SearchVO;
import com.siszo.sisproj.common.Utility;
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
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
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
		
		int empNo=(Integer)session.getAttribute("empNo");
		int empNo=20170001;
		noticeVo.setEmpNo(empNo);
		
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
		logger.info("공지사항 리스트");
		
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
	
	@RequestMapping("/noticeUpdate.do")
	public void noticeUpdate() {
		logger.info("공지사항 글 수정하기");
	}
	
	@RequestMapping("/noticeDetail.do")
	public void noticeDetail() {
		logger.info("공지사항 상세보기");
	}
	
	
}


*/