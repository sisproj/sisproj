package com.siszo.sisproj.message.model;

import com.siszo.sisproj.common.MessageSearchVO;
import com.siszo.sisproj.common.SearchVO;
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
}
