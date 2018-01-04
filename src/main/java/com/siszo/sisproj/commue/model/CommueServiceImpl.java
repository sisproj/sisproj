package com.siszo.sisproj.commue.model;

import java.util.List;

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
	/*if(cmtVo.getCmtStatus().equals("Y")) {
				result=CHECK_IN_OK;			
			}else if(!cmtVo.getCmtStatus().equals("Y")) {
				result=CHECK_IN;
			}else if(cmtVo.getCmtStatus().equals("N")) {
				result=CHECK_OUT_OK;			
			}else if(!cmtVo.getCmtStatus().equals("N")) {
				result=CHECK_OUT;		
			}*/

	@Override
	public CommueVO selectByEmpNo(int empNo) {
		return commueDao.selectByEmpNo(empNo);
	}
}
