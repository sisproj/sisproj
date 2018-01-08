package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.resource.model.ResourceVO;

public interface ReservationService {
	public List<Map<String, Object>> selectReservationAll(ReservationSearchVO searchVo);
	public int insertReservation(ReservationVO resVo);
	public int selectTotalRecord();
	public int updateConfirmY(int rvNo);
	public int updateConfirmR(int rvNo);	
	public List<Map<String, Object>> reservationNselect();
	public List<Map<String, Object>> reservationNotYselect(ReservationSearchVO searchVo);
	public int chkDupRes(ReservationVO resVo);
	public int updateConfirmYMulti(List<ReservationVO> list);
	public int updateConfirmRMulti(List<ReservationVO> list);
	public List<Map<String, Object>> resourceAllselect(ReservationSearchVO searchVo);
	public List<DeptVO> deptsearch();
	public int cancelReservation(int rvNo);
}
