package com.siszo.sisproj.reservation.model;

import java.util.List;

public class ReservationListVO {
	private List<ReservationVO> resItems;

	public List<ReservationVO> getResItems() {
		return resItems;
	}

	public void setResItems(List<ReservationVO> resItems) {
		this.resItems = resItems;
	}

	@Override
	public String toString() {
		return "ReservationListVO [resItems=" + resItems + "]";
	}
	
	
}
