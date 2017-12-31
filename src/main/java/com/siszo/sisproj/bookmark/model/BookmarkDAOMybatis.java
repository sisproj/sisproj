package com.siszo.sisproj.bookmark.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDAOMybatis extends SqlSessionDaoSupport implements BookmarkDAO{
	private String namespace="config.mybatis.mapper.oracle.bookmark";

	@Override
	public String selectBookMarkByEmpNo(int empNo) {
		return getSqlSession().selectOne(namespace+".selectBookMarkByEmpNo", empNo);
	}

	@Override
	public int updateBookMark(BookmarkVO bVo) {
		return getSqlSession().update(namespace+".updateBookMark",bVo);
	}
	
	
}
