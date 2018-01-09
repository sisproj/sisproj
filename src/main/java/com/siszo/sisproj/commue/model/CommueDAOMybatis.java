package com.siszo.sisproj.commue.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommueDAOMybatis extends SqlSessionDaoSupport implements CommueDAO{

	private String namespace = "config.mybatis.mapper.oracle.commue";

	@Override
	public int insertIn(CommueVO comVo) {
		return getSqlSession().insert(namespace+".insertIn",comVo);
	}
	@Override
	public int updateOut(int cmtNo) {
		return getSqlSession().update(namespace+".updateOut",cmtNo);
	}
	@Override
	public CommueVO selectByNo(int cmtNo) {
		return getSqlSession().selectOne(namespace+".selectByNo",cmtNo);
	}
	@Override
	public CommueVO checkCmt(int empNo) {
		return getSqlSession().selectOne(namespace+".checkCmt",empNo);
	}
	@Override
	public CommueVO selectByEmpNo(int empNo) {
		return getSqlSession().selectOne(namespace+".selectByEmpNo",empNo);
	}
	@Override
	public List<CommueVO> selectAll() {
		return getSqlSession().selectList(namespace+".selectAll");
	}
	
	@Override
	public List<Map<String, Object>> searchDate(DateSearchVO vo) {
		return getSqlSession().selectList(namespace+".searchDate",vo);
	}
	
	@Override
	public int selectInChk(int empNo) {
		return getSqlSession().selectOne(namespace+".selectInChk",empNo);
	}
	@Override
	public int selectOutChk(int empNo) {
		return getSqlSession().selectOne(namespace+".selectOutChk",empNo);
	}
	
	@Override
	public int selectTotalRecord(DateSearchVO vo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecordCount",vo);
	}
	@Override
	public List<Map<String, Object>> selectMonthList(DateSearchVO vo) {
		return getSqlSession().selectList(namespace+".selectMonthListCount",vo);
	}
	
	public List<Map<String, Object>> selectMonthListGet(int empNo){
		return getSqlSession().selectList(namespace+".selectMonthListGet",empNo);
		
	}
	@Override
	public List<Map<String, Object>> selectMonthDeptName(DateSearchVO vo) {
		return getSqlSession().selectList(namespace+".selectMonthDeptName",vo);
	}

}
