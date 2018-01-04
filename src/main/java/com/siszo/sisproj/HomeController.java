package com.siszo.sisproj;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.employee.model.EmployeeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/home.do")
    public String home(HttpSession session, Model model) {
    	EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
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
    
    @RequestMapping("/clock.do")
    public String clock() {
    	return "mainbanner/clock1";
    }
}
