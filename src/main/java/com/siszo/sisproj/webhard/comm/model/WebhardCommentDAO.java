package com.siszo.sisproj.webhard.comm.model;

import java.util.List;

public interface WebhardCommentDAO {
	public int insertWebComment(WebhardCommentVO wcVo);
	public List<WebhardCommentVO> selectWebComment(int webNo);
	public int webCommCnt(int webNo);
	public int updateWebComment(WebhardCommentVO wcVo);
	public int deleteWebComment(int commNo);
}
