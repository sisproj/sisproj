package com.siszo.sisproj.message.controller;


import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.message.model.MessageRecVO;
import com.siszo.sisproj.message.model.MessageService;
import com.siszo.sisproj.message.model.MessageVO;
import com.siszo.sisproj.organization.model.OrganizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MessageController {
    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
    @Autowired
    private DeptService deptService;
    @Autowired
    private OrganizationService orgService;
    @Autowired
    private MessageService messageService;

    @RequestMapping("/message/message.do")
    public String message_get() {
        return "message/messageMain";
    }

    @RequestMapping(value = "/message/messageWrite.do", method = RequestMethod.GET)
    public String messageWrite_get(@RequestParam(defaultValue = "0") int deptNo, Model model) {
        logger.info("쪽지 보내기 화면보여주기 messageWrite_get");
        logger.info("조직도 부서명 리스트 and 부서별 사원리스트, 파라미터 deptNo={}", deptNo);

        List<DeptVO> deptList = deptService.selectDeptName();
        logger.info("부서명 조회결과 deptList.size()={}", deptList.size());

        List<EmployeeVO> empList = orgService.selectEmp();
        logger.info("부서별 사원리스트 조회 결과 empList.size()={}", empList.size());

        model.addAttribute("deptList", deptList);
        model.addAttribute("empList", empList);

        return "message/messageWrite";
    }

    @RequestMapping(value = "/message/messageWrite.do", method = RequestMethod.POST)
    public void messageWrite_post(@ModelAttribute MessageVO messageVO,
                                  @RequestParam String empNo) {
        logger.info("쪽지 보내기 messageWrite_post(), 파라미터 messageVO={}, empNo={}", messageVO, empNo);

        int cnt = messageService.insertMessage(messageVO);

        if (cnt > 0) {
            String[] empNoArr = empNo.split(",");
            for (int i = 0; i < empNoArr.length; i++) {
                MessageRecVO messageRecVO = new MessageRecVO();
                messageRecVO.setEmpNo(Integer.parseInt(empNoArr[i]));
                messageService.insertMessageRec(messageRecVO);
            }
        }

    }
}
