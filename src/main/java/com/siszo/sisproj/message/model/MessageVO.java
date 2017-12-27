package com.siszo.sisproj.message.model;

import java.sql.Timestamp;

public class MessageVO {
    private int msgNo;
    private String msgTitle;
    private String msgContent;
    private String msgImpflag;
    private Timestamp msgRegdate;
    private int sendempNo;

    public MessageVO() {
    }

    public MessageVO(int msgNo, String msgTitle, String msgContent, String msgImpflag, Timestamp msgRegdate, int sendempNo) {
        this.msgNo = msgNo;
        this.msgTitle = msgTitle;
        this.msgContent = msgContent;
        this.msgImpflag = msgImpflag;
        this.msgRegdate = msgRegdate;
        this.sendempNo = sendempNo;
    }

    public int getMsgNo() {
        return msgNo;
    }

    public void setMsgNo(int msgNo) {
        this.msgNo = msgNo;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getMsgImpflag() {
        return msgImpflag;
    }

    public void setMsgImpflag(String msgImpflag) {
        this.msgImpflag = msgImpflag;
    }

    public Timestamp getMsgRegdate() {
        return msgRegdate;
    }

    public void setMsgRegdate(Timestamp msgRegdate) {
        this.msgRegdate = msgRegdate;
    }

    public int getSendempNo() {
        return sendempNo;
    }

    public void setSendempNo(int sendempNo) {
        this.sendempNo = sendempNo;
    }

    @Override
    public String toString() {
        return "MessageVO{" +
                "msgNo=" + msgNo +
                ", msgTitle='" + msgTitle + '\'' +
                ", msgContent='" + msgContent + '\'' +
                ", msgImpflag='" + msgImpflag + '\'' +
                ", msgRegdate=" + msgRegdate +
                ", sendempNo=" + sendempNo +
                '}';
    }


}
