package com.siszo.sisproj.webhard.model;

import java.util.List;

public interface WebhardDAO {
	public int insertWebhard(WebhardVO wvo);
	public List<WebhardVO> selectWebhard();
}
