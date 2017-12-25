package com.siszo.sisproj.confirm.comment.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOMybatis extends SqlSessionDaoSupport implements CommentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public List<CommentVO> selectCommByCfNo(String cfNo) {
		return getSqlSession().selectList(namespace+".selectCommByCfNo",cfNo);
	}

	@Override
	public int selectCommCNTByCfNo(String cfNo) {
		return getSqlSession().selectOne(namespace+".selectCommCNTByCfNo", cfNo);
	}

	@Override
	public int insertComment(CommentVO vo) {
		return getSqlSession().insert(namespace+".insertComment", vo);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return getSqlSession().update(namespace+".updateComment", vo);
	}

	@Override
	public int deleteComment(int commNo) {
		return getSqlSession().delete(namespace+".deleteComment",commNo);
	}
	
	
}
