package com.siszo.sisproj.reservation.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDAO resDao;

	@Override
	public List<ReservationVO> selectReservationAll(ReservationSearchVO searchVo) {
		return resDao.selectReservationAll(searchVo);
	}
	public int insertReservation(ReservationVO resVo) {
		return resDao.insertReservation(resVo);
	}
	public List<ReservationVO> reservationNselect(){
		return resDao.reservationNselect();
	}
	
}
