package com.siszo.sisproj.webhard.model;

import java.util.List;

public interface WebhardService {
	public int insertWebhard(List<WebhardVO> wvoList);
	public List<WebhardVO> selectWebhard();
	public int deleteWebhard(int fileNo);
	public WebhardVO selectWebhardByFileNo(int fileNo);
}
