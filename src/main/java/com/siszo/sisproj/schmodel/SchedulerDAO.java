package com.siszo.sisproj.schmodel;

import java.util.List;

import org.springframework.stereotype.Repository;

public interface SchedulerDAO {
	public int schedulerInsert(SchedulerVO vo);
	public List<SchedulerVO> schedulerSelectAll(int empNo);
	public int schedulerDelete(String pschNo);
	public int schedulerUpdate(SchedulerVO vo);
}
