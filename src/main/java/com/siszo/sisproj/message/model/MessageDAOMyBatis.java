package com.siszo.sisproj.message.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDAOMyBatis extends SqlSessionDaoSupport implements MessageDAO {
    private String namespace = "config.mybatis.mapper.oracle.message";

    @Override
    public int insertMessage(MessageVO messageVO) {
        return getSqlSession().insert(namespace + ".insertMessage", messageVO);
    }

    @Override
    public int insertMessageRec(MessageRecVO messageRecVO) {
        return getSqlSession().insert(namespace + ".insertMessageRec", messageRecVO);
    }

    @Override
    public List<MessageVO> selectRecMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectList(namespace + ".selectRecMsgByEmpNo", messageSearchVO);
    }

    @Override
    public MessageVO selectRecMsgByRecNo(int recNo) {
        return getSqlSession().selectOne(namespace + ".selectRecMsgByRecNo", recNo);
    }

    @Override
    public int selectTotalMsgRecCount(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectOne(namespace + ".selectTotalMsgRecCount", messageSearchVO);
    }

    @Override
    public int updateImpMsg(int recNo) {
        return getSqlSession().update(namespace + ".updateImpMsg", recNo);
    }

    @Override
    public int updateReadFlag(int recNo) {
        return getSqlSession().update(namespace +".updateReadFlag", recNo);
    }

    @Override
    public List<MessageVO> selectRecMsgByEmpNoImp(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectList(namespace + ".selectRecMsgByEmpNoImp", messageSearchVO);
    }

    @Override
    public int selectTotalMsgRecImpCount(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectOne(namespace + ".selectTotalMsgRecImpCount", messageSearchVO);
    }

    @Override
    public List<MessageVO> selectSendMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectList(namespace + ".selectSendMsgByEmpNo", messageSearchVO);
    }

    @Override
    public int selectTotalMsgSendCount(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectOne(namespace + ".selectTotalMsgSendCount", messageSearchVO);
    }

    @Override
    public int updateDelMsg(int recNo) {
        return getSqlSession().update(namespace + ".updateDelMsg", recNo);
    }

    @Override
    public int delMsgUndo(int recNo) {
        return getSqlSession().update(namespace + ".delMsgUndo", recNo);
    }

    @Override
    public List<MessageVO> selectRecycleMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectList(namespace + ".selectRecycleMsgByEmpNo", messageSearchVO);
    }

    @Override
    public int selectTotalMsgRecycleCount(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectOne(namespace + ".selectTotalMsgRecycleCount", messageSearchVO);
    }

    @Override
    public MessageVO selectSendMsgByMsgNo(int msgNo) {
        return getSqlSession().selectOne(namespace + ".selectSendMsgByMsgNo", msgNo);
    }

    @Override
    public int updateSendDelMsg(int msgNo) {
        return getSqlSession().update(namespace + ".updateSendDelMsg", msgNo);
    }

    @Override
    public List<MessageVO> selectRecycleSendMsgByEmpNo(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectList(namespace + ".selectRecycleSendMsgByEmpNo", messageSearchVO);
    }

    @Override
    public int selectTotalMsgRecycleSendCount(MessageSearchVO messageSearchVO) {
        return getSqlSession().selectOne(namespace + ".selectTotalMsgRecycleSendCount", messageSearchVO);
    }

    @Override
    public int updateRealDelMsg(int recNo) {
        return getSqlSession().update(namespace + ".updateRealDelMsg", recNo);
    }

    @Override
    public int updateRealDelSendMsg(int recNo) {
        return getSqlSession().update(namespace + ".updateRealDelSendMsg", recNo);
    }

    @Override
    public int selectUnreadCount(int empNo) {
        return getSqlSession().selectOne(namespace + ".selectUnreadCount", empNo);
    }

    @Override
    public List<MessageVO> selectRecencyRecMsg(int empNo) {
        return getSqlSession().selectList(namespace + ".selectRecencyRecMsg", empNo);
    }

    @Override
    public List<MessageVO> selectRecencySendMsg(int empNo) {
        return getSqlSession().selectList(namespace + ".selectRecencySendMsg", empNo);
    }

    @Override
    public int delSendMsgUndo(int msgNo) {
        return getSqlSession().update(namespace + ".delSendMsgUndo", msgNo);
    }


}
