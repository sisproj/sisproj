package com.siszo.sisproj.schmodel;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class SchedulerDAOMybatis extends SqlSessionDaoSupport implements SchedulerDAO {
	private String namespace="config.mybatis.mapper.oracle.scheduler";
	
	public int schedulerInsert(SchedulerVO vo) {
		return getSqlSession().insert(namespace+".schedulerInsert",vo);
	}
	
	public List<SchedulerVO> schedulerSelectAll(int empNo){
		return getSqlSession().selectList(namespace+".schedulerSelectAll",empNo);
	}
	
	public int schedulerDelete(String pschNo) {
		return getSqlSession().delete(namespace+".schedulerDelete",pschNo);
				
	}
	public int schedulerUpdate(SchedulerVO vo) {
		return getSqlSession().update(namespace+".schedulerUpdate",vo);
	}
	public int schedulerContentUpdate(SchedulerVO vo) {
		return getSqlSession().update(namespace+".schedulerContentUpdate",vo);
	}

}
