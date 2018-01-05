package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;

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
	public List<Map<String, Object>> reservationNotYselect(int empNo){
		return resDao.reservationNotYselect(empNo);
	}
	public int chkDupRes(ReservationVO resVo) {
		return resDao.chkDupRes(resVo);
	}
	public int deleteTimeOver() {
		return resDao.deleteTimeOver();
	}
	
	@Override
	@Transactional
	public int updateConfirmYMulti(List<ReservationVO> list) {
		int cnt=0;
		try {
			for (ReservationVO vo : list) {
				int rvNo=vo.getRvNo();
				if(rvNo!=0) {
					cnt=resDao.updateConfirmY(rvNo);
				}
			}
		}catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	@Transactional
	public int updateConfirmRMulti(List<ReservationVO> list) {
		int cnt=0;
		try {
			for (ReservationVO vo : list) {
				int rvNo=vo.getRvNo();
				if(rvNo!=0) {
					cnt=resDao.updateConfirmR(rvNo);
				}
			}
		}catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		
		return cnt;
	}
}
