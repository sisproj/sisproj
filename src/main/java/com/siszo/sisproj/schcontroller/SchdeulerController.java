package com.siszo.sisproj.schcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.siszo.sisproj.schmodel.SchedulerService;
import com.siszo.sisproj.schmodel.SchedulerVO;

@Controller
@RequestMapping("/scheduler")
public class SchdeulerController {
	
	@Autowired
	private SchedulerService schedulerService;
	
	private static final Logger logger = LoggerFactory.getLogger(SchdeulerController.class);
	
	@RequestMapping(value="/scheduler.do")
	public void scheduler(Model model) {
		List<SchedulerVO> list = schedulerService.schedulerSelectAll();
		logger.info("스케줄화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping(value="/schedulerOK.do")
	public String scheduler_insert(@ModelAttribute SchedulerVO vo, Model model) {
		logger.info("스케줄 삽입 처리, 파라미터 vo={}",vo);
		
		int cnt = schedulerService.schedulerInsert(vo);
		logger.info("등록여부 cnt={}",cnt);
		
		String msg="", url="";
		if(cnt<1)
		{
			msg="등록 실패";
			url="/scheduler/scheduler.do";
		}else {
			msg="등록 성공";
			url="/scheduler/scheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
		
		
	}
	

}
