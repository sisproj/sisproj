package com.siszo.sisproj.message.model;

public interface MessageDAO {
    public int insertMessage(MessageVO messageVO);
    public int insertMessageRec(MessageRecVO messageRecVO);
}
