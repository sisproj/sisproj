package com.siszo.sisproj.confirm.comment.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOMybatis extends SqlSessionDaoSupport implements CommentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";
	
	
}
