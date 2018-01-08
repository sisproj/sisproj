package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.resource.model.ResourceVO;

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

	public List<Map<String, Object>> reservationNselect(){
		return getSqlSession().selectList(namespace+".reservationNselect");
	}
	public List<Map<String, Object>> reservationNotYselect(ReservationSearchVO searchVo){
		return getSqlSession().selectList(namespace+".reservationNotYselect",searchVo);
	}
	public int chkDupRes(ReservationVO resVo) {
		return getSqlSession().selectOne(namespace+".chkDupRes",resVo);
	}
	public List<Map<String, Object>> resourceAllselect(ReservationSearchVO searchVo){
		return getSqlSession().selectList(namespace+".resourceAllselect",searchVo);
	}
	public List<DeptVO> deptsearch(){
		return getSqlSession().selectList(namespace+".deptsearch");
	}

	@Override
	public List<Map<String, Object>> selectReservationAllAMD(ReservationSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectReservationAllAMD",searchVo);
	}

	@Override
	public int selectTotalRecordAll() {
		return getSqlSession().selectOne(namespace+".selectTotalRecordAll");
	}
	

}
