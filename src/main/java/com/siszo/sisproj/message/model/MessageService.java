package com.siszo.sisproj.message.model;

import com.siszo.sisproj.common.MessageSearchVO;

import java.util.List;

public interface MessageService {
    public int insertMessage(MessageVO messageVO);

    public int insertMessageRec(MessageRecVO messageRecVO);

    public List<MessageVO> selectRecMsgByEmpNo(MessageSearchVO searchVO);
}
