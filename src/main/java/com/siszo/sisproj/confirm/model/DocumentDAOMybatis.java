package com.siszo.sisproj.confirm.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.confirm.comment.model.CommentVO;
import com.siszo.sisproj.confirm.common.ConfirmSearchVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.employee.model.EmployeeVO;


@Repository
public class DocumentDAOMybatis extends SqlSessionDaoSupport implements DocumentDAO{
	private String namespace="config.mybatis.mapper.oracle.confirm";

	@Override
	public int selectConfirmSEQ() {
		return getSqlSession().selectOne(namespace+".selectConfirmSEQ");
	}

	@Override
	public int insertConfirmDoc(DocumentVO vo) {
		return getSqlSession().insert(namespace+".insertConfirmDoc",vo);
	}

	@Override
	public List<DocumentVO> selectAllDoc(ConfirmSearchVO svo) {
		return getSqlSession().selectList(namespace+".selectAllDoc",svo);
	}
	
	@Override
	public int totalRecordCountDoc(ConfirmSearchVO svo) {
		return getSqlSession().selectOne(namespace+".totalRecordCountDoc",svo);
	}

	@Override
	public List<DocumentVO> completeDocSelByEmpNo(int empNo) {
		return getSqlSession().selectList(namespace+".completeDocSelByEmpNo",empNo);
	}

	@Override
	public EmployeeVO selectByEmpNo(int empNo) {
		return getSqlSession().selectOne(namespace+".selectByEmpNo",empNo);
	}

	@Override
	public DocumentVO selectDocByCfNo(String cfNo) {
		return getSqlSession().selectOne(namespace+".selectDocByCfNo",cfNo);
	}

	@Override
	public int updateConfirmDoc(DocumentVO docuVo) {
		return getSqlSession().update(namespace+".updateConfirmDoc",docuVo);
	}

	@Override
	public int deleteConfirmLine(String cfNo) {
		return getSqlSession().delete(namespace+".deleteConfirmLine",cfNo);
	}

	@Override
	public int deleteDocuByCfNo(String cfNo) {
		return getSqlSession().delete(namespace+".deleteDocuByCfNo",cfNo);
	}

	@Override
	public int updateDocStatus(DocumentVO dVo) {
		return getSqlSession().update(namespace+".updateDocStatus", dVo);
	}	
}
