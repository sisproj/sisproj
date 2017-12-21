package com.siszo.sisproj.messenger.controller;

import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.organization.model.OrganizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MessengerController {
    private static final Logger logger = LoggerFactory.getLogger(MessengerController.class);

    @Autowired
    private DeptService deptService;
    @Autowired
    private OrganizationService orgService;


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
    public String messengerStart_get(@RequestParam(defaultValue = "0") int deptNo, Model model) {
        logger.info("조직도 부서명 리스트 and 부서별 사원리스트, 파라미터 deptNo={}", deptNo);

        List<DeptVO> deptList = deptService.selectDeptName();
        logger.info("부서명 조회결과 deptList.size()={}", deptList.size());

        List<EmployeeVO> empList = orgService.selectEmp();
        logger.info("부서별 사원리스트 조회 결과 empList.size()={}", empList.size());

        model.addAttribute("deptList", deptList);
        model.addAttribute("empList", empList);

        return "messenger/messengerStart";
    }


}
