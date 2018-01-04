package com.siszo.sisproj.resource.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDAOMybatis extends SqlSessionDaoSupport implements ResourceDAO{

	String namespace="config.mybatis.mapper.oracle.resource";
	public List<ResourceVO> resourceAllselect(){
		return getSqlSession().selectList(namespace+".resourceAllselect");
	}
	
}
