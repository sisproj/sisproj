package com.siszo.sisproj.addrbook.addrbook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookListVO;
import com.siszo.sisproj.addrbook.addrbook.model.AddrBookService;
import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupService;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupVO;
import com.siszo.sisproj.common.AddrSearchVO;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.SearchVO;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/addrBook")
public class AddrBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddrBookController.class);
	
	@Autowired
	private AddrBookService addrBookService;
	@Autowired
	private AddrGroupService groupService;
	
	@RequestMapping("/addrBookList.do")
	public String list(@ModelAttribute AddrSearchVO searchVo,HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		logger.info("###################empVO={}",empVo);
		searchVo.setEmpNo(empNo);
		
		logger.info("개인주소록 리스트 조회하기, searchVo={}", searchVo);		
		
		//Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				
		//SearchVo에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", searchVo);
		
		List<AddrGroupVO> groupList=groupService.selectGroupName(empNo);
		logger.info("개인주소록 그룹명 조회결과, groupList.size()={}", groupList.size());

		List<AddrBookVO> addrList=addrBookService.selectAddrBookAll(searchVo);
		logger.info("개인 주소록 리스트 조회 결과, addrBookList.size()={}", addrList.size());		
		
		int totalRecord = addrBookService.selectTotalRecordCountN(searchVo);
		logger.info("글 전체 개수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("레코드 test{}",pagingInfo);
		
		model.addAttribute("addrList", addrList);
		model.addAttribute("groupList", groupList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "addrBook/addrBookList";
	}
	
	@RequestMapping(value="/addrBookWrite.do", method=RequestMethod.GET)
	public void write_get() {
		logger.info("연락처 등록 화면 보여주기");
	}
	
	@RequestMapping(value="/addrBookWrite.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute AddrBookVO vo,
		HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
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
	
	@RequestMapping("/addrBookTrash.do")
	public String trash_get(@ModelAttribute AddrSearchVO searchVo,HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		
		searchVo.setEmpNo(empNo);
		logger.info("휴지통 화면 보여주기, 파라미터 searchVo={}", searchVo);		
		
		//Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("레코드 test{}",pagingInfo);
				
		//SearchVo에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", searchVo);
		
		List<AddrBookVO> addrList=addrBookService.selectAddrBookIsDelY(searchVo);
		logger.info("휴지통 조회결과, addrList.size()={}", addrList.size());

		int totalRecord = addrBookService.selectTotalRecordCountY(searchVo);
		logger.info("글 전체 개수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("레코드 test{}",pagingInfo);
		
		model.addAttribute("addrList", addrList);
		model.addAttribute("pagingInfo", pagingInfo);		
		
		return "addrBook/addrBookTrash";
	}
	
	@RequestMapping(value="/addrBookClear.do", method=RequestMethod.POST)
	public String trash(HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		
		logger.info("휴지통 비우기");
		
		int cnt=addrBookService.deleteAddrBook(empNo);
		
		String msg="",url="/addrBook/addrBookTrash.do";
		if(cnt>0) {
			msg="휴지통 비우기 성공";
		}else {
			msg="휴지통 비우기 실패";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/goToTrash.do", method=RequestMethod.POST)
	public String goToTrash(@ModelAttribute AddrBookListVO addrBookListVo,HttpSession session, Model model) {
		logger.info("삭제버튼 클릭시 휴지통으로 이동, 파라미터 addrBookListVo={}",addrBookListVo);
		
		List<AddrBookVO> list=addrBookListVo.getAddrItems();
		
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
	
	@RequestMapping(value="/restore.do", method=RequestMethod.POST)
	public String restore(@ModelAttribute AddrBookListVO addrBookListVo, Model model) {
		logger.info("복원 버튼 클릭시 휴지통의 리스트를 주소록으로 이동, 파라미터 addrBookListVo={}",addrBookListVo);
		
		List<AddrBookVO> list=addrBookListVo.getAddrItems();
		
		int cnt=addrBookService.updateIsDelNMulti(list);
		logger.info("주소록 복원 결과, cnt={}", cnt);
		
		String msg="",url="/addrBook/addrBookTrash.do";
		if(cnt>0) {
			msg="주소록으로 복원 성공";
		}else{
			msg="주소록으로 복원 실패";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
	}
	
	@RequestMapping("/pageCount.do")
	@ResponseBody
	public List<AddrBookVO> pageCount(@ModelAttribute AddrSearchVO searchVo, 
			@RequestParam(defaultValue="10") int count){
		logger.info("페이지수 정하기, 파라미터 searchVo={}, count={}", searchVo, count);
		
		searchVo.setRecordCountPerPage(count);
		logger.info("searchVo에 count값 설정 후 searchVo={}", searchVo);
		
		List<AddrBookVO> list=addrBookService.selectAddrBookAll(searchVo);
		logger.info("조회 결과 list.size()={}", list.size());
		
		return list;
	}
	
}
