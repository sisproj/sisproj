package com.siszo.sisproj.confirm.file.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.confirm.model.DocumentDAO;

@Repository
public class ConfirmFileDAOMybatis extends SqlSessionDaoSupport implements DocumentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";
	
	
}
