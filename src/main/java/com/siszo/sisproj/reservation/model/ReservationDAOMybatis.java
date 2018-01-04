package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOMybatis extends SqlSessionDaoSupport implements ReservationDAO{
	private String namespace="config.mybatis.mapper.oracle.reservation";

	@Override
	public List<Map<String, Object>> selectReservationAll(ReservationSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectReservationAll",searchVo);
	}
	
	public int insertReservation(ReservationVO resVo) {
		return getSqlSession().insert(namespace+".insertReservation",resVo);
	}

	@Override
	public int selectTotalRecord() {
		return getSqlSession().selectOne(namespace+".selectTotalRecord");
	}

	@Override
	public int updateConfirmY(int rvNo) {
		return getSqlSession().update(namespace+".updateConfirmY",rvNo);
	}
	
	@Override
	public int updateConfirmR(int rvNo) {
		return getSqlSession().update(namespace+".updateConfirmR",rvNo);
	}

	public List<ReservationVO> reservationNselect(){
		return getSqlSession().selectList(namespace+".reservationNselect");
	}
	public List<Map<String, Object>> reservationNotYselect(int empNo){
		return getSqlSession().selectList(namespace+".reservationNotYselect",empNo);
	}

}
