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

	@Override
	public List<EmployeeVO> selectEmpListByDeptNo(int deptNo) {
		return getSqlSession().selectList(namespace+".selectEmpListByDeptNo",deptNo);
	}

	@Override
	public int insertSendDoc(ConfirmLineVO clVo) {
		return getSqlSession().insert(namespace+".insertSendDoc",clVo);
	}

	@Override
	public List<DocumentVO> selectCompleteOneType(ConfirmSearchVO csVo) {
		return getSqlSession().selectList(namespace+".selectCompleteOneType",csVo);
	}

	@Override
	public int selectCompleteAllCntOneType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectCompleteAllCntOneType",dVo);
	}

	@Override
	public int selectCompleteCntOneType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectCompleteCntOneType",dVo);
	}

	@Override
	public List<DocumentVO> selectReturnSecondType(ConfirmSearchVO csVo) {
		return getSqlSession().selectList(namespace+".selectReturnSecondType",csVo);
	}

	@Override
	public int selectReturnAllCntSecondType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectReturnAllCntSecondType",dVo);
	}

	@Override
	public int selectReturnCntSecondType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectReturnCntSecondType",dVo);
	}

	@Override
	public List<DocumentVO> selectSaveWaitThirdType(ConfirmSearchVO csVo) {
		return getSqlSession().selectList(namespace+".selectSaveWaitThirdType",csVo);
	}

	@Override
	public int selectSaveWaitAllCntThirdType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectSaveWaitAllCntThirdType",dVo);
	}

	@Override
	public int selectSaveWaitCntThirdType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectSaveWaitCntThirdType",dVo);
	}

	@Override
	public List<DocumentVO> selectReferFourType(ConfirmSearchVO csVo) {
		return getSqlSession().selectList(namespace+".selectReferFourType",csVo);
	}

	@Override
	public int selectReferCntAllFourType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectReferCntAllFourType",dVo);
	}

	@Override
	public int selectReferCntFourType(DocumentVO dVo) {
		return getSqlSession().selectOne(namespace+".selectReferCntFourType",dVo);
	}	
}
