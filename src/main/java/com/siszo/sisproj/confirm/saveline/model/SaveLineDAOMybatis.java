package com.siszo.sisproj.confirm.saveline.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import oracle.net.aso.s;

@Repository
public class SaveLineDAOMybatis extends SqlSessionDaoSupport implements SaveLineDAO {
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public List<SaveLineVO> selectSaveLineByEmpNo(int empNo) {
		return getSqlSession().selectList(namespace+".selectSaveLineByEmpNo",empNo);
	}

	@Override
	public SaveLineVO selectSaveLineBySaveNo(int saveNo) {
		return getSqlSession().selectOne(namespace+".selectSaveLineBySaveNo",saveNo);
	}

	@Override
	public int insertSaveLine(SaveLineVO slVo) {
		return getSqlSession().insert(namespace+".insertSaveLine",slVo);
	}

	@Override
	public int updateSaveLine(SaveLineVO slVo) {
		return getSqlSession().update(namespace+".updateSaveLine", slVo);
	}

	@Override
	public int deleteSaveLine(int saveNo) {
		return getSqlSession().delete(namespace+".deleteSaveLine", saveNo);
	}
}
