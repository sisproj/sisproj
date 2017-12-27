package com.siszo.sisproj.message.model;

public class MessageRecVO {
    private int recNo;
    private String msgReadflag;
    private int empNo;
    private int msgNo;

    public MessageRecVO() {
    }

    public MessageRecVO(int recNo, String msgReadflag, int empNo, int msgNo) {
        this.recNo = recNo;
        this.msgReadflag = msgReadflag;
        this.empNo = empNo;
        this.msgNo = msgNo;
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

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    public int getMsgNo() {
        return msgNo;
    }

    public void setMsgNo(int msgNo) {
        this.msgNo = msgNo;
    }

    @Override
    public String toString() {
        return "MessageRecVO{" +
                "recNo=" + recNo +
                ", msgReadflag='" + msgReadflag + '\'' +
                ", empNo=" + empNo +
                ", msgNo=" + msgNo +
                '}';
    }
}
