package com.siszo.sisproj;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.common.ConfirmUtility;
import com.siszo.sisproj.confirm.model.DocumentService;
import com.siszo.sisproj.confirm.model.DocumentVO;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.notice.model.NoticeService;
import com.siszo.sisproj.notice.model.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Autowired
    private DocumentService dService;
    @Autowired
    private NoticeService nService;
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/home.do")
    public String home(HttpSession session, Model model) {
        logger.info("홈화면 보여주기");
        return "home";
    }
    
    @RequestMapping(value ="/login.do")
    public String login() {
    	logger.info("로그인 화면 보여주기");
    	return "login";
    }
    
    @RequestMapping("/mainbanner.do")
    public String mainbanner() {
    	return "mainbanner/mainbanner";
    }

    @RequestMapping("/mainbanner_m.do")
    public String mainbanner_m() {
    	return "mainbanner/mainbanner_m";
    }
    
    @RequestMapping("/clock.do")
    public String clock() {
    	return "mainbanner/clock1";
    }
    
    @RequestMapping("/awaitList.do")
    public String mainConfirm(HttpSession session, Model model) {
    	EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
    	//메인 테이블 세팅 결재 대기함
		//결재대기함 플래그 VO에 입력
		ConfirmSearchVO csVo = new ConfirmSearchVO();
		//searchVo에 값 세팅
		csVo.setEmpNo(empVo.getEmpNo());
		csVo.setRecordCountPerPage(5);
		csVo.setFirstRecordIndex(0);
		//결재대기함 플래그 VO에 입력
		csVo.setListType(DocumentService.CONFIRM_AWAIT);
		logger.info("searchVo 최종값={}", csVo);
		
		List<DocumentVO> awaitList = dService.selectSaveWaitThirdType(csVo);
		logger.info("결재대기함 목록 조회 결과, awaitList.size()={}",awaitList.size());

		//제목 길이 처리, 꺽쇠 처리, 이름 세팅
		for(DocumentVO imvo : awaitList) {			
			String str = imvo.getCfTitle();
			String title = ConfirmUtility.titleLength(str, 16);
			//스크립트 보안 : 꺽쇠 변환
			title = ConfirmUtility.changeTag(title);			
			imvo.setCfTitle(title);
			
			EmployeeVO eVo = dService.selectByEmpNo(imvo.getEmpNo());
			String empName = eVo.getEmpName();
			imvo.setEmpName(empName);
		}
		List<DocumentVO> list = new ArrayList<DocumentVO>();
		if(awaitList.size()>5) {
			for(int i=0; i<6; i++) {
				DocumentVO dVo = awaitList.get(i);
				
				list.add(dVo);
			} 			
		} else {
			list = awaitList;
		}
		
		model.addAttribute("awaitList",list);
		
		return "mainbanner/awaitList";
    }
    
    @RequestMapping("/mainNotice.do")
    public String mainNotice(Model model) {
    	logger.info("메인 공지사항 테이블");
    	
    	List<NoticeVO> list = nService.selectAllNotice();
    	List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
    	//리스트 개수 9개이상이라면 9개로 바꾸기
    	if(list.size()>5) {
        	for(int i=0; i<6; i++) {
        		NoticeVO nVo =  list.get(i);
        		
				String str = nVo.getNotiTitle();
				String title = ConfirmUtility.titleLength(str, 28);
				//스크립트 보안 : 꺽쇠 변환
				title = ConfirmUtility.changeTag(title);			
				nVo.setNotiTitle(title);
				
				noticeList.add(nVo);     
        	}
    	} else {
    		noticeList = list;
    	}
    	logger.info("메인공지 리스트 사이즈noticeList.size={}",noticeList.size());
    	
    	model.addAttribute("noticeList",noticeList);
    	
    	return "mainbanner/noticeList";
    }
}
