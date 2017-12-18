package com.siszo.sisproj.addrbook.addrgroup.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupService;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupVO;

@Controller
@RequestMapping("/addrBook")
public class AddrGroupController {
	private static final Logger logger=LoggerFactory.getLogger(AddrGroupController.class);
	
	@Autowired
	private AddrGroupService addrGroupService;
	
	@RequestMapping("/addrGroupList.do")
	public String group_List(Model model) {
		logger.info("주소록 그룹명 보여주기");
		
		List<AddrGroupVO> addrGroupList=addrGroupService.selectGroupName();
		logger.info("주소록 그룹명 조회 결과, addrGroupList.size()={}", addrGroupList.size());
		
		model.addAttribute("addrGroupList", addrGroupList);
		
		return "addrBook/addrGroupList";
	}
}
