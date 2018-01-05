package com.siszo.sisproj.addrbook.addrbook.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.common.AddrSearchVO;

@Repository
public class AddrBookDAOMybatis extends SqlSessionDaoSupport implements AddrBookDAO{
	private String namespace="config.mybatis.mapper.oracle.addrBook";

	@Override
	public List<AddrBookVO> selectAddrBookAll(AddrSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAddrBookAll",searchVo);
	}
	
	@Override
	public List<AddrBookVO> selectAddrBookIsDelY(AddrSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAddrBookIsDelY",searchVo);
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
	public int deleteAddrBook(int empNo) {
		return getSqlSession().delete(namespace+".deleteAddrBook", empNo);
	}

	@Override
	public int selectTotalRecordCountN(AddrSearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecordCountN",searchVo);
	}

	@Override
	public int selectTotalRecordCountY(AddrSearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecordCountY",searchVo);
	}

	@Override
	public AddrBookVO selectByAddrNo(int addrNo) {
		return getSqlSession().selectOne(namespace+".selectByAddrNo",addrNo);
	}

	@Override
	public int updateAddrBook(AddrBookVO vo) {
		return getSqlSession().update(namespace+".updateAddrBook", vo);
	}

}
