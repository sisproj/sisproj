package com.siszo.sisproj.message.controller;


import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.message.model.MessageRecVO;
import com.siszo.sisproj.message.model.MessageSearchVO;
import com.siszo.sisproj.message.model.MessageService;
import com.siszo.sisproj.message.model.MessageVO;
import com.siszo.sisproj.organization.model.OrganizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/message/message.do")
    public String message_get(HttpSession session, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();

        MessageSearchVO messageSearchVO = new MessageSearchVO();
        messageSearchVO.setEmpNo(empNo);

        int recUnreadCnt = messageService.selectUnreadCount(empNo);
        int recCnt = messageService.selectTotalMsgRecCount(messageSearchVO);
        int sendCnt = messageService.selectTotalMsgSendCount(messageSearchVO);
        int recImpCnt = messageService.selectTotalMsgRecImpCount(messageSearchVO);
        int recRecycleCnt = messageService.selectTotalMsgRecycleCount(messageSearchVO);
        int sendRecycleCnt = messageService.selectTotalMsgRecycleSendCount(messageSearchVO);

        List<MessageVO> recMsgList = messageService.selectRecencyRecMsg(empNo);
        List<MessageVO> sendMsgList = messageService.selectRecencySendMsg(empNo);


        model.addAttribute("recCnt", recCnt);
        model.addAttribute("recUnreadCnt", recUnreadCnt);
        model.addAttribute("sendCnt", sendCnt);
        model.addAttribute("recImpCnt", recImpCnt);
        model.addAttribute("recycleCnt", recRecycleCnt + sendRecycleCnt);

        model.addAttribute("recMsgList", recMsgList);
        model.addAttribute("sendMsgList", sendMsgList);

        return "message/messageMain";
    }

    @RequestMapping("/message/messageBanner.do")
    public String messageBanner(HttpSession session, Model model) {

        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        List<MessageVO> recMsgList = messageService.selectRecencyRecMsg(empNo);
        model.addAttribute("recMsgList", recMsgList);

        return "mainbanner/messageList";
    }


    @RequestMapping(value = "/message/write.do", method = RequestMethod.GET)
    public String messageWrite_get(Model model) {
        logger.info("쪽지 보내기 화면보여주기 messageWrite_get");

        List<DeptVO> deptList = deptService.selectDeptName();
        logger.info("부서명 조회결과 deptList.size()={}", deptList.size());

        List<EmployeeVO> empList = orgService.selectEmp();
        logger.info("부서별 사원리스트 조회 결과 empList.size()={}", empList.size());

        model.addAttribute("deptList", deptList);
        model.addAttribute("empList", empList);

        return "message/messageWrite";
    }

    @RequestMapping(value = "/message/reply.do", method = RequestMethod.GET)
    public String messageReply_get(@RequestParam(defaultValue = "0") int sendempNo, Model model) {
        logger.info("쪽지 답변 보내기 화면보여주기 messageReply_get");

        EmployeeVO employeeVO = employeeService.selectEmployeeByNo(sendempNo);
        model.addAttribute("employeeVO", employeeVO);
        return "message/messageReply";
    }

    @RequestMapping(value = "/message/write.do", method = RequestMethod.POST)
    public @ResponseBody void messageWrite_post(@ModelAttribute MessageVO messageVO,
                                  @RequestParam String choiceEmpId) {
        logger.info("쪽지 보내기 messageWrite_post(), 파라미터 messageVO={}, choiceEmpId={}", messageVO, choiceEmpId);

        int cnt = messageService.insertMessage(messageVO);
        if (cnt > 0) {
            String[] empNoArr = choiceEmpId.split(",");
            for (int i = 0; i < empNoArr.length; i++) {
                MessageRecVO messageRecVO = new MessageRecVO();
                messageRecVO.setEmpNo(Integer.parseInt(empNoArr[i]));
                messageService.insertMessageRec(messageRecVO);
            }
        }
    }

    @RequestMapping(value = "/message/receive.do")
    public String messageReceive_get(HttpSession session, @ModelAttribute MessageSearchVO messageSearchVO, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("받은 쪽지함 들어옴 messageReceive_get(), 접속 ID = {}", empNo);

        //Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
        pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        pagingInfo.setCurrentPage(messageSearchVO.getCurrentPage());

        //SearchVO에 값 셋팅
        messageSearchVO.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        messageSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
        messageSearchVO.setEmpNo(empNo);

        logger.info("messageSearchVO 입력값 : messageSearchVO={}", messageSearchVO);

        List<MessageVO> msgList = messageService.selectRecMsgByEmpNo(messageSearchVO);
        logger.info("{} msgList 조회결과 list.size={}", empNo, msgList.size());

        int totalRecord = messageService.selectTotalMsgRecCount(messageSearchVO);
        logger.info("selectTotalMsgRecCount = {}", totalRecord);
        pagingInfo.setTotalRecord(totalRecord);

        model.addAttribute("msgList", msgList);
        model.addAttribute("pagingInfo", pagingInfo);

        return "message/messageReceive";
    }

    @RequestMapping(value = "/message/detail", method = RequestMethod.GET)
    public String messageDetail_get(HttpSession session, @RequestParam(defaultValue = "0") int recNo, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("상세보기 들어옴 messageDetail_get(), 입력값 recNo={}, empNo={}", recNo, empNo);
        int result = messageService.updateReadFlag(recNo);
        if (result > 0) {
            MessageVO messageVO = messageService.selectRecMsgByRecNo(recNo);
            model.addAttribute("messageVO", messageVO);
        }
        return "message/messageDetail";
    }

    @RequestMapping(value = "/message/sendDetail")
    public String sendDetail(HttpSession session, @RequestParam(defaultValue = "0") int msgNo, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("보낸쪽지 상세보기 들어옴 messageDetail_get(), 입력값 msgNo={}, empNo={}", msgNo, empNo);
        MessageVO messageVO = messageService.selectSendMsgByMsgNo(msgNo);
        model.addAttribute("messageVO", messageVO);
        return "message/messageSendDetail";
    }

    @RequestMapping(value = "/message/importantUpdate")
    public @ResponseBody
    String messageImportantUpdate(@RequestParam String recNoStr) {
        logger.info("중요쪽지 설정  messageImportant() : recNoStr={}", recNoStr);

        String[] recNoArr = recNoStr.split(",");
        for (int i = 0; i < recNoArr.length; i++) {
            int recNo = Integer.parseInt(recNoArr[i]);
            logger.info("chkArr 값 :  recNo={}", recNo);
            int result = messageService.updateImpMsg(recNo);
            logger.info("update 결과 :  result ={}", result);
        }
        return "OK";
    }

    @RequestMapping(value = "/message/delMsgUndo")
    public @ResponseBody
    String delMsgUndo(@RequestParam String recNoStr) {
        logger.info("쪽지 되돌리기 delMsgUndo() : recNoStr={}", recNoStr);

        String[] recNoArr = recNoStr.split(",");
        for (int i = 0; i < recNoArr.length; i++) {
            int recNo = Integer.parseInt(recNoArr[i]);
            logger.info("chkArr 값 :  recNo={}", recNo);
            int result = messageService.delMsgUndo(recNo);
            logger.info("update 결과 :  result ={}", result);
        }
        return "OK";
    }

    @RequestMapping(value = "/message/delete")
    public @ResponseBody
    String messageDelete(@RequestParam String recNoStr) {
        logger.info("선택 쪽지 휴지통으로 이동 messageDelete() : recNoStr={}", recNoStr);
        String[] recNoArr = recNoStr.split(",");
        for (int i = 0; i < recNoArr.length; i++) {
            int recNo = Integer.parseInt(recNoArr[i]);
            logger.info("chkArr 값 :  recNo={}", recNo);
            int result = messageService.updateDelMsg(recNo);
            logger.info("update 결과 :  result ={}", result);
        }
        return "OK";
    }

    @RequestMapping(value = "/message/deleteMsg")
    public @ResponseBody
    String messageRealDelete(@RequestParam String recNoStr) {
        logger.info("선택 쪽지 삭제 messageRealDelete() : recNoStr={}", recNoStr);

        String[] recNoArr = recNoStr.split(",");
        for (int i = 0; i < recNoArr.length; i++) {
            int recNo = Integer.parseInt(recNoArr[i]);
            logger.info("chkArr 값 :  recNo={}", recNo);
            int result = messageService.updateRealDelMsg(recNo);
            logger.info("update 결과 :  result ={}", result);
        }
        return "OK";
    }

    @RequestMapping(value = "/message/deleteSendMsg")
    public @ResponseBody
    String sendMessageRealDelete(@RequestParam String msgNoStr) {
        logger.info("선택 쪽지 삭제 sendMessageRealDelete() : recNoStr={}", msgNoStr);
        String[] msgNoArr = msgNoStr.split(",");
        for (int i = 0; i < msgNoArr .length; i++) {
            int msgNo = Integer.parseInt(msgNoArr [i]);
            int result = messageService.updateRealDelSendMsg(msgNo);
            logger.info("쪽지 휴지통으로 보내기 결과 result={}", result);
        }
        return "OK";
    }

    @RequestMapping(value = "/message/sendDelete")
    public @ResponseBody
    String messageSendDelete(@RequestParam String msgNoStr) {
        logger.info("선택 쪽지 휴지통으로 이동 messageDelete() : msgNoStr={}", msgNoStr);

        String[] msgNoArr = msgNoStr.split(",");
        for (int i = 0; i < msgNoArr .length; i++) {
            int msgNo = Integer.parseInt(msgNoArr [i]);
            int result = messageService.updateSendDelMsg(msgNo);
            logger.info("쪽지 휴지통으로 보내기 결과 result={}", result);
        }
        return "OK";
    }

    @RequestMapping(value = "/message/important")
    public String messageImportant(HttpSession session, @ModelAttribute MessageSearchVO messageSearchVO, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("받은 쪽지함 들어옴 messageImportant(), 접속 ID = {}", empNo);

        //Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
        pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        pagingInfo.setCurrentPage(messageSearchVO.getCurrentPage());

        //SearchVO에 값 셋팅
        messageSearchVO.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        messageSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
        messageSearchVO.setEmpNo(empNo);

        logger.info("messageSearchVO 입력값 : messageSearchVO={}", messageSearchVO);

        List<MessageVO> msgList = messageService.selectRecMsgByEmpNoImp(messageSearchVO);
        logger.info("{} msgList 조회결과 list.size={}", empNo, msgList.size());

        int totalRecord = messageService.selectTotalMsgRecImpCount(messageSearchVO);
        logger.info("selectTotalMsgRecCount = {}", totalRecord);
        pagingInfo.setTotalRecord(totalRecord);

        model.addAttribute("msgList", msgList);
        model.addAttribute("pagingInfo", pagingInfo);

        return "message/messageImportant";
    }

    @RequestMapping(value = "/message/send.do")
    public String messageSend(HttpSession session, @ModelAttribute MessageSearchVO messageSearchVO, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("보낸 쪽지함 들어옴 messageReceive_get(), 접속 ID = {}", empNo);

        //Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
        pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        pagingInfo.setCurrentPage(messageSearchVO.getCurrentPage());

        //SearchVO에 값 셋팅
        messageSearchVO.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        messageSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
        messageSearchVO.setEmpNo(empNo);

        logger.info("messageSearchVO 입력값 : messageSearchVO={}", messageSearchVO);

        List<MessageVO> msgList = messageService.selectSendMsgByEmpNo(messageSearchVO);
        logger.info("{} msgList 조회결과 list.size={}", empNo, msgList.size());

        int totalRecord = messageService.selectTotalMsgSendCount(messageSearchVO);
        logger.info("selectTotalMsgRecCount = {}", totalRecord);
        pagingInfo.setTotalRecord(totalRecord);

        model.addAttribute("msgList", msgList);
        model.addAttribute("pagingInfo", pagingInfo);

        return "message/messageSend";
    }

    @RequestMapping(value = "/message/recycleBin.do")
    public String messageRecycleBin(HttpSession session, @ModelAttribute MessageSearchVO messageSearchVO, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("휴지통 들어옴 messageReceive_get(), 접속 ID = {}", empNo);

        //Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
        pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        pagingInfo.setCurrentPage(messageSearchVO.getCurrentPage());

        //SearchVO에 값 셋팅
        messageSearchVO.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        messageSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
        messageSearchVO.setEmpNo(empNo);

        logger.info("messageSearchVO 입력값 : messageSearchVO={}", messageSearchVO);

        List<MessageVO> msgList = messageService.selectRecycleMsgByEmpNo(messageSearchVO);
        logger.info("{} msgList 조회결과 list.size={}", empNo, msgList.size());

        int totalRecord = messageService.selectTotalMsgRecycleCount(messageSearchVO);
        logger.info("selectTotalMsgRecCount = {}", totalRecord);
        pagingInfo.setTotalRecord(totalRecord);

        model.addAttribute("msgList", msgList);
        model.addAttribute("pagingInfo", pagingInfo);

        return "message/messageRecycleBin";
    }

    @RequestMapping(value = "/message/recycleBinSend.do")
    public String messageRecycleBinSend(HttpSession session, @ModelAttribute MessageSearchVO messageSearchVO, Model model) {
        EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
        int empNo = empVo.getEmpNo();
        logger.info("보낸 쪽지함 들어옴 messageReceive_get(), 접속 ID = {}", empNo);

        //Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
        pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        pagingInfo.setCurrentPage(messageSearchVO.getCurrentPage());

        //SearchVO에 값 셋팅
        messageSearchVO.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
        messageSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
        messageSearchVO.setEmpNo(empNo);

        logger.info("messageSearchVO 입력값 : messageSearchVO={}", messageSearchVO);

        List<MessageVO> msgList = messageService.selectRecycleSendMsgByEmpNo(messageSearchVO);
        logger.info("{} msgList 조회결과 list.size={}", empNo, msgList.size());

        int totalRecord = messageService.selectTotalMsgRecycleSendCount(messageSearchVO);
        logger.info("selectTotalMsgRecycleSendCount = {}", totalRecord);
        pagingInfo.setTotalRecord(totalRecord);

        model.addAttribute("msgList", msgList);
        model.addAttribute("pagingInfo", pagingInfo);

        return "message/messageRecycleBinSend";
    }
}
