package com.siszo.sisproj.messenger.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessengerController {
    private static final Logger logger = LoggerFactory.getLogger(MessengerController.class);


    @RequestMapping("/messenger/messenger.do")
    public String messenger_get() {
        return "messenger/messengerMain";
    }

    @RequestMapping(value = "/messenger/messengerChat.do", method = RequestMethod.POST)
    public String messengerChat_post(@RequestParam String chatKey, Model model) {
        model.addAttribute("chatKey", chatKey);
        return "messenger/messengerChat";
    }

    @RequestMapping(value = "/messenger/messengerStart.do", method = RequestMethod.GET)
    public String messengerStart_get() {
        return "messenger/messengerStart";
    }
}
