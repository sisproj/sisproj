package com.siszo.sisproj.common;

public class SchedulerUtility {
	private String[] EMonths = {"Jan","Feb","Mar","Apr","May","Jun","Jul",
			"Aug","Sep","Oct","Nov","Dec"};
	private String[] KMonths = {"01","02","03","04","05","06","07",
			"08","09","10","11","12"};

	public String ChangeDate(String Date) {
		String day = Date.substring(8,10); //몇일인지
		String qMonth = Date.substring(4,7);//영어 월
		String years = Date.substring(11,15);//년도
		String times = Date.substring(16,21);//시간
		String Month = "";

		for(int i=0;i<EMonths.length;i++) {
			if(qMonth.equals(EMonths[i])) {
				Month+=KMonths[i];
				break;
			}
		}

		return years+"-"+Month+"-"+day+" "+times;
	}
	
} 

