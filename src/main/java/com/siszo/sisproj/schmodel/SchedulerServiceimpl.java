package com.siszo.sisproj.schmodel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.commonj.ScheduledTimerListener;
import org.springframework.stereotype.Service;

@Service
public class SchedulerServiceimpl implements SchedulerService {
	@Autowired
	private SchedulerDAO schedulerDao;
	
	public int schedulerInsert(SchedulerVO vo) {
		return schedulerDao.schedulerInsert(vo);
	}
	public List<SchedulerVO> schedulerSelectAll(int empNo){
		return schedulerDao.schedulerSelectAll(empNo);
	}
	
	public int schedulerDelete(String pschNo) {
		return schedulerDao.schedulerDelete(pschNo);
	}
	public int schedulerUpdate(SchedulerVO vo) {
		return schedulerDao.schedulerUpdate(vo);
	}
	public int schedulerContentUpdate(SchedulerVO vo) {
		return schedulerDao.schedulerContentUpdate(vo);
	}

}
