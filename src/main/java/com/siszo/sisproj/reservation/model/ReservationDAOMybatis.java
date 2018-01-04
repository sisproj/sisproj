package com.siszo.sisproj.reservation.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOMybatis extends SqlSessionDaoSupport implements ReservationDAO{
	private String namespace="config.mybatis.mapper.oracle.reservation";

	@Override
	public List<ReservationVO> selectReservationAll(ReservationSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectReservationAll",searchVo);
	}
}
