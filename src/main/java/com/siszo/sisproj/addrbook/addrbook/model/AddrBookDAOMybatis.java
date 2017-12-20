package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AddrBookDAOMybatis extends SqlSessionDaoSupport implements AddrBookDAO{
	private String namespace="config.mybatis.mapper.oracle.addrBook";

	@Override
//	public List<AddrBookVO> selectAddrBookAll(int groupNo) {
	public List<AddrBookVO> selectAddrBookAll(Map<String, Integer> map) {
		return getSqlSession().selectList(namespace+".selectAddrBookAll",map);
	}
	
	@Override
	public List<AddrBookVO> selectAddrBookIsDelY() {
		return getSqlSession().selectList(namespace+".selectAddrBookIsDelY");
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

	@Override
	public int deleteAddrBook() {
		return getSqlSession().delete(namespace+".deleteAddrBook");
	}
}
