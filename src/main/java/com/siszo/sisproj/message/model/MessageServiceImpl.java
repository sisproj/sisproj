package com.siszo.sisproj.message.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
