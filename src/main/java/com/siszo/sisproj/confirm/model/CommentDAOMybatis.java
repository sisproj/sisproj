package com.siszo.sisproj.confirm.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOMybatis extends SqlSessionDaoSupport implements DocumentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";
	
	
}
