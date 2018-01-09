package com.siszo.sisproj.resource.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDAOMybatis extends SqlSessionDaoSupport implements ResourceDAO{
	private String namespace="config.mybatis.mapper.oracle.resource";

	@Override
	public int insertResource(ResourceVO resVo) {
		return getSqlSession().insert(namespace+".insertResource",resVo);
	}

	@Override
	public List<ResourceVO> selectResourceAll(ResourceSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectResourceAll", searchVo);
	}

	@Override
	public int selectTotalRecord() {
		return getSqlSession().selectOne(namespace+".selectTotalRecord");
	}

	@Override
	public int deleteResource(int resNo) {
		return getSqlSession().delete(namespace+".deleteResource", resNo);
	}
}
