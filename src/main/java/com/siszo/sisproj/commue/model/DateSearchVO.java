package com.siszo.sisproj.commue.model;

import com.siszo.sisproj.common.SearchVO;

public class DateSearchVO extends SearchVO{
	private String startDay; 
	private String endDay; 
	private String customerId; 
	
	private String year;
	private String month;

	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay
				+ ", customerId=" + customerId + ", year=" + year + ", month="
				+ month 
				+ ", currentPage="
				+ getCurrentPage() 
				+ ", firstRecordIndex=" + getFirstRecordIndex()				
				+ ", recordCountPerPage=" + getRecordCountPerPage()
				+ "]";
	}
	
	
	
	
}
