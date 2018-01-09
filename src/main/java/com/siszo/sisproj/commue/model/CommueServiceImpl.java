package com.siszo.sisproj.commue.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommueServiceImpl implements CommueService{

	@Autowired
	private CommueDAO commueDao;
	
	@Override
	public List<CommueVO> selectAll() {
		return commueDao.selectAll(); 
	}

	@Override
	public int insertIn(CommueVO comVo) {	
		return commueDao.insertIn(comVo);
	}

	@Override
	public int updateOut(int cmtNo) {
		return commueDao.updateOut(cmtNo);
	}	

	@Override
	public CommueVO selectByEmpNo(int empNo) {
		return commueDao.selectByEmpNo(empNo);
	}

	@Override
	public List<Map<String, Object>> searchDate(DateSearchVO vo) {
		return commueDao.searchDate(vo);
	}

	@Override
	public int selectInChk(int empNo) {
		int cnt = commueDao.selectInChk(empNo);
		int result=0;
		if(cnt==0) {
			result=CHECK_IN;	
		}else {
			result=CHECK_IN_OK;
		}
		return result;
	}

	@Override
	public int selectOutChk(int empNo) {
		int cnt = commueDao.selectOutChk(empNo);
		int result=0;
		if(cnt==0) {
			result=CHECK_OUT;
		}else {
			result=CHECK_OUT_OK;
		}
		return result;
	}

	@Override
	public int selectTotalRecord(DateSearchVO vo) {
		return commueDao.selectTotalRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectMonthListCount(DateSearchVO vo) {
		return commueDao.selectMonthList(vo); 
	}
	
	public List<Map<String, Object>> selectMonthListGet(int empNo){
		return commueDao.selectMonthListGet(empNo); 
	}

	@Override
	public List<Map<String, Object>> selectMonthDeptName(DateSearchVO vo) {
		return commueDao.selectMonthDeptName(vo);
	}
}
