package com.siszo.sisproj.addrbook.addrbook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookListVO;
import com.siszo.sisproj.addrbook.addrbook.model.AddrBookService;
import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupService;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupVO;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;

@Controller
@RequestMapping("/addrBook")
public class AddrBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddrBookController.class);
	
	@Autowired
	private AddrBookService addrBookService;
	@Autowired
	private AddrGroupService groupService;
	
	@RequestMapping(value="/addrBookList.do", method=RequestMethod.GET)
	public String list(Model model) {
		logger.info("개인주소록 리스트 조회하기");
		
		List<AddrBookVO> addrList=addrBookService.selectAddrBookAll();
		logger.info("개인 주소록 리스트 조회 결과, addrBookList.size()={}", addrList.size());
		
		List<AddrGroupVO> groupList=groupService.selectGroupName();
		logger.info("개인주소록 그룹명 조회결과, groupList.size()={}", groupList.size());
		
		model.addAttribute("addrList", addrList);
		model.addAttribute("groupList", groupList);
		
		return "addrBook/addrBookList";
	}
	
	@RequestMapping(value="/addrBookWrite.do", method=RequestMethod.GET)
	public void write_get() {
		logger.info("연락처 등록 화면 보여주기");
	}
	
	@RequestMapping(value="/addrBookWrite.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute AddrBookVO vo,
		HttpSession session, Model model) {
		int empNo=(Integer)session.getAttribute("empNo");
		logger.info("연락처 등록 하기, 파라미터 vo={}, empNo={}",vo, empNo);
		
		vo.setEmpNo(empNo);
		int cnt=addrBookService.insertAddrBook(vo);
		
		String msg="",url="/addrBook/addrBookWrite.do";
		if(cnt>0) {
			msg="연락처 등록 성공";
			url="/addrBook/addrBookList.do";
		}else {
			msg="연락처 등록 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/addrBookTrash.do", method=RequestMethod.GET)
	public void trash_get() {
		logger.info("휴지통 화면 보여주기");
	}
	
	@RequestMapping(value="/addrBookTrash.do", method=RequestMethod.POST)
	public void trash() {
		logger.info("휴지통 비우기");
	}
	
	@RequestMapping(value="/goToTrash.do", method=RequestMethod.POST)
	public String goToTrash(@ModelAttribute AddrBookListVO addrBookListvo, Model model) {
		logger.info("삭제버튼 클릭시 휴지통으로 이동");
		
		List<AddrBookVO> list=addrBookListvo.getAddrItems();
		
		int cnt=addrBookService.updateIsDelYMulti(list);
		logger.info("휴지통 이동 결과, cnt={}", cnt);
		
		String msg="",url="/addrBook/addrBookList.do";
		if(cnt>0) {
			msg="휴지통으로 이동 성공";
		}else{
			msg="휴지통으로 이동 실패";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
