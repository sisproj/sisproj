package com.siszo.sisproj.commue.model;

import java.util.Date;

public class DateSearchVO{
	private String startDay;  
	private String endDay; 
	private String customerId;
	
	private String year;
	private String month;
	
	private Date day;	
	
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
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", customerId=" + customerId + ", year="
				+ year + ", month=" + month + ", day=" + day + "]";
	}
	
	
	
	
}
