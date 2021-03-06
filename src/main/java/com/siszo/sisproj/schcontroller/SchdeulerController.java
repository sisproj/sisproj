package com.siszo.sisproj.schcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.style.DefaultValueStyler;
import org.springframework.scheduling.commonj.ScheduledTimerListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.SchedulerUtility;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.schmodel.SchedulerService;
import com.siszo.sisproj.schmodel.SchedulerVO;
import com.siszo.sisproj.schmodel.TschedulerVO;

@Controller
@RequestMapping("/scheduler")
public class SchdeulerController {

	@Autowired
	private SchedulerService schedulerService;

	private static final Logger logger = LoggerFactory.getLogger(SchdeulerController.class);


	@RequestMapping(value="/scheduler.do")
	public String scheduler(@RequestParam (defaultValue="0")int empNo, HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		empNo=empVo.getEmpNo();

		List<SchedulerVO> list = schedulerService.schedulerSelectAll(empNo);
		logger.info("스케줄화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
		return "scheduler/scheduler";
	}

	private SchedulerUtility schUtil = new SchedulerUtility();
	@RequestMapping(value="/schedulerOK.do")
	public String scheduler_insert(@ModelAttribute SchedulerVO vo,HttpSession session ,Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		vo.setEmpNo(empNo);
		logger.info("스케줄 삽입 처리, 파라미터 vo={}",vo);
		vo.setPschStart(schUtil.ChangeDate(vo.getPschStart()));
		vo.setPschEnd(schUtil.ChangeDate(vo.getPschEnd()));
		int cnt = schedulerService.schedulerInsert(vo);
		logger.info("등록여부 cnt={}",cnt);

		String msg="", url="";
		if(cnt>0)
		{
			msg="등록 성공";
			url="/scheduler/scheduler.do";
		}else {
			msg="등록 실패";
			url="/scheduler/scheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}

	@RequestMapping(value="/schedulerDelete.do")
	public String scheduler_delete(@RequestParam String pschNo, Model model){
		logger.info("스케줄 삭제처리, 파라미터 pschNo={}",pschNo);

		int cnt = schedulerService.schedulerDelete(pschNo);
		String msg="", url="";
		if(cnt>0) {
			msg="삭제처리 되었습니다.";
			url="/scheduler/scheduler.do";
		}else {
			msg="삭제 실패했습니다.";
			url="/scheduler/scheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}


	@RequestMapping(value="/schedulerEdit.do", method = RequestMethod.POST)
	public String scheduler_edit(@ModelAttribute SchedulerVO vo, Model model) {
		logger.info("스케줄 시간 수정처리, 파라미터 vo={}", vo);

		vo.setPschStart(schUtil.ChangeDate(vo.getPschStart()));
		vo.setPschEnd(schUtil.ChangeDate(vo.getPschEnd()));

		int cnt = schedulerService.schedulerUpdate(vo);
		String msg="", url="";
		if(cnt>0) {
			msg="수정처리 되었습니다.";
			url="/scheduler/scheduler.do";
		}else {
			msg="수정 실패했습니다.";
			url="/scheduler/scheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";

	}


	@RequestMapping(value="/schedulerEditContent.do")
	public String scheduler_editContent(@ModelAttribute SchedulerVO vo, Model model) {
		logger.info("스케줄 내용 수정처리, 파라미터 vo={}", vo);

		vo.setPschStart(schUtil.ChangeDate(vo.getPschStart()));
		vo.setPschEnd(schUtil.ChangeDate(vo.getPschEnd()));

		int cnt = schedulerService.schedulerContentUpdate(vo);
		logger.info("스케줄 내용 수정결과 cnt={}", cnt);
		String msg="", url="";
		if(cnt>0) {
			msg="수정처리 되었습니다.";
			url="/scheduler/scheduler.do";
		}else {
			msg="수정 실패했습니다.";
			url="/scheduler/scheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";

	}

	
	




	@RequestMapping(value="/tscheduler.do")
	public String tscheduler(@RequestParam (defaultValue="0")int deptNo, HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		deptNo=empVo.getDeptNo();

		List<TschedulerVO> list = schedulerService.tschedulerSelectAll(deptNo);
		logger.info("스케줄화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
		return "scheduler/tscheduler";
	}
	@RequestMapping(value="/tschedulerOK.do")
	public String tscheduler_insert(@ModelAttribute TschedulerVO vo,HttpSession session ,Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int deptNo=empVo.getDeptNo();
		vo.setDeptNo(deptNo);
		logger.info("스케줄 삽입 처리, 파라미터 vo={}",vo);
		vo.setTschStart(schUtil.ChangeDate(vo.getTschStart()));
		vo.setTschEnd(schUtil.ChangeDate(vo.getTschEnd()));
		int cnt = schedulerService.tschedulerInsert(vo);
		logger.info("등록여부 cnt={}",cnt);

		String msg="", url="";
		if(cnt>0)
		{
			msg="등록 성공";
			url="/scheduler/tscheduler.do";
		}else {
			msg="등록 실패";
			url="/scheduler/tscheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}

	@RequestMapping(value="/tschedulerDelete.do")
	public String tscheduler_delete(@RequestParam String tschNo, Model model){
		logger.info("스케줄 삭제처리, 파라미터 tschNo={}",tschNo);

		int cnt = schedulerService.tschedulerDelete(tschNo);
		String msg="", url="";
		if(cnt>0) {
			msg="삭제처리 되었습니다.";
			url="/scheduler/tscheduler.do";
		}else {
			msg="삭제 실패했습니다.";
			url="/scheduler/tscheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}


	@RequestMapping(value="/tschedulerEdit.do", method = RequestMethod.POST)
	public String tscheduler_edit(@ModelAttribute TschedulerVO vo, Model model) {
		logger.info("스케줄 시간 수정처리, 파라미터 vo={}", vo);

		vo.setTschStart(schUtil.ChangeDate(vo.getTschStart()));
		vo.setTschEnd(schUtil.ChangeDate(vo.getTschEnd()));

		int cnt = schedulerService.tschedulerUpdate(vo);
		String msg="", url="";
		if(cnt>0) {
			msg="수정처리 되었습니다.";
			url="/scheduler/tscheduler.do";
		}else {
			msg="수정 실패했습니다.";
			url="/scheduler/tscheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";

	}


	@RequestMapping(value="/tschedulerEditContent.do")
	public String tscheduler_editContent(@ModelAttribute TschedulerVO vo, Model model) {
		logger.info("스케줄 내용 수정처리, 파라미터 vo={}", vo);

		vo.setTschStart(schUtil.ChangeDate(vo.getTschStart()));
		vo.setTschEnd(schUtil.ChangeDate(vo.getTschEnd()));

		int cnt = schedulerService.tschedulerContentUpdate(vo);
		logger.info("스케줄 내용 수정결과 cnt={}", cnt);
		String msg="", url="";
		if(cnt>0) {
			msg="수정처리 되었습니다.";
			url="/scheduler/tscheduler.do";
		}else {
			msg="수정 실패했습니다.";
			url="/scheduler/tscheduler.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";

	}
	
	
	@RequestMapping("/sideScheduler.do")
	public void sideScheduler(@RequestParam (defaultValue="0")int empNo, HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		empNo=empVo.getEmpNo();

		List<SchedulerVO> list = schedulerService.schedulerSelectAll(empNo);
		logger.info("스케줄화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
	}
	
	
}




