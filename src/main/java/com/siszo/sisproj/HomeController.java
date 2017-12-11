package com.siszo.sisproj;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        System.out.println("수정 테스트");


        return "home";
    }
    
    @RequestMapping(value ="/login.do")
    public String login() {
    	logger.info("로그인 화면 보여주기");
    	return "login";
    }
    
    @RequestMapping("/inc/top.do")
    public String top() {
    	logger.info("top 보여주기");
    	return "inc/top";
    }
    
    @RequestMapping("/inc/bottom.do")
    public String bottom() {
    	logger.info("bottom 보여주기");
    	return "inc/bottom";
    }
}
