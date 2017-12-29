package com.siszo.sisproj.message.model;

import com.siszo.sisproj.common.MessageSearchVO;
import com.siszo.sisproj.common.SearchVO;
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
}
