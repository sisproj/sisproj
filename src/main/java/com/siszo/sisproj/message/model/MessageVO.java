package com.siszo.sisproj.message.model;

import java.sql.Timestamp;

public class MessageVO {
    private int msgNo;
    private String msgTitle;
    private String msgContent;
    private String msgImpflag;
    private Timestamp msgRegdate;
    private int sendempNo;

    private String deptName;
    private String empName;
    private String posName;

    private int recNo;
    private String msgReadflag;

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

    public int getRecNo() {
        return recNo;
    }

    public void setRecNo(int recNo) {
        this.recNo = recNo;
    }

    public String getMsgReadflag() {
        return msgReadflag;
    }

    public void setMsgReadflag(String msgReadflag) {
        this.msgReadflag = msgReadflag;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getPosName() {
        return posName;
    }

    public void setPosName(String posName) {
        this.posName = posName;
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
                ", deptName='" + deptName + '\'' +
                ", empName='" + empName + '\'' +
                ", posName='" + posName + '\'' +
                ", recNo=" + recNo +
                ", msgReadflag='" + msgReadflag + '\'' +
                '}';
    }
}
