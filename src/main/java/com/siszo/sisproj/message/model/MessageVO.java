package com.siszo.sisproj.message.model;

import java.sql.Timestamp;

public class MessageVO {
    private int msgNo;
    private String msgTitle;
    private String msgContent;
    private Timestamp msgRegdate;
    private int sendempNo;
    private String sendDelflag;

    private String deptName;
    private String empName;
    private String posName;
    private int empNo;

    private int recNo;
    private String msgImpflag;
    private String msgReadflag;
    private String msgDelflag;

    private int cnt;

    public MessageVO() {
    }


    public MessageVO(int msgNo, String msgTitle, String msgContent, Timestamp msgRegdate, int sendempNo, String sendDelflag) {
        this.msgNo = msgNo;
        this.msgTitle = msgTitle;
        this.msgContent = msgContent;
        this.msgRegdate = msgRegdate;
        this.sendempNo = sendempNo;
        this.sendDelflag = sendDelflag;
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

    public String getSendDelflag() {
        return sendDelflag;
    }

    public void setSendDelflag(String sendDelflag) {
        this.sendDelflag = sendDelflag;
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

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
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

    public String getMsgDelflag() {
        return msgDelflag;
    }

    public void setMsgDelflag(String msgDelflag) {
        this.msgDelflag = msgDelflag;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public String getMsgImpflag() {
        return msgImpflag;
    }

    public void setMsgImpflag(String msgImpflag) {
        this.msgImpflag = msgImpflag;
    }

    @Override
    public String toString() {
        return "MessageVO{" +
                "msgNo=" + msgNo +
                ", msgTitle='" + msgTitle + '\'' +
                ", msgContent='" + msgContent + '\'' +
                ", msgRegdate=" + msgRegdate +
                ", sendempNo=" + sendempNo +
                ", sendDelflag='" + sendDelflag + '\'' +
                ", deptName='" + deptName + '\'' +
                ", empName='" + empName + '\'' +
                ", posName='" + posName + '\'' +
                ", empNo=" + empNo +
                ", recNo=" + recNo +
                ", msgImpflag='" + msgImpflag + '\'' +
                ", msgReadflag='" + msgReadflag + '\'' +
                ", msgDelflag='" + msgDelflag + '\'' +
                ", cnt=" + cnt +
                '}';
    }
}
