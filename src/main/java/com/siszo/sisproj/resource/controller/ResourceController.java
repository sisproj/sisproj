package com.siszo.sisproj.resource.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.resource.model.ResourceService;
import com.siszo.sisproj.resource.model.ResourceVO;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);
	
	@Autowired
	private ResourceService resourceService;
	
	@RequestMapping("/resource.do")
	public void resourceMainView(Model model) {
		List<ResourceVO>list =resourceService.resourceAllselect();
		
		model.addAttribute("list",list);
	}
	
}
