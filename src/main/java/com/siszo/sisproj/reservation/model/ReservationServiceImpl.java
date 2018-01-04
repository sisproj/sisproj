package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDAO resDao;

	@Override
	public List<Map<String, Object>> selectReservationAll(ReservationSearchVO searchVo) {
		return resDao.selectReservationAll(searchVo);
	}
	public int insertReservation(ReservationVO resVo) {
		return resDao.insertReservation(resVo);
	}
	@Override
	public int selectTotalRecord() {
		return resDao.selectTotalRecord();
	}
	@Override
	public int updateConfirmY(int rvNo) {
		return resDao.updateConfirmY(rvNo);
	}
	@Override
	public int updateConfirmR(int rvNo) {
		return resDao.updateConfirmR(rvNo);
	}
	public List<ReservationVO> reservationNselect(){
		return resDao.reservationNselect();
	}

}
