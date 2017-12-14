package com.siszo.sisproj.dept.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptServiceImpl implements DeptService{
	@Autowired
	private DeptDAO deptDao;

	@Override
	public List<DeptVO> selectDeptName() {
		return deptDao.selectDeptName();
	}
}
