package com.siszo.sisproj.addrbook.addrgroup.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupService;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/addrBook")
public class AddrGroupController {
	private static final Logger logger=LoggerFactory.getLogger(AddrGroupController.class);
	
	@Autowired
	private AddrGroupService addrGroupService;
	
	@RequestMapping("/addrGroupList.do")
	public String group_List(HttpSession session, Model model) {
		EmployeeVO empVo=(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		
		logger.info("주소록 그룹명 보여주기, 파라미터 empNo={}",empNo);
		
		List<AddrGroupVO> addrGroupList=addrGroupService.selectGroupName(empNo);
		logger.info("주소록 그룹명 조회 결과, addrGroupList.size()={}", addrGroupList.size());
		
		model.addAttribute("addrGroupList", addrGroupList);
		
		return "addrBook/addrGroupList";
	}
	
	@RequestMapping("/groupList.do")
	@ResponseBody
	public List<AddrGroupVO> groupList(@RequestParam(defaultValue="0")int empNo) {
		logger.info("그룹명 리스트 보여주기, 파라미터 empNo={}", empNo);
		
		List<AddrGroupVO> list=addrGroupService.selectGroupName(empNo);
		logger.info("그룹명 리스트 조회 결과, list.size()={}", list.size());
		
		return list;
	}
	
	@RequestMapping("/newGroup.do")
	public String insertGroup(@ModelAttribute AddrGroupVO groupVo,HttpSession session, Model model) {
		EmployeeVO empVo=(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		groupVo.setEmpNo(empNo);
		logger.info("그룹 생성하기 파라미터 groupVo={}",groupVo);
		
		int cnt=0;
		if(groupVo.getGroupName()!=null && !groupVo.getGroupName().isEmpty()) {
			cnt=addrGroupService.insertGroup(groupVo);			
		}
		String msg="",url="/addrBook/addrBookList.do";
		if(cnt>0) {
			msg="그룹생성 성공";
		}else {
			msg="그룹생성 실패";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteGroup.do")
	public String deleteGroup(@RequestParam(defaultValue="0") int groupNo,HttpSession session, Model model) {
		EmployeeVO empVo=(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		logger.info("그룹 삭제 파라미터, groupNo={}, empNo={}", groupNo, empNo);
		
		int count=addrGroupService.countGroup(empNo);
		
		int cnt=0;
		String msg="",url="/addrBook/addrBookList.do";
		if(count>1) {
			cnt=addrGroupService.deleteGroup(groupNo);
			logger.info("그룹 삭제 결과, cnt={}",cnt);
			if(cnt>0) {
				msg="그룹 삭제 성공";
			}else {
				msg="그룹 삭제 실패";			
			}			
		}else {
			msg="그룹은 최소 한개 있어야 합니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
