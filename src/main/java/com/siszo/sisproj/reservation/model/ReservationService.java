package com.siszo.sisproj.reservation.model;

import java.util.List;

public interface ReservationService {
	public List<ReservationVO> selectReservationAll();
	public int insertReservation(ReservationVO resVo);
}
