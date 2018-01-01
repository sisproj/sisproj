package com.siszo.sisproj.webhard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebhardServiceImpl implements WebhardService{
	@Autowired
	private WebhardDAO wDao;

	@Override
	public int insertWebhard(List<WebhardVO> wvoList) {
		int cnt = 0;
		
		for(WebhardVO wvo : wvoList) {
			cnt = wDao.insertWebhard(wvo);
		}
		
		return cnt;
	}

	@Override
	public List<WebhardVO> selectWebhard() {
		return wDao.selectWebhard();
	}

	@Override
	public int deleteWebhard(int fileNo) {
		return wDao.deleteWebhard(fileNo);
	}

	@Override
	public WebhardVO selectWebhardByFileNo(int fileNo) {
		return wDao.selectWebhardByFileNo(fileNo);
	}
	
}
