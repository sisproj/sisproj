package com.siszo.sisproj.schmodel;

public class SchedulerVO {
	private String id;
	private String startdate;
	private String enddate;
	private String title;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "SchedulerVO [id=" + id + ", startdate=" + startdate + ", enddate=" + enddate + ", title=" + title + "]";
	}
	
	
	
	
	    
	
}
