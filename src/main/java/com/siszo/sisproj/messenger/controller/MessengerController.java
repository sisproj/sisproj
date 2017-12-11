package com.siszo.sisproj.messenger.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessengerController {
    private static final Logger logger = LoggerFactory.getLogger(MessengerController.class);


    @RequestMapping("/messenger/messenger.do")
    public String messenger_get() {
        return "messenger/messenger";
    }



}
