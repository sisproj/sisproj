package com.siszo.sisproj.schmodel;

import java.util.List;

public interface SchedulerService {
	public int schedulerInsert(SchedulerVO vo);
	public List<SchedulerVO> schedulerSelectAll();
}
