package com.siszo.sisproj.reservation.model;

import java.util.List;

public interface ReservationDAO {

	public List<ReservationVO> selectReservationAll(ReservationSearchVO searchVo);

	public int insertReservation(ReservationVO resVo);
	public List<ReservationVO> reservationNselect();
}
