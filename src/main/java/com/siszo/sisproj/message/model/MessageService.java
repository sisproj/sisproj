package com.siszo.sisproj.message.model;

import java.util.List;

public interface MessageService {
    public int insertMessage(MessageVO messageVO);

    public int insertMessageRec(MessageRecVO messageRecVO);

    public List<MessageVO> selectRecMsgByEmpNo(MessageSearchVO searchVO);

    public MessageVO selectRecMsgByRecNo(int recNo);

    public int selectTotalMsgRecCount(MessageSearchVO messageSearchVO);

    public int updateImpMsg(int recNo);

    public int updateReadFlag(int recNo);

    public List<MessageVO> selectRecMsgByEmpNoImp(MessageSearchVO messageSearchVO);

    public int selectTotalMsgRecImpCount(MessageSearchVO messageSearchVO);

    public List<MessageVO> selectSendMsgByEmpNo(MessageSearchVO messageSearchVO);

    public int selectTotalMsgSendCount(MessageSearchVO messageSearchVO);

    public int updateDelMsg(int recNo);

    public List<MessageVO> selectRecycleMsgByEmpNo(MessageSearchVO messageSearchVO);

    public int selectTotalMsgRecycleCount(MessageSearchVO messageSearchVO);
}
