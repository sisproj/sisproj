package com.siszo.sisproj.message.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDAO messageDAO;

    @Override
    public int insertMessage(MessageVO messageVO) {
        return messageDAO.insertMessage(messageVO);
    }

    @Override
    public int insertMessageRec(MessageRecVO messageRecVO) {
        return messageDAO.insertMessageRec(messageRecVO);
    }

    @Override
    public List<MessageVO> selectRecMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return messageDAO.selectRecMsgByEmpNo(messageSearchVO);
    }

    @Override
    public MessageVO selectRecMsgByRecNo(int recNo) {
        return messageDAO.selectRecMsgByRecNo(recNo);
    }

    @Override
    public int selectTotalMsgRecCount(MessageSearchVO messageSearchVO) {
        return messageDAO.selectTotalMsgRecCount(messageSearchVO);
    }

    @Override
    public int updateImpMsg(int recNo) {
        return messageDAO.updateImpMsg(recNo);
    }

    @Override
    public int updateReadFlag(int recNo) {
        return messageDAO.updateReadFlag(recNo);
    }

    @Override
    public List<MessageVO> selectRecMsgByEmpNoImp(MessageSearchVO messageSearchVO) {
        return messageDAO.selectRecMsgByEmpNoImp(messageSearchVO);
    }

    @Override
    public int selectTotalMsgRecImpCount(MessageSearchVO messageSearchVO) {
        return messageDAO.selectTotalMsgRecImpCount(messageSearchVO);
    }

    @Override
    public List<MessageVO> selectSendMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return messageDAO.selectSendMsgByEmpNo(messageSearchVO);
    }

    @Override
    public int selectTotalMsgSendCount(MessageSearchVO messageSearchVO) {
        return messageDAO.selectTotalMsgSendCount(messageSearchVO);
    }

    @Override
    public int updateDelMsg(int recNo) {
        return messageDAO.updateDelMsg(recNo);
    }

    @Override
    public List<MessageVO> selectRecycleMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return messageDAO.selectRecycleMsgByEmpNo(messageSearchVO);
    }

    @Override
    public int selectTotalMsgRecycleCount(MessageSearchVO messageSearchVO) {
        return messageDAO.selectTotalMsgRecycleCount(messageSearchVO);
    }

    @Override
    public int delMsgUndo(int recNo) {
        return messageDAO.delMsgUndo(recNo);
    }

    @Override
    public MessageVO selectSendMsgByMsgNo(int msgNo) {
        return messageDAO.selectSendMsgByMsgNo(msgNo);
    }

    @Override
    public int updateSendDelMsg(int msgNo) {
        return messageDAO.updateSendDelMsg(msgNo);
    }

    @Override
    public List<MessageVO> selectRecycleSendMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return messageDAO.selectRecycleSendMsgByEmpNo(messageSearchVO);
    }

    @Override
    public int selectTotalMsgRecycleSendCount(MessageSearchVO messageSearchVO) {
        return messageDAO.selectTotalMsgRecycleSendCount(messageSearchVO);
    }

    @Override
    public int updateRealDelMsg(int recNo) {
        return messageDAO.updateRealDelMsg(recNo);
    }

    @Override
    public int updateRealDelSendMsg(int recNo) {
        return messageDAO.updateRealDelSendMsg(recNo);
    }

    @Override
    public int selectUnreadCount(int empNo) {
        return messageDAO.selectUnreadCount(empNo);
    }

    @Override
    public List<MessageVO> selectRecencyRecMsg(int empNo) {
        return messageDAO.selectRecencyRecMsg(empNo);
    }

    @Override
    public List<MessageVO> selectRecencySendMsg(int empNo) {
        return messageDAO.selectRecencySendMsg(empNo);
    }

    @Override
    public int delSendMsgUndo(int msgNo) {
        return messageDAO.delSendMsgUndo(msgNo);
    }

}
