package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public List<Map<String, Object>> selectReservationAll(ReservationSearchVO searchVo);
	public int insertReservation(ReservationVO resVo);
	public int selectTotalRecord();
	public int updateConfirmY(int rvNo);
	public int updateConfirmR(int rvNo);	
	public List<ReservationVO> reservationNselect();
	public List<Map<String, Object>> reservationNotYselect();
}
