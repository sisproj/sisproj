package com.siszo.sisproj.webhard.model;

import java.util.List;

public interface WebhardService {
	//웹하드 리스트 페이지 정보
	public static final int RECORD_COUNT_PER_PAGE=15; //페이지당 보여질 레코드 수
	public static final int BLOCK_SIZE=7; //블럭당 보여질 페이지 수
	
	public int insertWebhard(List<WebhardVO> wvoList);
	public List<WebhardVO> selectWebhard();
	public int deleteWebhard(int fileNo);
	public WebhardVO selectWebhardByFileNo(int fileNo);
}
