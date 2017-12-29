package com.siszo.sisproj.message.model;

import com.siszo.sisproj.common.MessageSearchVO;
import com.siszo.sisproj.common.SearchVO;

import java.util.List;

public interface MessageDAO {
    public int insertMessage(MessageVO messageVO);
    public int insertMessageRec(MessageRecVO messageRecVO);

    public List<MessageVO> selectRecMsgByEmpNo(MessageSearchVO messageSearchVO);
}
