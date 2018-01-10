package com.siszo.sisproj.reservation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.resource.model.ResourceVO;

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
	public List<Map<String, Object>> reservationNselect(){
		return resDao.reservationNselect();
	}
	public List<Map<String, Object>> reservationNotYselect(ReservationSearchVO searchVo){
		return resDao.reservationNotYselect(searchVo);
	}
	public int chkDupRes(ReservationVO resVo) {
		return resDao.chkDupRes(resVo);
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
	public List<Map<String, Object>> resourceAllselect(ReservationSearchVO searchVo){
		return resDao.resourceAllselect(searchVo);
	}
	public List<DeptVO> deptsearch(){
		return resDao.deptsearch();
	}
	
	public int cancelReservation(int rvNo) {
		return resDao.cancelReservation(rvNo);
	}
	@Override
	public List<Map<String, Object>> selectReservationAllAMD(ReservationSearchVO searchVo) {
		return resDao.selectReservationAllAMD(searchVo);
	}

	@Override
	public int selectTotalRecordAll() {
		return resDao.selectTotalRecordAll();
	}

	@Override
	@Transactional
	public int deleteResMulti(List<ReservationVO> list) {
		int cnt=0;
		try {
			for (ReservationVO vo : list) {
				int rvNo=vo.getRvNo();
				if(rvNo!=0) {
					cnt=resDao.cancelReservation(rvNo);
				}
			}
		}catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		
		return cnt;
	}
	
}
