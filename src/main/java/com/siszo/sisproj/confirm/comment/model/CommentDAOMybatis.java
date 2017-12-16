package com.siszo.sisproj.confirm.comment.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.confirm.model.DocumentDAO;

@Repository
public class CommentDAOMybatis extends SqlSessionDaoSupport implements DocumentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";
	
	
}
