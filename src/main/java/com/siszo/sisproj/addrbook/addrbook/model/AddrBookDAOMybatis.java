package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AddrBookDAOMybatis extends SqlSessionDaoSupport implements AddrBookDAO{
	private String namespace="config.mybatis.mapper.oracle.addrBook";

	@Override
	public List<AddrBookVO> selectAddrBookAll() {
		return getSqlSession().selectList(namespace+".selectAddrBookAll");
	}

	@Override
	public int insertAddrBook(AddrBookVO vo) {
		return getSqlSession().insert(namespace+".insertAddrBook",vo);
	}

	@Override
	public int updateIsDelY(int addrNo) {
		return getSqlSession().update(namespace+".updateIsDelY", addrNo);
	}

	@Override
	public int updateIsDelN(int addrNo) {
		return getSqlSession().update(namespace+".updateIsDelN", addrNo);
	}
}
